<%@ page import="vn.haui.web.command.CategoryDao" %>
<%@ page import="vn.haui.web.model.Category" %>
<%@ page import="java.util.ArrayList" %><%--
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
<%
    CategoryDao categoryDao = new CategoryDao();
    ArrayList<Category> categories = categoryDao.getListCategory();
%>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Chuyên mục</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-4">
            <form role="form">
                <div class="form-group">
                    <label>Tên chuyên mục</label>
                    <input class="form-control">
                    <p class="help-block">Tên riêng sẽ hiển thị trên trang mạng của bạn.</p>
                </div>
                <div class="form-group">
                    <label>Chuỗi cho đường dẫn tĩnh</label>
                    <input class="form-control">
                    <p class="help-block">Chuỗi cho đường dẫn tĩnh là phiên bản của tên hợp chuẩn với Đường dẫn (URL).
                        Chuỗi này bao gồm chữ cái thường, số và dấu gạch ngang (-).</p>
                </div>
                <div class="form-group">
                    <label>Chuyên mục hiện tại</label>
                    <select class="form-control">
                        <%for (Category c : categories) {%>
                        <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                         <%}%>
                    </select>
                    <p class="help-block">Chuyên mục khác với thẻ, bạn có thể sử dụng nhiều cấp chuyên mục. Ví dụ: Trong
                        chuyên mục nhạc, bạn có chuyên mục con là nhạc Pop, nhạc Jazz. Việc này hoàn toàn là tùy theo ý
                        bạn.</p>
                </div>
                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea class="form-control" rows="3"></textarea>
                    <p class="help-block">Thông thường mô tả này không được sử dụng trong các giao diện, tuy nhiên có
                        vài giao diện có thể hiển thị mô tả này.</p>
                </div>

                <button type="submit" class="btn btn-success">Thêm chuyên mục</button>
            </form>
        </div>
        <!-- /.col-lg-4 (nested) -->
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Kitchen Sink
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Des</th>
                                <th>Slug</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%for (Category c : categories) {%>
                            <tr>
                                <td><%=c.getCategoryID()%>
                                </td>
                                <td><a href="post.jsp?category=<%=c.getCategoryID()%>&action=edit"><%=c.getCategoryName()%></a>
                                    <div class="row-actions">
                                        <span class="edit"><a href="post.jsp?post=<%=c.getCategoryID()%>&action=edit" aria-label="Sửa “Beauty”">Chỉnh sửa</a> | </span>
                                        <span class="delete"><a href="" class="delete-tag aria-button-if-js" data-toggle="modal" data-target="#delete<%=c.getCategoryID()%>" aria-label="Xóa “Beauty”" role="button">Xóa</a> | </span>
                                        <!-- Modal -->
                                        <div class="modal fade" id="delete<%=c.getCategoryID()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Delete</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                       Bạn có chắc chắn muốn xóa chuyên mục này không ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary">Delete</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->
                                        <span class="view"><a href="" aria-label="Xem lưu trữ “Beauty”">Xem</a></span>
                                    </div>
                                </td>
                                <td><%=c.getCategoryDes() == null ? "" : c.getCategoryDes()%>
                                </td>
                                <td><%=c.getCategorySlug()%>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
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
