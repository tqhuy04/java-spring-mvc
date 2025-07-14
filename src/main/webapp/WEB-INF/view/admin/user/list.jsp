<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách người dùng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2 class="mb-4">Danh sách người dùng</h2>
    <a href="/admin/user/create" class="btn btn-primary mb-3">Thêm người dùng</a>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Họ tên</th>
                <th>SĐT</th>
                <th>Địa chỉ</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.email}</td>
                <td>${user.fullName}</td>
                <td>${user.phone}</td>
                <td>${user.address}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}"class="btn btn-primary mb-3">Sửa</a>
                    <a href="${pageContext.request.contextPath}/admin/user/delete/${user.id}" onclick="return confirm('Xác nhận xoá?')"class="btn btn-primary mb-3">Xoá</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
