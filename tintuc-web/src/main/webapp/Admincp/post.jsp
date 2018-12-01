<%@ page import="vn.haui.web.command.CategoryDao" %>
<%@ page import="vn.haui.web.model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.haui.web.model.Post" %>
<%@ page import="vn.haui.web.command.PostDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="header.jsp"/>
<%
    PostDao postDao = new PostDao();
    ArrayList<Post> posts = postDao.getListAllPost();
%>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tables</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    DataTables Advanced Tables
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Tác giả</th>
                            <th>Chuyên mục</th>
                            <th>Ngày đăng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (Post c : posts) {%>
                        <tr class="odd gradeX">
                            <td><%=c.getPostID()%></td>
                            <td><a href="post.jsp?post=<%=c.getPostID()%>&action=edit"><%=c.getPostTitle()%></a>
                                <div class="row-actions">
                                    <span class="edit"><a href="post.jsp?post=<%=c.getPostID()%>&action=edit" aria-label="Sửa “Beauty”">Chỉnh sửa</a> | </span>
                                    <span class="delete"><a href="" class="delete-tag aria-button-if-js" data-toggle="modal" data-target="#delete<%=c.getPostID()%>" aria-label="Xóa “Beauty”" role="button">Xóa</a> | </span>
                                    <!-- Modal -->
                                    <div class="modal fade" id="delete<%=c.getPostID()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                            <td><%=c.getAuthorID()%></td>
                            <td><%=c.getCategoryID()%></td>
                            <td><%=c.getPostDate()%></td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <!-- /.table-responsive -->
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
