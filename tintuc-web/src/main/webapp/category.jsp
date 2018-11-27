<%@ page import="vn.haui.web.command.PostDao" %>
<%@ page import="vn.haui.web.common.WebConstant" %>
<%@ page import="vn.haui.web.model.Post" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/11/2018
  Time: 1:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PostDao postDao = new PostDao();

    String category_id = "";
    if (request.getParameter("category") != null) {
        category_id = request.getParameter("category");
    }
%>
<jsp:include page="header.jsp"/>
<div class="breadcrumbs-wrap">
    <div class="wrap">
        <div class="breadcrumbs">
            <span class="location">You are at:</span>
            <span itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a
                    itemprop="url" href="../../index.html">
                <span itemprop="title">Home</span>
            </a>
            </span>
            <span class="delim">&raquo;</span>
            <span class="current">Category: "Business"</span>
        </div>
    </div>
</div>
<div class="main wrap cf">
    <div class="row">
        <div class="col-8 main-content">
            <h2 class="main-heading">Chuyên đề: <strong>Business</strong></h2>
            <div class="posts-list listing-alt">
                <% for (Post p : postDao.getListPostByCategory(WebConstant.textCategoryID, Integer.parseInt(category_id))) {%>
                <article
                        class="post-<%=p.getPostID()%> post type-post status-publish format-standard has-post-thumbnail category-business category-lifestyle tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                    <div class="post-wrap">
                        <a href="single.jsp?post=<%=p.getPostID()%>" class="image-link">
                            <img width="312" height="198"
                                 src="<%=p.getPostImg()%>"
                                 class="attachment-list-block size-list-block wp-post-image"
                                 alt="shutterstock_485005621"
                                 title="Rachel Runs a Business by Her Own Set of Rules"
                                 srcset="<%=p.getPostImg().replace(".jpg","-312x198.jpg")%> 312w, <%=p.getPostImg().replace(".jpg","-163x102.jpg")%> 163w"
                                 sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content">
                            <a href="single.jsp?post=<%=p.getPostID()%>"
                               class="post-title"><%=p.getPostTitle()%>
                            </a>
                            <div class="cf listing-meta meta below">
                                <span class="meta-item author">By <a href="#" title="Posts by Kate Hanson" rel="author">Kate Hanson</a>
                                </span>
                                <time datetime="2017-01-10T02:32:37+00:00" class="meta-item">January 10, 2017</time>
                            </div>
                            <div class="excerpt">
                                <%--content--%>
                                <%=p.getPostContent().substring(0,50)%><%=WebConstant.tobeContime%>
                            </div>
                        </div>
                    </div>
                </article>
                <%}%>
            </div>
            <div class="main-pagination"><span class='page-numbers current'>1</span>
                <a class='page-numbers' href='page/2/index.html'>2</a>
                <a class="next page-numbers" href="page/2/index.html">
                    <span class="visuallyhidden">Next</span>
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
        <jsp:include page="sidebar-category.jsp"/>
    </div>
</div>
<jsp:include page="footer.jsp"/>