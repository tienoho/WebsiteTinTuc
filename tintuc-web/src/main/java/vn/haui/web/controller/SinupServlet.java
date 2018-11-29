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


@WebServlet("/SinupServlet")
public class SinupServlet extends HttpServlet {
    UsersDao usersDao = new UsersDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "";
        String command = request.getParameter("command");
        Users users = null;
        String email = "";
        String password = "";
        if ("insert".equals(command)) {
            //Register
            email = request.getParameter("email");
            password = request.getParameter("password");
            String fullName = request.getParameter("fullname");
            password = UsersDao.encryption(password);
            //DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date myDate = (Calendar.getInstance().getTime());
            java.sql.Date sqlDateNow = new java.sql.Date(myDate.getTime());
            users = new Users(email, password, fullName, sqlDateNow, 1);
            if (usersDao.insertUser(users)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", users);
                url = "/index.jsp";
            } else {
                request.setAttribute("errorR","Đăng kí không thành công");
                request.setAttribute("actionR","class=\"active\"");

                url = "/sinup";
            }

        } else if ("login".equals(command)) {
            //Login
            email = request.getParameter("emailLogin");
            password = request.getParameter("passwordLogin");
            users = usersDao.login(email, UsersDao.encryption(password));
            if (users != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", users);
                url = "/index.jsp";
            } else {
                request.setAttribute("errorL", "Email hoặc mât khẩu không đúng");
                request.setAttribute("actionL","class=\"active\"");
                url = "/sinup";
            }
        }
        response.sendRedirect(url);
//        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
