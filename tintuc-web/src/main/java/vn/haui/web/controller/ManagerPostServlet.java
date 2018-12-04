package vn.haui.web.controller;

import vn.haui.web.command.PostDao;
import vn.haui.web.model.Post;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/ManagerPostServlet")
public class ManagerPostServlet extends HttpServlet {
    PostDao postDao=new PostDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post post;
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String url = "/Admincp/edit-post.jsp", error = "", result = "", error_slug = "";
        String command = request.getParameter("command");
        String postTitle = request.getParameter("post-title");
        String postSlug = request.getParameter("post-slug");

        if (postDao.checkPostSlug(postSlug) && postSlug != "") {
            error_slug = "Trường này phải là duy nhất";
            request.setAttribute("error-slug", error_slug);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
        try {
            switch (command) {
                case "insert":
                    if (postTitle.equals("") || postTitle == null) {
                        error = "Không thể bỏ trống tên tiêu đề !";
                    } else {
                        post = new Post();
                        post.setPostTitle(postTitle);
                        if (!postSlug.equals("")) {
                            post.setPostSlug(postSlug);
                        } else {
                            post.setPostSlug(postDao.createPostSlug(postTitle));
                        }
                        post.setPostContent(request.getParameter("post-content"));
                        post.setPostDate(postDao.GetDateNow());
                        post.setAuthorID(1);
                        post.setPostImg(request.getParameter("ImagePath"));
                        post.setCategoryID(1);
                        post.setPostStatus("Public");
                        //request.getParameter("category-father");
                        postDao.insert(post);
                        result = "Thêm thành công";
                    }
                    break;
                case "edit":
                    if (postTitle.equals("") || postTitle == null) {
                        error = "Không thể bỏ trống tên tiêu đề !";
                    } else {
                        post = new Post();
                        post.setPostTitle(postTitle);
                        if (!postSlug.equals("")) {
                            post.setPostSlug(postSlug);
                        } else {
                            post.setPostSlug(postDao.createPostSlug(postTitle));
                        }
                        post.setPostContent(request.getParameter("post-content"));
                        post.setPostDate(postDao.GetDateNow());
                        post.setAuthorID(1);
                        post.setPostImg(request.getParameter("ImagePath"));
                        post.setCategoryID(1);
                        post.setPostStatus("Public");
                        //request.getParameter("category-father");
                        postDao.update(post);
                        result = "Cập nhập thành công";
                    }

                    break;
                case "delete":
                    postDao.delete(Integer.parseInt(request.getParameter("post-ID")));
                    //url = "/Admincp/post.jsp";
                    break;
                default:
                    result = "Thêm không thành công";
                    //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        request.setAttribute("error", error);
        request.setAttribute("result", result);
        //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        case "delete":
//        postDao.delete(Integer.parseInt(request.getParameter("post-ID")));
//        url = "/Admincp/post.jsp";
//        break;
    }
}
