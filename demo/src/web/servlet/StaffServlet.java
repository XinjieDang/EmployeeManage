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
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StaffServlet",urlPatterns = "/staffControl")
public class StaffServlet extends HttpServlet {
    StaffService staffService=new StaffServicelmpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action=request.getParameter("action2");
        if("savaStaff".equals(action)){
            saveStaff(request,response);

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

    private void saveStaff(HttpServletRequest request, HttpServletResponse response){
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              String action=request.getParameter("action1");
              if("showlist".equals(action)){
                  showList(request,response);
              }else if("addStaff".equals(action)){
                  request.setAttribute("mainPage", "staff/staff_add.jsp");
                  DepartmentService departmentService=new DepartmentServicelmpl();
                  JobService jobService=new JobServicelmpl();
                  List<Department> dept_list=departmentService.findAll();
                  List<Job> job_list=jobService.findAll();
                  request.setAttribute("dept_list",dept_list);
                  request.setAttribute("job_list",job_list);
                  request.getRequestDispatcher("/index.jsp").forward(request, response);
              }
    }
}
