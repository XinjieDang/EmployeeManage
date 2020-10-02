package web.servlet;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.imp.UserServiceImpl;
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

@WebServlet(name = "UserServlet",urlPatterns = "/Useroperate")
public class UserServlet extends HttpServlet {
    UserService service = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action2");
        if ("savaUser".equals(action)) {
            add_User(request, response);
        } else if ("updateUser".equals(action)) {
            updateUser(request, response);
        }else if("searchadmin".equals(action)){
            searchadmin(request,response);
        }

    }

    private void add_User(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> map = request.getParameterMap();
        //3.封装对象
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //4.调用Service保存
        UserService service = new UserServiceImpl();
        service.addUser(user);

        //5.跳转到userListServlet
        try {
            response.sendRedirect(request.getContextPath() + "/userListServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void delUser(HttpServletRequest request, HttpServletResponse response) {
        String Id = request.getParameter("userId");
        //2.调用service删除
        UserService service = new UserServiceImpl();
        service.deleteUser(Id);
        HttpSession session = request.getSession();
        int count=service.conunt();
        //更新管理员人数，将统计管理员信息存入session
        session.setAttribute("user_count",count);
        //3.跳转到查询所有Servlet
        try {
            response.sendRedirect(request.getContextPath() + "/userListServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        //2.获取map
        Map<String, String[]> map = request.getParameterMap();
        //3.封装对象
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //4.调用Service修改
        service.updateUser(user);
        //5.跳转到查询所有Servlet
        try {
            response.sendRedirect(request.getContextPath() + "/userListServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void findUser(HttpServletRequest request, HttpServletResponse response){
        //1.获取id
        String id = request.getParameter("userId");
        //2.调用Service查询
        User user = service.findUserByid(id);
        //3.将user存入request
        request.setAttribute("user",user);
        //4.转发到user_edit.jsp
    }
    private void searchadmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取用户名字
        String userText=request.getParameter("user_text");
        //调用Service查询
        List<User> user=service.findUserByname(userText);
        //将user存入request
        request.setAttribute("user_text",userText);
        request.setAttribute("users",user);
        //3、跳转到list.jsp
        request.setAttribute("mainPage", "admin/userlist.jsp");
        request.getRequestDispatcher("/index.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action1");
        if ("addUser".equals(action)) { // 添加
            request.setAttribute("mainPage", "admin/user_add.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if ("delUser".equals(action)) {
            delUser(request, response);
        } else if ("findUser".equals(action)) {
            findUser(request,response);
            request.setAttribute("mainPage", "admin/user_edit.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }else if ("exit".equals(action)) {
                request.getSession().removeAttribute("user");
                response.sendRedirect("login.jsp");
            }
    }
}
