package web.servlet;

import domain.Department;
import org.apache.commons.beanutils.BeanUtils;
import service.DepartmentService;
import service.imp.DepartmentServicelmpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DeptServlet",urlPatterns = "/deptControl")
public class DeptServlet extends HttpServlet {

    DepartmentService departmentService=new DepartmentServicelmpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action=request.getParameter("action2");
        if("savaDept".equals(action)){
            savaDept(request,response);
        }

    }
    private void showList(HttpServletRequest request, HttpServletResponse response){

        List<Department>depts=departmentService.findAll();
        //2、将查询出的list集合存入request域
        request.setAttribute("depts",depts);
        //3、跳转到list.jsp
        request.setAttribute("mainPage", "dept/dept_list.jsp");
        try {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void savaDept(HttpServletRequest request, HttpServletResponse response){
        Map<String, String[]> map = request.getParameterMap();
        Department dept=new Department();
        try {
            BeanUtils.populate(dept, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //4.调用Service保存
        departmentService.adddepartment(dept);
        //5.跳转到dept_list.jsp
        showList(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action=request.getParameter("action1");
        if("showlist".equals(action)){
            showList(request,response);
        } else if ("adddept".equals(action)) { // 添加
            request.setAttribute("mainPage", "dept/dept_add.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }
}
