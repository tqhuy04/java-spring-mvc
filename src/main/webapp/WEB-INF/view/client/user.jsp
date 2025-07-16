<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Thông tin người dùng</h4>
        </div>
        <div class="card-body">
            <table class="table table-bordered w-75">
                <tr>
                    <th scope="row">Tên đăng nhập</th>
                    <td>${user.username}</td>
                </tr>
                <tr>
                    <th scope="row">Email</th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th scope="row">Họ và tên</th>
                    <td>${user.fullName}</td>
                </tr>
                <tr>
                    <th scope="row">Số điện thoại</th>
                    <td>${user.phone}</td>
                </tr>
                <tr>
                    <th scope="row">Địa chỉ</th>
                    <td>${user.address}</td>
                </tr>
                <tr>
                    <th scope="row">Vai trò</th>
                    <td>${user.role}</td>
                </tr>
            </table>

            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">← Quay lại Dashboard</a>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
