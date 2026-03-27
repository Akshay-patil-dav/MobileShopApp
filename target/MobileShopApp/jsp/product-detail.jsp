<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>${product.name} - MobileHub</title>
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
                            <nav aria-label="breadcrumb" class="mb-4">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a
                                            href="${pageContext.request.contextPath}/products">Products</a></li>
                                    <li class="breadcrumb-item active">${product.name}</li>
                                </ol>
                            </nav>

                            <div class="row g-5">
                                <div class="col-lg-5">
                                    <div class="product-detail-image">
                                        <c:choose>
                                            <c:when test="${not empty product.image}">
                                                <img src="${pageContext.request.contextPath}/images/products/${product.image}"
                                                    alt="${product.name}" class="img-fluid rounded-4">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="product-placeholder-lg">
                                                    <i class="fas fa-mobile-alt fa-5x"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <span class="badge bg-primary mb-2">${product.brand}</span>
                                    <c:if test="${not empty product.categoryName}">
                                        <span class="badge bg-secondary mb-2">${product.categoryName}</span>
                                    </c:if>
                                    <h2 class="fw-bold">${product.name}</h2>
                                    <p class="text-muted mb-4">${product.description}</p>

                                    <h3 class="text-primary fw-bold mb-4">₹
                                        <fmt:formatNumber value="${product.price}" pattern="#,##,###" />
                                    </h3>

                                    <!-- Specifications -->
                                    <div class="specs-grid mb-4">
                                        <div class="spec-item">
                                            <i class="fas fa-memory"></i>
                                            <div>
                                                <small class="text-muted">RAM</small>
                                                <div class="fw-semibold">${product.ram}</div>
                                            </div>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-hdd"></i>
                                            <div>
                                                <small class="text-muted">Storage</small>
                                                <div class="fw-semibold">${product.storage}</div>
                                            </div>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-camera"></i>
                                            <div>
                                                <small class="text-muted">Camera</small>
                                                <div class="fw-semibold">${product.camera}</div>
                                            </div>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-battery-full"></i>
                                            <div>
                                                <small class="text-muted">Battery</small>
                                                <div class="fw-semibold">${product.battery}</div>
                                            </div>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-expand"></i>
                                            <div>
                                                <small class="text-muted">Display</small>
                                                <div class="fw-semibold">${product.displaySize}</div>
                                            </div>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-microchip"></i>
                                            <div>
                                                <small class="text-muted">Processor</small>
                                                <div class="fw-semibold">${product.processor}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${not empty product.os}">
                                        <p><strong>OS:</strong> ${product.os}</p>
                                    </c:if>

                                    <c:choose>
                                        <c:when test="${product.stock > 0}">
                                            <span class="badge bg-success mb-3"><i class="fas fa-check me-1"></i>In
                                                Stock (${product.stock} units)</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger mb-3"><i class="fas fa-times me-1"></i>Out of
                                                Stock</span>
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="d-flex gap-3 mt-4">
                                        <form action="${pageContext.request.contextPath}/cart" method="post">
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="productId" value="${product.productId}">
                                            <div class="input-group" style="width: 140px;">
                                                <span class="input-group-text">Qty</span>
                                                <input type="number" name="quantity" value="1" min="1"
                                                    max="${product.stock}" class="form-control">
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-lg mt-3 btn-glow"
                                                ${product.stock <=0 ? 'disabled' : '' }>
                                                <i class="fas fa-shopping-cart me-2"></i>Add to Cart
                                            </button>
                                        </form>
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