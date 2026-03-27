<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>All Smartphones - MobileHub</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">
                <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
            </head>

            <body>
                <%@ include file="/jsp/header.jsp" %>

                    <section class="py-5 page-content">
                        <div class="container">
                            <div class="row">
                                <!-- Sidebar Filters -->
                                <div class="col-lg-3 mb-4">
                                    <div class="filter-card">
                                        <h5 class="mb-4"><i class="fas fa-filter me-2"></i>Filters</h5>

                                        <!-- Brand Filter -->
                                        <div class="filter-group">
                                            <h6>Brand</h6>
                                            <div class="list-group list-group-flush">
                                                <a href="${pageContext.request.contextPath}/products"
                                                    class="list-group-item list-group-item-action ${empty selectedBrand ? 'active' : ''}">All
                                                    Brands</a>
                                                <c:forEach var="b" items="${brands}">
                                                    <a href="${pageContext.request.contextPath}/products?brand=${b}"
                                                        class="list-group-item list-group-item-action ${selectedBrand == b ? 'active' : ''}">${b}</a>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- Category Filter -->
                                        <div class="filter-group mt-4">
                                            <h6>Category</h6>
                                            <div class="list-group list-group-flush">
                                                <c:forEach var="cat" items="${categories}">
                                                    <a href="${pageContext.request.contextPath}/products?category=${cat.categoryId}"
                                                        class="list-group-item list-group-item-action ${selectedCategory == cat.categoryId ? 'active' : ''}">${cat.categoryName}</a>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- Price Filter -->
                                        <div class="filter-group mt-4">
                                            <h6>Price Range</h6>
                                            <form action="${pageContext.request.contextPath}/products" method="get">
                                                <div class="mb-2">
                                                    <input type="number" class="form-control form-control-sm"
                                                        name="minPrice" placeholder="Min ₹" value="${minPrice}">
                                                </div>
                                                <div class="mb-2">
                                                    <input type="number" class="form-control form-control-sm"
                                                        name="maxPrice" placeholder="Max ₹" value="${maxPrice}">
                                                </div>
                                                <button type="submit"
                                                    class="btn btn-primary btn-sm w-100">Apply</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- Product Grid -->
                                <div class="col-lg-9">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h4 class="mb-0">
                                            <c:choose>
                                                <c:when test="${not empty keyword}">Search: "${keyword}"</c:when>
                                                <c:when test="${not empty selectedBrand}">${selectedBrand} Phones
                                                </c:when>
                                                <c:otherwise>All Smartphones</c:otherwise>
                                            </c:choose>
                                        </h4>
                                        <span class="text-muted">${products.size()} products found</span>
                                    </div>

                                    <div class="row g-4">
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-md-4 col-sm-6">
                                                <div class="product-card">
                                                    <c:if test="${product.featured}">
                                                        <div class="product-badge">Featured</div>
                                                    </c:if>
                                                    <div class="product-image-wrapper">
                                                        <c:choose>
                                                            <c:when test="${not empty product.image}">
                                                                <img src="${pageContext.request.contextPath}/images/products/${product.image}"
                                                                    alt="${product.name}" class="product-image"
                                                                    loading="lazy"
                                                                    onerror="this.style.display='none'; this.nextElementSibling.style.display='flex'">
                                                                <div class="product-placeholder" style="display:none">
                                                                    <i class="fas fa-mobile-alt"></i>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="product-placeholder">
                                                                    <i class="fas fa-mobile-alt"></i>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="product-info">
                                                        <span class="product-brand">${product.brand}</span>
                                                        <h5 class="product-name">${product.name}</h5>
                                                        <div class="product-specs">
                                                            <span><i class="fas fa-memory"></i> ${product.ram}</span>
                                                            <span><i class="fas fa-hdd"></i> ${product.storage}</span>
                                                        </div>
                                                        <div class="product-price-row">
                                                            <span class="product-price">₹
                                                                <fmt:formatNumber value="${product.price}"
                                                                    pattern="#,##,###" />
                                                            </span>
                                                        </div>
                                                        <div class="d-flex gap-2 mt-2">
                                                            <a href="${pageContext.request.contextPath}/product-detail?id=${product.productId}"
                                                                class="btn btn-sm btn-outline-primary flex-grow-1">Details</a>
                                                            <form action="${pageContext.request.contextPath}/cart"
                                                                method="post" class="flex-grow-1">
                                                                <input type="hidden" name="action" value="add">
                                                                <input type="hidden" name="productId"
                                                                    value="${product.productId}">
                                                                <button type="submit"
                                                                    class="btn btn-sm btn-primary w-100"><i
                                                                        class="fas fa-cart-plus"></i> Add</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <c:if test="${empty products}">
                                            <div class="col-12 text-center py-5">
                                                <i class="fas fa-search fa-4x text-muted mb-3"></i>
                                                <h4 class="text-muted">No products found</h4>
                                                <a href="${pageContext.request.contextPath}/products"
                                                    class="btn btn-primary mt-3">View All Products</a>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <%@ include file="/jsp/footer.jsp" %>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/script.js"></script>
            </body>

            </html>