package web.servlet;
import domain.Department;
import domain.Job;
import domain.Staff;
import org.apache.commons.beanutils.BeanUtils;
import service.DepartmentService;
import service.JobService;
import service.StaffService;
import service.imp.DepartmentServicelmpl;
import service.imp.JobServicelmpl;
import service.imp.StaffServicelmpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StaffServlet",urlPatterns = "/staffControl")
public class StaffServlet extends HttpServlet {
    StaffService staffService=new StaffServicelmpl();
    JobService jobService=new JobServicelmpl();
    DepartmentService departmentService=new DepartmentServicelmpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action=request.getParameter("action2");
        if("savaStaff".equals(action)){
            saveStaff(request,response);
        }else if("moreSearch".equals(action)){
            moreFind(request,response);
        }

    }
    private void showList(HttpServletRequest request, HttpServletResponse response){
        //1、调用 StaffService 完成查询
        List<Staff> staffs=staffService.get_StaffList();
        //2、将查询出的list集合存入request域
        request.setAttribute("staffs",staffs);
        //3、跳转到list.jsp
        request.setAttribute("mainPage", "staff/staff_list.jsp");
        try {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void saveStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        Staff staff=new Staff();
        try {
            BeanUtils.populate(staff, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用Service保存
        String id=request.getParameter("sta_id");
        String flag=request.getParameter("flag");
        String password=request.getParameter("password");
        if("2".equals(flag)){
            staffService.updatePwd(password,id);
//            request.setAttribute("mainPage", "staff/staff_detail.jsp");
            request.getRequestDispatcher("/index_staff.jsp").forward(request, response);
        }else if("1".equals(flag)){
            staffService.updateStaff(staff);
            //5.跳转到dept_list.jsp
            showList(request,response);
        }
        else {
            staffService.addStaff(staff);
            //5.跳转到dept_list.jsp
            showList(request,response);
        }



    }
    private void delStaff(HttpServletRequest request, HttpServletResponse response){
        String Id = request.getParameter("sta_id");
        //2.调用service删除
        staffService.delStaff(Id);
        //3.跳转到查询所有Servlet
        //4、更新职工人数保存到session
        HttpSession session = request.getSession();
        int count_staff=staffService.count_staff();
        session.setAttribute("count_staff",count_staff);
        request.setAttribute("del_msg","删除成功！");
        showList(request,response);
    }
    private void updateStaff(HttpServletRequest request, HttpServletResponse response){
        Map<String, String[]> map = request.getParameterMap();
        Staff staff=new Staff();
        try {
            BeanUtils.populate(staff, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用Service保存
        staffService.addStaff(staff);
        //5.跳转到dept_list.jsp
        showList(request,response);
    }
    private void findStaff(HttpServletRequest request, HttpServletResponse response){
        String id=request.getParameter("staffId");
        Staff staff=staffService.fin_StaffList(id);
        //2、将查询出的list集合存入request域
        request.setAttribute("stas",staff);
        List<Department> dept=departmentService.findAll();
        List<Job> job=jobService.findAll();
        request.setAttribute("dept_staff",dept);
        request.setAttribute("job_staff",job);

    }
    private void moreFind(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> map = request.getParameterMap();
        Staff staff=new Staff();
        try {
            BeanUtils.populate(staff, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用Service保存
        List<Staff> staffs=staffService.morefind_get_StaffList(staff);
        //2、将查询出的list集合存入request域
        request.setAttribute("staffs",staffs);
        //3、跳转到list.jsp
        request.setAttribute("mainPage", "staff/staff_list.jsp");
        try {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              String action=request.getParameter("action1");
              if("showlist".equals(action)){
                  showList(request,response);
              }else if("addStaff".equals(action)){
                  request.setAttribute("mainPage", "staff/staff_add.jsp");
                  List<Department> dept_list=departmentService.findAll();
                  List<Job> job_list=jobService.findAll();
                  request.setAttribute("dept_list",dept_list);
                  request.setAttribute("job_list",job_list);
                  request.getRequestDispatcher("/index.jsp").forward(request, response);
              }else if("delStaff".equals(action)){
                  delStaff(request,response);
              }else if("findStaff".equals(action)){
                  findStaff(request,response);
                  String detail=request.getParameter("detail");
                  String pwd=request.getParameter("pwd");
                  if(detail!=null){
                      request.setAttribute("mainPage", "staff/staff_detail.jsp");
                      request.getRequestDispatcher("/index_staff.jsp").forward(request, response);
                  }else if(pwd!=null){
                      request.setAttribute("mainPage", "staff/staff_uppwd.jsp");
                      request.getRequestDispatcher("/index_staff.jsp").forward(request, response);
                  }
                  else {
                      request.setAttribute("mainPage", "staff/staff_edit.jsp");
                      request.getRequestDispatcher("/index.jsp").forward(request, response);
                  }


              }else if ("exit".equals(action)) {
                  request.getSession().removeAttribute("staff");
                  response.sendRedirect("login.jsp");
              }
    }
}
