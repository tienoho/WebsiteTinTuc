<%@ page import="vn.haui.web.common.WebConstant" %>
<%@ page import="vn.haui.web.model.Users" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/11/2018
  Time: 4:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<%
    Users users=null;
    if(session.getAttribute("user")!=null)
    {
        users=(Users)session.getAttribute("user");
    }

%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Admin - <%=WebConstant.getBlogname()%></title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=WebConstant.getLocalHost()%>/Admincp/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="<%=WebConstant.getLocalHost()%>/Admincp/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=WebConstant.getLocalHost()%>/Admincp/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="<%=WebConstant.getLocalHost()%>/Admincp/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="<%=WebConstant.getLocalHost()%>/Admincp/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <%--<link href="<%=WebConstant.getLocalHost()%>/Admincp/vendor/morrisjs/morris.css" rel="stylesheet">--%>
    <!-- Custom Fonts -->
    <link href="<%=WebConstant.getLocalHost()%>/Admincp/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>    <![endif]-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script src="<c:url value="<%=WebConstant.getLocalHost()%>/ckeditor/ckeditor.js" />"></script>
    <script src="<c:url value="<%=WebConstant.getLocalHost()%>/ckfinder/ckfinder.js" />"></script>
    <link href="<%=WebConstant.getLocalHost()%>/Admincp/dist/css/bootstrap-select.css" rel="stylesheet">
    <%--<script src="<c:url value="<%=WebConstant.getLocalHost()%>/ckfinder/plugins/imageresize/plugin.js" />"></script>--%>
</head>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=WebConstant.getLocalHost()%>">Website tin tức</a>
        </div>
        <!-- /.navbar-header -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> Nhận xét mới
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 Bài viết mới
                                <span class="pull-right text-muted small">12 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>Xem tất cả thông báo</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-alerts -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <span><%=users.getFullName()%></span>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>Thông tin người dùng</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Thiết lập</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<%=WebConstant.getLocalHost()%>/logout"><i class="fa fa-sign-out fa-fw"></i> Đăng xuất</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->
<jsp:include page="menu.jsp"></jsp:include>
    </nav>
