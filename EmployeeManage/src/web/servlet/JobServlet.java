package web.servlet;
import domain.Department;
import domain.Job;
import org.apache.commons.beanutils.BeanUtils;
import service.JobService;
import service.imp.JobServicelmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "JobServlet",urlPatterns ="/jobControl")
public class JobServlet extends HttpServlet {
    JobService jobService=new JobServicelmpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action=request.getParameter("action2");
        if("savaJob".equals(action)){
            savaJob(request,response);
        }else if("updateJob".equals(action)){
            updateJob(request,response);
        }else if("searchjob".equals(action)){
            searchjob(request,response);
        }

    }

    private void savaJob(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> map = request.getParameterMap();
        Job job=new Job();
        try {
            BeanUtils.populate(job, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用Service保存
        jobService.addjob(job);
        //5.跳转到job_list.jsp
        showList(request,response);

    }
    private void updateJob(HttpServletRequest request,HttpServletResponse response){
        Map<String, String[]> map = request.getParameterMap();
        Job job=new Job();
        try {
            BeanUtils.populate(job, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用Service保存
        jobService.updaeJob(job);
        //5.跳转到job_list.jsp
        showList(request,response);

    }
    private void findJob(HttpServletRequest request,HttpServletResponse response){
        String id=request.getParameter("job_Id");
        Job job= jobService.getinfoById(Integer.parseInt(id));
        request.setAttribute("job",job);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action=request.getParameter("action1");
        if("showlist".equals(action)){
            showList(request,response);
        }else if ("addjob".equals(action)) { // 添加
            request.setAttribute("mainPage", "job/job_add.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else if ("delJob".equals(action)) {
            delJob(request,response);
        }
        else if ("findJob".equals(action)) {
            findJob(request,response);
            request.setAttribute("mainPage", "job/job_Edit.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Job> jobs=jobService.findAll();
        //2、将查询出的list集合存入request域
        request.setAttribute("jobs",jobs);
        //3、跳转到list.jsp
        request.setAttribute("mainPage", "job/job_list.jsp");
        try {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void delJob(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("job_Id");
        jobService.deleteJob(id);
        showList(request,response);


    }
    private void searchjob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String job_text=request.getParameter("job_text");
        List<Job> Job= jobService.findByname(job_text);
        request.setAttribute("jobname_v",job_text);
        request.setAttribute("jobs",Job);
        //3、跳转到list.jsp
        request.setAttribute("mainPage", "job/job_list.jsp");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
