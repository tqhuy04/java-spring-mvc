<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Chỉnh sửa người dùng</h2>

    <form action="${pageContext.request.contextPath}/admin/user/update/${user.id}" method="post" class="border p-4 bg-white shadow-sm rounded">
    <input type="hidden" name="_method" value="put">

    <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" name="email" id="email" value="${user.email}" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Mật khẩu:</label>
        <input type="password" name="password" id="password" value="${user.password}" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="fullName" class="form-label">Họ và tên:</label>
        <input type="text" name="fullName" id="fullName" value="${user.fullName}" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="address" class="form-label">Địa chỉ:</label>
        <input type="text" name="address" id="address" value="${user.address}" class="form-control">
    </div>

    <div class="mb-3">
        <label for="phone" class="form-label">Số điện thoại:</label>
        <input type="text" name="phone" id="phone" value="${user.phone}" class="form-control">
    </div>

    <button type="submit" class="btn btn-primary">Cập nhật</button>
    <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-secondary">Quay lại</a>
</form>

</div>

</body>
</html>
