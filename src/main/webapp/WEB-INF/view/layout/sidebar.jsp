<!-- sidebar.jsp -->
<!-- Cột sidebar bên trái -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="col-md-3 bg-light vh-100 border-end">
    <h5 class="p-3">Menu Quản trị</h5>
    <ul class="nav flex-column px-3">
        <li class="nav-item mb-2"><a href="/dashboard" class="nav-link">Bảng điều khiển</a></li>
        <li class="nav-item mb-2"><a href="/admin/user" class="nav-link">Quản lý người dùng</a></li>
        <li class="nav-item mb-2"><a href="/admin/product" class="nav-link">Quản lý sản phẩm</a></li>
        <li class="nav-item mb-2"><a href="/admin/order" class="nav-link">Quản lý đơn hàng</a></li>
        <li class="nav-item mt-3"><a href="/logout" class="nav-link text-danger">Đăng xuất</a></li>
    </ul>
</div>

