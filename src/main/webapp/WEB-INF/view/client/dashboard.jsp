<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<div class="container mt-5">
    <h3>Chào mừng, ${user.fullName}!</h3>
    <p>Đây là trang dashboard người dùng.</p>

    <a href="${pageContext.request.contextPath}/client/user/profile" class="btn btn-primary">Xem thông tin cá nhân</a>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
