<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<%@ include file="/WEB-INF/view/layout/sidebar.jsp" %>

<div class="container mt-4">
    <h4 class="mb-3">Sửa sản phẩm</h4>
    <form action="/admin/product/edit/${product.id}" method="post" class="row g-3">

        <div class="col-md-6">
            <label class="form-label">Tên:</label>
            <input type="text" name="name" class="form-control" value="${product.name}" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Giá (VNĐ):</label>
            <input type="number" name="price" class="form-control" value="${product.price}" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Hãng:</label>
            <input type="text" name="brand" class="form-control" value="${product.brand}">
        </div>

        <div class="col-md-6">
            <label class="form-label">Hình ảnh (URL):</label>
            <input type="text" name="image" class="form-control" value="${product.image}">
        </div>

        <div class="col-md-12">
            <label class="form-label">Mô tả:</label>
            <textarea name="description" class="form-control" rows="3">${product.description}</textarea>
        </div>

        <div class="col-md-4">
            <label class="form-label">Trạng thái:</label>
            <select name="active" class="form-control">
                <c:choose>
                    <c:when test="${product.active}">
                        <option value="true" selected>Hiển thị</option>
                        <option value="false">Ẩn</option>
                    </c:when>
                    <c:otherwise>
                        <option value="true">Hiển thị</option>
                        <option value="false" selected>Ẩn</option>
                    </c:otherwise>
                </c:choose>
            </select>
        </div>

        <div class="col-12">
            <button class="btn btn-primary">Cập nhật</button>
            <a href="/admin/product" class="btn btn-secondary">Huỷ</a>
        </div>
    </form>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
