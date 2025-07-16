<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
    <form action="${pageContext.request.contextPath}/auth/register" method="post" class="p-4 border rounded shadow-sm bg-white w-50">
        <h4 class="mb-3 text-center">Dang ki tai khoan</h4>

        <%-- Hiển thị lỗi nếu có --%>
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>

        <%-- Hiển thị message thành công nếu có --%>
        <c:if test="${not empty message}">
            <div class="alert alert-success" role="alert">${message}</div>
        </c:if>

        <div class="form-group mb-3">
            <label for="username">Ten dang nhap:</label>
            <input type="text" name="username" id="username" class="form-control" required />
        </div>

        <div class="form-group mb-3">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" class="form-control" required />
        </div>

        <div class="form-group mb-3">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-success btn-block w-100">Đang ki</button>

        <div class="mt-3 text-center">
            <span>Da co tai khoan?</span>
            <a href="${pageContext.request.contextPath}/auth/login" class="text-primary font-weight-bold">Dang nhap ngay</a>
        </div>
    </form>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
