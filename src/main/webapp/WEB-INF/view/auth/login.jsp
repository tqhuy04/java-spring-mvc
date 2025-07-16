<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
    <form action="${pageContext.request.contextPath}/auth/login" method="post" class="p-4 border rounded shadow-sm bg-white w-50">
        <h4 class="mb-3 text-center">Đăng nhập</h4>

        <!-- ✅ Hiển thị lỗi nếu có -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>

        <div class="form-group mb-3">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" name="username" id="username" class="form-control" required />
        </div>

        <div class="form-group mb-4">
            <label for="password">Mật khẩu:</label>
            <input type="password" name="password" id="password" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-primary btn-block w-100">Đăng nhập</button>

        <!-- ✅ Gợi ý đăng ký -->
        <div class="mt-3 text-center">
            <span>Bạn chưa có tài khoản?</span>
            <a href="${pageContext.request.contextPath}/auth/register" class="text-primary font-weight-bold">Đăng ký ngay</a>
        </div>
    </form>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
