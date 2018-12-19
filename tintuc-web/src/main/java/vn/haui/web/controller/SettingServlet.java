package vn.haui.web.controller;

import vn.haui.web.command.SettingDao;
import vn.haui.web.model.Setting;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/SettingServlet")
public class SettingServlet extends HttpServlet {
    SettingDao settingDao = new SettingDao();
    Setting setting;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String url = "/Admincp/setting.jsp", error = "", result = "", error_slug = "";
        String blogname = request.getParameter("blogname");
        String blogdescription = request.getParameter("blogdescription");
        String siteurl = request.getParameter("siteurl");
        String admin_email = request.getParameter("admin_email");
        String post_home = request.getParameter("post_home");
        String post_category = request.getParameter("post_category");
        String post_home_sub = request.getParameter("post_home_sub");
        String category_home_sub_one = request.getParameter("category_home_sub_one");

        HttpSession session = request.getSession(false);
        if (blogname != null && !blogname.equals("")) {
            setting = new Setting(1, "blogname", blogname);
            setSetting(setting);
        }else {
            session.setAttribute("error_blogname","Tên Website không thể để trống");
        }
        if (blogdescription != null && !blogdescription.equals("")) {
            setting = new Setting(1, "blogdescription", blogdescription);
            setSetting(setting);
        }
        if (siteurl != null && !siteurl.equals("")) {
            setting = new Setting(1, "siteurl", siteurl);
            setSetting(setting);
        }
        else {
            session.setAttribute("error_siteurl","Không thể để trống địa chỉ website");
        }
        if (admin_email != null && !admin_email.equals("")) {
            setting = new Setting(1, "admin_email", admin_email);
            setSetting(setting);
        }
        if (post_home != null && !post_home.equals("")) {
            setting = new Setting(1, "post_home", post_home);
            setSetting(setting);
        }
        if (post_category != null && !post_category.equals("")) {
            setting = new Setting(1, "post_category", post_category);
            setSetting(setting);
        }if (post_category != null && !post_category.equals("")) {
            setting = new Setting(1, "post_home_sub", post_home_sub);
            setSetting(setting);
        }if (post_category != null && !post_category.equals("")) {
            setting = new Setting(1, "category_home_sub_one", category_home_sub_one);
            setSetting(setting);
        }
        //HttpSession session = request.getSession(false);
        response.sendRedirect(url);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void setSetting(Setting s) {
        try {
            settingDao.update(s);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}