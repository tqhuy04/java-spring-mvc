<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-10">
            <h3 class="mt-4">Danh sách người dùng</h3>
            <a href="${pageContext.request.contextPath}/admin/user/create" class="btn btn-success mb-3">Thêm người dùng</a>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Họ tên</th>
                        <th>Điện thoại</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.email}</td>
                            <td>${user.fullName}</td>
                            <td>${user.phone}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}" class="btn btn-sm btn-primary">Sửa</a>
                                <a href="${pageContext.request.contextPath}/admin/user/delete/${user.id}" class="btn btn-sm btn-danger" onclick="return confirm('Xoá người dùng này?')">Xoá</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
