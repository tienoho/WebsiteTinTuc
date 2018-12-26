<%@ page import="vn.haui.web.common.WebConstant" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/11/2018
  Time: 4:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-search"></i></button></span>
                </div>
                <!-- /input-group -->
            </li>
            <li><a href="${root}/Admincp/"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
            <li>
                <a href="#"><i class="fa fa-book fa-fw"></i> Bài viết<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="${root}/Admincp/post.jsp">Tất cả bài viết</a></li>
                    <li><a href="${root}/Admincp/edit-post.jsp">Bài viết mới</a></li>
                    <li><a href="${root}/Admincp/category.jsp">Chuyên mục</a></li>
                    <li><a href="${root}/Admincp/tag.jsp">Thẻ</a></li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li><a href="${root}/Admincp/upload.jsp"><i class="fa fa-upload fa-fw"></i>Thư viện<span class="fa arrow"></span></a></li>
            <li><a href="${root}/Admincp/setting.jsp"><i class="fa fa-wrench fa-fw"></i> Cài đặt</a></li>
            <li><a href="${root}/Admincp/comment.jsp"><i class="fa fa-edit fa-fw"></i> Bình luận</a></li>
            <li>
                <a href="#"><i class="fa fa-user fa-fw"></i>Giao diện<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="#">Header</a></li>
                    <li><a href="${root}/Admincp/edit-footer.jsp">Footer</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa-user fa-fw"></i> Thành viên<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="<%=WebConstant.getLocalHost()%>/Admincp/user.jsp">Tất cả thành viên</a></li>
                    <li><a href="<%=WebConstant.getLocalHost()%>/Admincp/add-user.jsp">Thêm thành viên</a></li>
                    <li><a href="<%=WebConstant.getLocalHost()%>/Admincp/profile.jsp">Hồ sơ của bạn</a></li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li><a href="#"><i class="fa fa-sitemap fa-fw"></i>Phản hồi<span class="fa arrow"></span></a></li>
            <li><a href="#"><i class="fa fa-sitemap fa-fw"></i>Quảng cáo<span class="fa arrow"></span></a></li>
            <li><a href="${root}/Admincp/social.jsp"><i class="fa fa-sitemap fa-fw"></i>Mạng xã hội<span class="fa arrow"></span></a></li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
