<%@ page import="vn.haui.web.command.PostDao" %>
<%@ page import="vn.haui.web.common.WebConstant" %>
<%@ page import="vn.haui.web.model.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.haui.web.utils.tool" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/11/2018
  Time: 1:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%
    PostDao postDao = new PostDao();
    String categorySlug = request.getRequestURL().toString();
    //System.out.println(categorySlug);
    categorySlug = categorySlug.substring(categorySlug.lastIndexOf("/") + 1);
    System.out.println(request.getRequestURL                 ());
    //int category_id = 0;=
    int category_id = postDao.getCategoyID(categorySlug);
    System.out.println(category_id);

    int total = 0;
    if (request.getParameter("categoryID") != null) {
        category_id = Integer.parseInt(request.getParameter("categoryID"));
        //category_id = Integer.parseInt(request.getAttribute("categoryID").toString());
        //total = postDao.getCountPostByCategoy(category_id);
        total = postDao.getCountPostByCategoyTerm(category_id);
    } else {
        // total = postDao.getCountPostByCategoy(category_id);
        total = postDao.getCountPostByCategoyTerm(category_id);
    }

    int pages = 1, firstResult = 0, maxResult = 0;
    if (request.getParameter("pages") != null) {
        pages = Integer.parseInt(request.getParameter("pages"));
        //pages = Integer.parseInt(request.getAttribute("pages").toString());
    }
    if (total <= WebConstant.getPostNumber()) {
        firstResult = 0;
        maxResult = total;
    } else {
        firstResult = (pages - 1) * WebConstant.getPostNumber();
        maxResult = WebConstant.getPostNumber();
    }
    //ArrayList<Post> listPost = postDao.getListProductByPages(category_id, firstResult, maxResult);
    ArrayList<Post> listPost = postDao.getListProductByPagesInTerm(category_id, firstResult, maxResult);
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
            <h2 class="main-heading">Chuyên đề: <strong>${pageContext.request.requestURI}</strong></h2>
            <div class="posts-list listing-alt">
                <%-- for (Post p : postDao.getListPostByCategory(WebConstant.textCategoryID, category_id))--%>
                <% for (Post p : listPost) {%>
                <article
                        class="post-<%=p.getPostID()%> post type-post status-publish format-standard has-post-thumbnail category-business category-lifestyle tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                    <div class="post-wrap">
                        <a href="${root}/post/<%=p.getPostSlug()%>" class="image-link">
                            <img width="312" height="198"
                                 src="${root}/<%=p.getPostImg()%>"
                                 class="attachment-list-block size-list-block wp-post-image"
                                 alt="shutterstock_485005621"
                                 title="Rachel Runs a Business by Her Own Set of Rules"
                                 srcset="${root}/<%=p.getPostImg().replace(".jpg","-312x198.jpg")%> 312w, ${root}/<%=p.getPostImg().replace(".jpg","-163x102.jpg")%> 163w"
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
                                <%=tool.html2text(p.getPostContent()).substring(0, 50)%><%=WebConstant.tobeContime%>
                            </div>
                        </div>
                    </div>
                </article>
                <%}%>
            </div>
            <div class="main-pagination">
                <%
                    int cout = total / WebConstant.getPostNumber();
                    if (pages > 1) {
                %>
                <a class="prev page-numbers"
                   href="${root}/Category/categorySlug?categoryID=<%=category_id%>&pages=<%=pages-1%>">
                    <i class="fa fa-angle-left"></i>
                    <span class="visuallyhidden">Previous</span>
                </a>
                <%}%>
                <%
                    for (int i = 1; i <= (cout) + 1; i++) {
                        if (i == pages) {
                %>
                <span class='page-numbers current'><%=i%></span>
                <%
                } else {
                %>
                <a class='page-numbers'
                   href='${root}/Category/categorySlug?categoryID=<%=category_id%>&pages=<%=i%>'><%=i%>
                </a>
                <%
                        }
                    }
                    if (pages >= cout && cout > 1) {
                %>
                <a class="next page-numbers"
                   href="${root}/Category/categorySlug?categoryID=<%=category_id%>&pages=<%=pages+1%>">
                    <span class="visuallyhidden">Next</span>
                    <i class="fa fa-angle-right"></i>
                </a>
                <%
                    }
                %>

            </div>
        </div>
        <jsp:include page="sidebar-category.jsp"/>
    </div>
</div>
<jsp:include page="footer.jsp"/>