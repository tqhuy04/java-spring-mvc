<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${totalPages > 1}">
    <nav>
        <ul class="pagination justify-content-center">
            <!-- Trang trước -->
            <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                <a class="page-link"
                   href="${baseUrl}?page=${currentPage - 1}${param.keyword != null ? '&keyword=' + param.keyword : ''}${param.brand != null ? '&brand=' + param.brand : ''}">
                    «
                </a>
            </li>

            <!-- Các trang -->
            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                <li class="page-item ${i == currentPage ? 'active' : ''}">
                    <a class="page-link"
                       href="${baseUrl}?page=${i}${param.keyword != null ? '&keyword=' + param.keyword : ''}${param.brand != null ? '&brand=' + param.brand : ''}">
                        ${i + 1}
                    </a>
                </li>
            </c:forEach>

            <!-- Trang sau -->
            <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                <a class="page-link"
                   href="${baseUrl}?page=${currentPage + 1}${param.keyword != null ? '&keyword=' + param.keyword : ''}${param.brand != null ? '&brand=' + param.brand : ''}">
                    »
                </a>
            </li>
        </ul>
    </nav>
</c:if>
