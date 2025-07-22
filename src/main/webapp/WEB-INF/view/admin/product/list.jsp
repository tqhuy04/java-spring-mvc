<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<%@ include file="/WEB-INF/view/layout/sidebar.jsp" %>

<div class="container mt-4">
    <h4 class="mb-3">Quản lý sản phẩm</h4>

    <!-- Hàng chứa tìm kiếm, lọc và thêm mới -->
    <div class="row mb-4 align-items-end">
        <!-- Form tìm kiếm theo tên -->
        <div class="col-md-4">
            <form method="get" action="/admin/product">
                <div class="input-group">
                    <input type="text" name="keyword" class="form-control" placeholder="Tìm tên sản phẩm..." value="${keyword}">
                    <button type="submit" class="btn btn-primary">Tìm</button>
                </div>
            </form>
        </div>

        <!-- Form lọc theo hãng -->
        <div class="col-md-4">
            <form method="get" action="/admin/product">
                <div class="input-group">
                    <select name="brand" class="form-select">
                        <option value="">-- Lọc theo hãng --</option>
                        <option value="Dell" ${brand == 'Dell' ? 'selected' : ''}>Dell</option>
                        <option value="HP" ${brand == 'HP' ? 'selected' : ''}>HP</option>
                        <option value="Apple" ${brand == 'Apple' ? 'selected' : ''}>Apple</option>
                    </select>
                    <button type="submit" class="btn btn-secondary">Lọc</button>
                </div>
            </form>
        </div>

        <!-- Nút Xoá lọc + Thêm mới -->
        <div class="col-md-4 text-end d-flex gap-2 justify-content-end">
            <a href="/admin/product" class="btn btn-outline-dark">Xoá lọc</a>
            <a href="/admin/product/create" class="btn btn-success">+ Thêm mới</a>
        </div>
    </div>

    <!-- Danh sách sản phẩm -->
    <table class="table table-bordered align-middle text-center">
        <thead class="table-light">
            <tr>
                <th>Ảnh</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Hãng</th>
                <th>Mô tả</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${products.content}">
                <tr>
                    <td style="width: 100px;">
                        <img src="${p.image}" alt="${p.name}" class="img-fluid" style="max-height: 80px;">
                    </td>
                    <td>${p.name}</td>
                    <td><fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> VNĐ</td>
                    <td>${p.brand}</td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(p.description) > 80}">
                                ${fn:substring(p.description, 0, 80)}...
                            </c:when>
                            <c:otherwise>${p.description}</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <span class="badge ${p.active ? 'bg-success' : 'bg-secondary'}">
                            ${p.active ? 'Hiển thị' : 'Ẩn'}
                        </span>
                    </td>
                    <td>
                        <a href="/admin/product/edit/${p.id}" class="btn btn-sm btn-warning">Sửa</a>
                        <a href="/admin/product/delete/${p.id}" class="btn btn-sm btn-danger"
                           onclick="return confirm('Xác nhận xoá sản phẩm này?')">Xoá</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <%@ include file="/WEB-INF/view/layout/pagination.jsp" %>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
