<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Manage Products - Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">
                <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
            </head>

            <body class="admin-body">
                <jsp:include page="sidebar.jsp">
                    <jsp:param name="page" value="products" />
                </jsp:include>

                <div class="admin-content">
                    <jsp:include page="header.jsp" />

                    <div class="admin-main p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="fw-bold mb-0">Manage Products</h4>
                            <a href="${pageContext.request.contextPath}/admin/add-product" class="btn btn-primary"><i
                                    class="fas fa-plus me-2"></i>Add Product</a>
                        </div>

                        <div class="admin-card">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Image</th>
                                            <th>Name</th>
                                            <th>Brand</th>
                                            <th>Category</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                            <th>Featured</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="p" items="${products}" varStatus="loop">
                                            <tr>
                                                <td>${loop.count}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty p.image}">
                                                            <img src="${pageContext.request.contextPath}/images/products/${p.image}"
                                                                alt="" class="admin-thumb">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="admin-thumb-placeholder"><i
                                                                    class="fas fa-mobile-alt"></i></div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="fw-semibold">${p.name}</td>
                                                <td>${p.brand}</td>
                                                <td><span class="badge bg-secondary">${p.categoryName}</span></td>
                                                <td class="fw-bold">₹
                                                    <fmt:formatNumber value="${p.price}" pattern="#,##,###" />
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${p.stock > 0}"><span
                                                                class="badge bg-success">${p.stock}</span></c:when>
                                                        <c:otherwise><span class="badge bg-danger">0</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:if test="${p.featured}"><span class="badge bg-warning"><i
                                                                class="fas fa-star"></i></span></c:if>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/update-product?id=${p.productId}"
                                                        class="btn btn-sm btn-outline-primary me-1"><i
                                                            class="fas fa-edit"></i></a>
                                                    <a href="${pageContext.request.contextPath}/admin/delete-product?id=${p.productId}"
                                                        class="btn btn-sm btn-outline-danger"
                                                        onclick="return confirm('Delete this product?')"><i
                                                            class="fas fa-trash"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/script.js"></script>
            </body>

            </html>