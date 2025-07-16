<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-10">
            <h3 class="mb-4">Tạo người dùng mới</h3>

            <form method="post" action="${pageContext.request.contextPath}/admin/user/create">
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required />
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <input type="password" class="form-control" id="password" name="password" required />
                </div>

                <div class="mb-3">
                    <label for="fullName" class="form-label">Họ tên:</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required />
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại:</label>
                    <input type="text" class="form-control" id="phone" name="phone" />
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ:</label>
                    <input type="text" class="form-control" id="address" name="address" />
                </div>

                <button type="submit" class="btn btn-success">Tạo mới</button>
                <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-secondary">Danh sách</a>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
