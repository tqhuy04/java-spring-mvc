<!-- Thêm vào file admin.jsp hoặc file layout riêng -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 bg-light vh-100 p-3 border-end">
            <h5 class="mb-4">Admin Menu</h5>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/user">👤 Quản lý người dùng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/product">📦 Quản lý sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-danger" href="/auth/logout">🚪 Đăng xuất</a>
                </li>
            </ul>
        </div>

        <!-- Main content -->
        <div class="col-md-9 p-4">
            <h2>Chào mừng, Admin!</h2>
            <p>Đây là bảng điều khiển quản trị. Hãy chọn chức năng từ menu bên trái.</p>
        </div>
    </div>
</div>
</body>
</html>
