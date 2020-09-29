package web.servlet;
import domain.User;
import service.UserService;
import service.imp.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userListServlet")
public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1、调用 UserService 完成查询
        UserService userservice=new UserServiceImpl();
        List<User> users=userservice.findAll();
        //2、将查询出的list集合存入request域
        request.setAttribute("users",users);
        //3、跳转到list.jsp
        request.setAttribute("mainPage", "admin/userlist.jsp");
        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }
}
