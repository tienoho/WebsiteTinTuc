<%--
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
                    <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                </div>
                <!-- /input-group -->
            </li>
            <li>
                <a href="${root}/Admincp/"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-book fa-fw"></i> Bài viết<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${root}/Admincp/post.jsp">Tất cả bài viết</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/edit-post.jsp">Bài viết mới</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/category.jsp">Chuyên mục</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/tag.jsp">Thẻ</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="${root}/Admincp/upload.jsp"><i class="fa fa-upload fa-fw"></i> Thư viện<span class="fa arrow"></span></a>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${root}/Admincp/pages/flot.html">Flot Charts</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/pages/morris.html">Morris.js Charts</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="${root}/Admincp/pages/tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
            </li>
            <li>
                <a href="${root}/Admincp/pages/forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${root}/Admincp/pages/panels-wells.html">Panels and Wells</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/pages/buttons.html">Buttons</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/pages/notifications.html">Notifications</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/pages/typography.html">Typography</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/pages/icons.html"> Icons</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/pages/grid.html">Grid</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="#">Second Level Item</a>
                    </li>
                    <li>
                        <a href="#">Second Level Item</a>
                    </li>
                    <li>
                        <a href="#">Third Level <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="#">Third Level Item</a>
                            </li>
                            <li>
                                <a href="#">Third Level Item</a>
                            </li>
                            <li>
                                <a href="#">Third Level Item</a>
                            </li>
                            <li>
                                <a href="#">Third Level Item</a>
                            </li>
                        </ul>
                        <!-- /.nav-third-level -->
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${root}/Admincp/pages/blank.html">Blank Page</a>
                    </li>
                    <li>
                        <a href="${root}/Admincp/pages/login.html">Login Page</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
