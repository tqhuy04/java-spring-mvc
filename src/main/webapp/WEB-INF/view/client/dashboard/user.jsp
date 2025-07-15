<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.Hoc_Java_mua_xuan.domain.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"user".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("/auth/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-success">
        <h2>Xin chào, <%= user.getFullName() %>!</h2>
        <p>Email: <strong><%= user.getEmail() %></strong></p>
        <p>Vai trò: <strong><%= user.getRole() %></strong></p>
    </div>

    <div class="list-group">
        <a href="/user/profile" class="list-group-item list-group-item-action">Hồ sơ cá nhân</a>
        <a href="/products" class="list-group-item list-group-item-action">Xem sản phẩm</a>
        <a href="/auth/logout" class="list-group-item list-group-item-action text-danger">Đăng xuất</a>
    </div>
</div>
</body>
</html>
