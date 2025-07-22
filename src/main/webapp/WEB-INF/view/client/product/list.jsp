<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Bootstrap + Font Awesome -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<!-- HEADER -->
<nav class="navbar navbar-expand-lg navbar-dark bg-danger px-4">
    <a class="navbar-brand font-weight-bold" href="${pageContext.request.contextPath}/product">LaptopShop</a>
    <div class="ml-auto d-flex align-items-center">
        <div class="rounded-circle bg-white text-danger d-flex align-items-center justify-content-center mr-3"
             style="width: 36px; height: 36px;">
            <i class="fas fa-user"></i>
        </div>
        <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-light btn-sm mr-2">
            <i class="fas fa-shopping-cart"></i> Giỏ hàng
        </a>
        <a href="${pageContext.request.contextPath}/auth/logout" class="btn btn-outline-light btn-sm">Đăng xuất</a>
    </div>
</nav>

<!-- BODY -->
<div class="container mt-4">
    <h3 class="mb-3">Danh sách sản phẩm</h3>

    <!-- Tìm kiếm -->
    <form method="get" action="${pageContext.request.contextPath}/product" class="form-inline mb-4">
        <input type="text" name="keyword" value="${keyword}" class="form-control mr-2" placeholder="Tìm kiếm...">
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>

    <!-- Dạng Grid -->
    <div class="row">
        <c:forEach var="product" items="${products.content}">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <a href="${pageContext.request.contextPath}/product/detail/${product.id}">
                        <img src="${product.image}" class="card-img-top" style="height: 200px; object-fit: cover;"/>
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">
                            ${fn:substring(product.name, 0, 40)}${fn:length(product.name) > 40 ? '...' : ''}
                        </h5>
                        <p class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"/>
                        </p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <form method="post" action="${pageContext.request.contextPath}/cart/add">
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="hidden" name="quantity" value="1"/>
                            <button type="submit" class="btn btn-success btn-sm">🛒 Giỏ</button>
                        </form>
                        <a href="${pageContext.request.contextPath}/product/detail/${product.id}"
                           class="btn btn-outline-primary btn-sm">Chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Phân trang -->
    <%@ include file="/WEB-INF/view/layout/pagination.jsp" %>
</div>
