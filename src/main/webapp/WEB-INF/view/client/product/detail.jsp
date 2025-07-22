<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <img src="${product.image}" class="img-fluid border rounded" alt="${product.name}">
        </div>
        <div class="col-md-6">
            <h2>${product.name}</h2>
            <h4 class="text-danger font-weight-bold mt-3">
                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"/>
            </h4>
            <p class="mt-4">${product.description}</p>

            <form action="/cart/add" method="post" class="mt-4">
                <input type="hidden" name="productId" value="${product.id}">
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Số lượng:</label>
                    <div class="col-sm-4">
                        <input type="number" name="quantity" class="form-control" value="1" min="1">
                    </div>
                </div>
                <button type="submit" class="btn btn-success btn-lg">🛒 Thêm vào giỏ</button>
                <a href="/product" class="btn btn-secondary btn-lg ml-2">← Quay lại</a>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
