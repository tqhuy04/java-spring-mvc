<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<%@ include file="/WEB-INF/view/layout/sidebar.jsp" %>
<div class="container mt-4">
    <h4>Thêm sản phẩm</h4>
    <form action="${pageContext.request.contextPath}/admin/product/create" method="post">
    <div class="form-group">
        <label>Tên sản phẩm</label>
        <input type="text" class="form-control" name="name" required>
    </div>

    <div class="form-group">
        <label>Hãng</label>
        <select name="brand" class="form-control">
            <option value="Dell">Dell</option>
            <option value="HP">HP</option>
            <option value="Apple">Apple</option>
        </select>
    </div>

    <div class="form-group">
        <label>Giá</label>
        <input type="number" class="form-control" name="price" required>
    </div>

    <div class="form-group">
        <label>Số lượng</label>
        <input type="number" class="form-control" name="stock" required>
    </div>

    <div class="form-group">
        <label>Ảnh</label>
        <input type="text" class="form-control" name="image">
    </div>

    <div class="form-group">
        <label>Mô tả</label>
        <textarea class="form-control" name="description"></textarea>
    </div>

    <div class="form-check">
        <input type="checkbox" class="form-check-input" name="active" checked>
        <label class="form-check-label">Hoạt động</label>
    </div>

    <button type="submit" class="btn btn-success">Lưu</button>
</form>

</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
