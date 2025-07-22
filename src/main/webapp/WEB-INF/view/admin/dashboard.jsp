<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.Hoc_Java_mua_xuan.domain.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("/auth/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap4.min.css">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #566472;
            color: white;
            position: fixed;
            padding-top: 2rem;
        }
        .sidebar a {
            color: white;
        }
        .main-content {
            margin-left: 16.6%; /* 2/12 col */
            padding: 2rem;
        }
        .card-footer i {
            float: right;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h5 class="text-center mb-4">🔧 Admin Menu</h5>
            <ul class="nav flex-column pl-3">
                <li class="nav-item mb-2">
                    <a class="nav-link" href="/admin/user"><i class="fas fa-users mr-2"></i>Quản lý người dùng</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="/admin/product"><i class="fas fa-box mr-2"></i>Quản lý sản phẩm</a>
                </li>
                <li class="nav-item mt-4">
                    <a class="nav-link text-danger" href="/auth/logout"><i class="fas fa-sign-out-alt mr-2"></i>Đăng xuất</a>
                </li>
            </ul>
        </div>

        <!-- Main -->
        <div class="col-md-10 main-content">
            <div class="mb-4">
                <h2>🎯 Xin chào, admin!</h2>
                <p>Email: <strong><%= user.getEmail() %></strong> | Vai trò: <strong><%= user.getRole() %></strong></p>
            </div>

            <!-- Cards -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card bg-primary text-white">
                        <div class="card-body">Người dùng</div>
                        <div class="card-footer">
                            <a href="/admin/user" class="text-white">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-success text-white">
                        <div class="card-body">Sản phẩm</div>
                        <div class="card-footer">
                            <a href="/admin/product" class="text-white">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-warning text-white">
                        <div class="card-body">Doanh thu</div>
                        <div class="card-footer">
                            <a href="#" class="text-white">Xem báo cáo <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-danger text-white">
                        <div class="card-body">Tồn kho</div>
                        <div class="card-footer">
                            <a href="#" class="text-white">Xem ngay <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts -->
            <div class="row mb-4">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">📈 Doanh thu theo ngày</div>
                        <div class="card-body">
                            <canvas id="lineChart" height="100"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">📊 Sản phẩm bán chạy</div>
                        <div class="card-body">
                            <canvas id="barChart" height="100"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="card">
                <div class="card-header"><i class="fas fa-table"></i> Danh sách sản phẩm</div>
                <div class="card-body">
                    <table class="table table-bordered" id="productTable">
                        <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Tên</th>
                                <th>Giá</th>
                                <th>Hãng</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dữ liệu thêm bằng JSTL hoặc JS -->
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function () {
        $('#productTable').DataTable();
    });

    new Chart(document.getElementById('lineChart'), {
        type: 'line',
        data: {
            labels: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
            datasets: [{
                label: 'Doanh thu (VNĐ)',
                data: [1200000, 1500000, 1800000, 1000000, 2000000, 2500000, 2200000],
                borderColor: '#007bff',
                backgroundColor: 'rgba(0,123,255,0.1)',
                fill: true
            }]
        }
    });

    new Chart(document.getElementById('barChart'), {
        type: 'bar',
        data: {
            labels: ['Macbook', 'Dell', 'HP', 'Asus'],
            datasets: [{
                label: 'Số lượng bán',
                data: [120, 150, 100, 80],
                backgroundColor: ['#007bff', '#28a745', '#ffc107', '#dc3545']
            }]
        }
    });
</script>
</body>
</html>
