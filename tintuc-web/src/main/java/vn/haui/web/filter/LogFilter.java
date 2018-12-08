package vn.haui.web.filter;


import com.ckfinder.connector.errors.ConnectorException;
import vn.haui.web.command.PostDao;
import vn.haui.web.common.WebConstant;
import vn.haui.web.model.Post;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.ckfinder.connector.ServletContextFactory.getServletContext;

public class LogFilter implements Filter {
    public LogFilter()
    {

    }
    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        System.out.println("LogFilter init!");
    }

    @Override
    public void destroy() {
        System.out.println("LogFilter destroy!");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;

        String servletPath = req.getServletPath();
        List<Post> postList=null;
        try {
             postList=new PostDao().getListAllPost();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String slug=servletPath.replace("/","");
        Post post = postList.stream()
                .filter(customer -> slug.equals(customer.getPostSlug()))
                .findAny()
                .orElse(null);

        System.out.println("#INFO " + new Date() + " - ServletPath :" + servletPath //
                + ", URL =" + req.getRequestURL());
        if(post==null)
        {
            // Cho phép request được đi tiếp. (Vượt qua Filter này).
            chain.doFilter(request, response);
        }
        else {

            HttpSession session = ((HttpServletRequest) request).getSession(false);
            session.setAttribute("postProuct",post);
            String url="/singe?post="+post.getPostID();
            request.setAttribute("postId",post.getPostID());
            request.getRequestDispatcher(url).forward(request, response);
        }

    }
}
