<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/11/2018
  Time: 11:10 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="header.jsp"/>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Bài viết mới</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-10">
            <form role="form" action="${root}/MCategoryServlet" method="post">
                <div class="form-group">
                    <label>Tên chuyên mục</label>
                    <span name="category-name-result" class="danger"></span>
                    <input class="form-control" id="category-name" name="category-name">
                    <p class="help-block">Tên riêng sẽ hiển thị trên trang mạng của bạn.</p>
                </div>
                <div class="form-group">
                    <label>Chuỗi cho đường dẫn tĩnh</label>
                    <input class="form-control" id="category-slug" name="category-slug">
                    <span id="category-slug-result"></span>
                    <p class="help-block">Chuỗi cho đường dẫn tĩnh là phiên bản của tên hợp chuẩn với Đường dẫn (URL).
                        Chuỗi này bao gồm chữ cái thường, số và dấu gạch ngang (-).</p>
                </div>

                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea class="form-control" rows="3" id="category-des" name="category-des"></textarea>
                    <p class="help-block">Thông thường mô tả này không được sử dụng trong các giao diện, tuy nhiên có
                        vài giao diện có thể hiển thị mô tả này.</p>
                </div>
                <input hidden="hidden" name="command" value="insert">
                <span name="category-result"></span>
                <button type="submit" class="btn btn-success">Thêm chuyên mục</button>
            </form>
        </div>
        <!-- /.col-lg-4 (nested) -->
        <div class="col-lg-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Kitchen Sink
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">

                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->

    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
<jsp:include page="footer.jsp"/>
