package vn.haui.web.controller;

import vn.haui.web.command.UsersDao;
import vn.haui.web.model.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Calendar;


@WebServlet("/Sinup")
public class SinupServlet extends HttpServlet {
    UsersDao usersDao = new UsersDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "";
        String command = request.getParameter("command");
        if ("insert".equals(command)) {
            //Register
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullname");
            password = UsersDao.encryption(password);
            //DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date myDate = (Calendar.getInstance().getTime());
            java.sql.Date sqlDateNow = new java.sql.Date(myDate.getTime());
            Users users = new Users(email, password, fullName, sqlDateNow, 1);
            if(usersDao.insertUser(users)){
                HttpSession session = request.getSession();
                session.setAttribute("user", users);
                url = "index.jsp";
                RequestDispatcher rd=getServletContext().getRequestDispatcher(url);
                rd.forward(request,response);
            }else {

            }

        } else {
            //Login
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
