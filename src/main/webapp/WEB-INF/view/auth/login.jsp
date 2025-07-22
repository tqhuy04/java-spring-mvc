<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Đăng nhập</title>

            <!-- ✅ Bootstrap 4 CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        </head>

        <body class="bg-light">

            <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
                <form action="${pageContext.request.contextPath}/auth/login" method="post"
                    class="p-4 border rounded shadow-sm bg-white w-100" style="max-width: 400px;">
                    <h4 class="mb-3 text-center">Đăng nhập</h4>

                    <!-- ✅ Hiển thị lỗi nếu có -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>

                    <div class="form-group">
                        <label for="username">Tên đăng nhập:</label>
                        <input type="text" name="username" id="username" class="form-control" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Mật khẩu:</label>
                        <input type="password" name="password" id="password" class="form-control" required />
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>

                    <!-- ✅ Gợi ý đăng ký -->
                    <div class="mt-3 text-center">
                        <span>Bạn chưa có tài khoản?</span>
                        <a href="${pageContext.request.contextPath}/auth/register"
                            class="text-primary font-weight-bold">Đăng ký ngay</a>
                    </div>
                </form>
            </div>

            <!-- ✅ Bootstrap 4 JS (jQuery + Popper + Bootstrap) -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        </body>

        </html>