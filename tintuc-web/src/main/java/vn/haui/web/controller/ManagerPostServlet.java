package vn.haui.web.controller;

import vn.haui.web.command.PostDao;
import vn.haui.web.command.TermsRelationshipsDao;
import vn.haui.web.common.WebConstant;
import vn.haui.web.model.Post;
import vn.haui.web.model.TermsRelationships;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ManagerPostServlet")
public class ManagerPostServlet extends HttpServlet {
    PostDao postDao = new PostDao();
    TermsRelationshipsDao termsRelationshipsDao = new TermsRelationshipsDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        Post post;
        TermsRelationships termsRelationships;

        String url =WebConstant.localHost+"/Admincp/edit-post.jsp", error = "", result = "", error_slug = "";
        String command = request.getParameter("command");
        String postTitle = request.getParameter("post-title");
        String postSlug = "";
        HttpSession session = request.getSession(false);
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
                        session.setAttribute("error", error);
                    } else {
                        post = new Post();
                        post.setPostTitle(postTitle);
                        post.setPostSlug(postDao.createPostSlug(postTitle));
                        post.setPostContent(request.getParameter("post-content"));
                        post.setPostDate(postDao.GetDateNow());
                        post.setAuthorID(1);
                        post.setPostImg(request.getParameter("ImagePath"));
                        post.setCategoryID(1);
                        post.setPostStatus("Public");
                        post.setPostSummary(request.getParameter("post-summary"));
                        request.getParameter("category-father");
                        postDao.insert(post);
                        int postID = postDao.getPostIDBySlug(post.getPostSlug());
                        String[] selectedCategoryList = request.getParameterValues("category");
                        for (String s : selectedCategoryList) {
                            System.out.println(s);
                            termsRelationships = new TermsRelationships(postID, Integer.parseInt(s), 0);
                            termsRelationshipsDao.insert(termsRelationships);
                        }
                        result = "Thêm thành công";
                        url = WebConstant.localHost+"/Admincp/edit-post.jsp?post=" + postID + "&action=edit";
                        //if request is not from HttpServletRequest, you should do a typecast before
                        //save message in session
                        session.setAttribute("result", result);
                    }
                    break;
                case "update":
                    if (postTitle.equals("") || postTitle == null) {
                        error = "Không thể bỏ trống tên tiêu đề !";
                        //request.setAttribute("error", error);
                        session.setAttribute("error", error);
                    } else {
                        post = new Post();

                        post.setPostTitle(postTitle);
                        postSlug=request.getParameter("post-slug");
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
                        if(request.getParameter("postID")!=null)
                        {
                            post.setPostID(Integer.parseInt(request.getParameter("postID")));
                        }
                        //request.getParameter("category-father");
                        postDao.update(post);
                        String[] selectedCategoryList = request.getParameterValues("category");
                        if(selectedCategoryList!=null){
                            termsRelationshipsDao.delete(post.getPostID());
                            for (String s : selectedCategoryList) {
                                termsRelationships = new TermsRelationships(post.getPostID(), Integer.parseInt(s), 0);
                                termsRelationshipsDao.insert(termsRelationships);
                            }
                        }

                        result = "Cập nhập thành công";
                        session.setAttribute("result", result);
                        url = WebConstant.localHost+"/Admincp/edit-post.jsp?post=" + post.getPostID() + "&action=edit";
                    }
                    break;
                case "delete":
                    postDao.delete(Integer.parseInt(request.getParameter("post-ID")));
                    termsRelationshipsDao.delete(Integer.parseInt(request.getParameter("post-ID")));
                    //url = "/Admincp/post.jsp";
                    break;
                default:
                    result = "Thêm không thành công";
                    //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            result = "Cập không thành công";
            session.setAttribute("result", result);
        }
        response.sendRedirect(url);
        //request.setAttribute("result", result);
        //response.sendRedirect(WebConstant.localHost + "/Admincp/category.jsp");
        //RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        //rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        String url="";
        switch (command) {
            case "delete":
                try {
                    postDao.delete(Integer.parseInt(request.getParameter("post")));
                    termsRelationshipsDao.delete(Integer.parseInt(request.getParameter("post")));
                    url = WebConstant.localHost+ "/Admincp/post.jsp";
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
        response.sendRedirect(url);
    }
}
