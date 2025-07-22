<div class="sidebar">
    <h5>Menu Quản trị</h5>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="${pageContext.request.requestURI.contains('/dashboard') ? 'active' : ''}">
        Bảng điều khiển
    </a>
    <a href="${pageContext.request.contextPath}/admin/user" class="${pageContext.request.requestURI.contains('/user') ? 'active' : ''}">
        Quản lý người dùng
    </a>
    <a href="${pageContext.request.contextPath}/admin/product" class="${pageContext.request.requestURI.contains('/product') ? 'active' : ''}">
        Quản lý sản phẩm
    </a>
    <a href="${pageContext.request.contextPath}/admin/order" class="${pageContext.request.requestURI.contains('/order') ? 'active' : ''}">
        Quản lý đơn hàng
    </a>
    <a href="${pageContext.request.contextPath}/logout" class="logout">Đăng xuất</a>
</div>
