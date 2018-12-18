<%--
  Created by IntelliJ IDEA.
  User: Tam
  Date: 12/3/2018
  Time: 5:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="header.jsp"/>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Cài đặt</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Basic Form Elements
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <form role="form" method="post" action="${root}/SettingServlet">
                                <div class="form-group">
                                    <label>Tên website</label>
                                    <input class="form-control" name="blogname">
                                </div>
                                <div class="form-group">
                                    <label>Khẩu hiệu</label>
                                    <input class="form-control" name="blogdescription">
                                    <p class="help-block">Giới thiệu về website</p>
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ trang web(URL)</label>
                                    <input class="form-control" name="siteurl">
                                    <p class="help-block">Nhập địa chỉ website của bạn.</p>
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ email</label>
                                    <input class="form-control" name="admin_email">
                                    <p class="help-block">Địa chỉ này được sử dụng cho mục đích quản trị.</p>
                                </div>
                                <div class="form-group">
                                    <label>Hiển thị số bài viết ở trang chủ</label>
                                    <input class="form-control" type="number" name="post_home">
                                    <p class="help-block">Số bài viết xuất hiện ở trang chủ.</p>
                                </div>
                                <div class="form-group">
                                    <label>Hiển thị số bài viết</label>
                                    <input class="form-control" type="number" name="post_category">
                                    <p class="help-block">Số bài viết xuất hiện mỗi trang ở chuyên mục.</p>
                                </div>
                                <button type="submit" class="btn btn-default">Lưu thay đổi</button>
                            </form>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
<jsp:include page="footer.jsp"/>