<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.Hoc_Java_mua_xuan.domain.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("/auth/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons (tuỳ chọn) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <div class="col-md-3 bg-light vh-100 p-4 border-end">
            <h4 class="mb-4">🔧 Admin Menu</h4>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/user"><i class="bi bi-people-fill"></i> Quản lý người dùng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/product"><i class="bi bi-box-seam"></i> Quản lý sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-danger" href="/auth/logout"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>
                </li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 p-5">
            <div class="alert alert-primary">
                <h2>Chào mừng, Admin <%= user.getFullName() %>!</h2>
                <p>Email: <strong><%= user.getEmail() %></strong></p>
                <p>Vai trò: <strong><%= user.getRole() %></strong></p>
            </div>

            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card text-bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">👤 Người dùng</h5>
                            <p class="card-text">Quản lý danh sách, thêm/sửa/xoá user.</p>
                            <a href="/admin/user" class="btn btn-light">Xem ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-bg-info mb-3">
                        <div class="card-body">
                            <h5 class="card-title">📦 Sản phẩm</h5>
                            <p class="card-text">Thêm, xoá hoặc cập nhật sản phẩm.</p>
                            <a href="/admin/product" class="btn btn-light">Xem ngay</a>
                        </div>
                    </div>
                </div>
            </div>

        </div> <!-- End Main Content -->

    </div>
</div>
</body>
</html>
