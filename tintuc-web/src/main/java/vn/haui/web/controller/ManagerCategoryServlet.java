package vn.haui.web.controller;

import vn.haui.web.command.CategoryDao;
import vn.haui.web.common.WebConstant;
import vn.haui.web.model.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MCategoryServlet")

public class ManagerCategoryServlet extends HttpServlet {
    CategoryDao categoryDao = new CategoryDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category category;
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String url = "/Admincp/category.jsp", error = "", result = "",error_slug="";
        String command = request.getParameter("command");
        String categoryName = request.getParameter("category-name");
        String categorySlug = request.getParameter("category-slug");

        if (categoryDao.checkCategorySlug(categorySlug)&&categorySlug!="") {
            error_slug="Trường này phải là duy nhất";
            request.setAttribute("error-slug", error_slug);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
        if (categoryName.equals("")) {
            error = "Không thể bỏ trống tên danh mục !";
            //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
        } else {
            try {
                switch (command) {
                    case "insert":
                        category = new Category();
                        category.setCategoryName(categoryName);
                        if(!categorySlug.equals(""))
                        {
                            category.setCategorySlug(categorySlug);
                        }else {
                            category.setCategorySlug(categoryDao.createCategorySlug(categoryName));
                        }
                        category.setCategoryDes(request.getParameter("category-des"));
                        //request.getParameter("category-father");
                        categoryDao.insert(category);
                        result = "Thêm thành công";
                        //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
                        break;
                    case "edit":
                        category = new Category();
                        category.setCategoryName(request.getParameter("category-name"));
                        category.setCategorySlug(request.getParameter("category-slug"));
                        category.setCategoryDes(request.getParameter("category-des"));
                        category.setCategoryID(Integer.parseInt(request.getParameter("categoryID")));
                        //request.getParameter("category-father");
                        categoryDao.update(category);
                        result = "Cập nhập thành công";
                        //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
                        break;
                    case "delete":
                        categoryDao.delete(Integer.parseInt(request.getParameter("category-ID")));
                        //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
                        break;
                    default:
                        result = "Thêm không thành công";
                        //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
                        break;
                }
            } catch (Exception ex) {

            }
        }

        request.setAttribute("error", error);
        request.setAttribute("result", result);
        //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String url = "", error = "";
        String command = request.getParameter("action");
        String categoryID = request.getParameter("category-id");
        switch (command) {
            case "delete":
                break;
        }
    }
}
