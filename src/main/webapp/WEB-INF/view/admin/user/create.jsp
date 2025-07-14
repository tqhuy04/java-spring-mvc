<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tạo người dùng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2 class="mb-4">Tạo người dùng mới</h2>

    <form method="post" action="/admin/user/create">
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
        <a href="/admin/user" class="btn btn-secondary">Danh sách</a>
    </form>
</body>
</html>
