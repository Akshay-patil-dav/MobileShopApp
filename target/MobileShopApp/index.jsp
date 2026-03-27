<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="MobileHub - Your one-stop shop for the latest smartphones">
    <title>MobileHub - Premium Smartphones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/jsp/header.jsp" %>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="row align-items-center min-vh-75">
                <div class="col-lg-6">
                    <span class="badge bg-accent px-3 py-2 mb-3 animate-fade-in">🔥 New Arrivals 2024</span>
                    <h1 class="hero-title animate-slide-up">Discover the <span class="text-gradient">Latest</span> Smartphones</h1>
                    <p class="hero-subtitle animate-slide-up">Experience cutting-edge technology with our premium collection of smartphones. From flagship powerhouses to budget champions.</p>
                    <div class="d-flex gap-3 animate-slide-up">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-lg btn-glow">
                            <i class="fas fa-mobile-alt me-2"></i>Shop Now
                        </a>
                        <a href="#featured" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-star me-2"></i>Featured
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <div class="hero-phone-container animate-float">
                        <i class="fas fa-mobile-alt hero-phone-icon"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Offers Section -->
    <section class="offers-section py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="offer-card">
                        <div class="offer-icon"><i class="fas fa-truck"></i></div>
                        <h5>Free Delivery</h5>
                        <p>On orders above ₹15,000</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="offer-card">
                        <div class="offer-icon"><i class="fas fa-shield-alt"></i></div>
                        <h5>1 Year Warranty</h5>
                        <p>Complete peace of mind</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="offer-card">
                        <div class="offer-icon"><i class="fas fa-undo"></i></div>
                        <h5>Easy Returns</h5>
                        <p>7-day return policy</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Products -->
    <section id="featured" class="py-5">
        <div class="container">
            <div class="section-header text-center mb-5">
                <span class="badge bg-primary-subtle text-primary px-3 py-2 mb-2">⭐ Top Picks</span>
                <h2 class="section-title">Featured Smartphones</h2>
                <p class="text-muted">Handpicked devices loved by our customers</p>
            </div>
            <div class="row g-4">
                <c:forEach var="product" items="${featuredProducts}">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product-card">
                            <div class="product-badge">Featured</div>
                            <div class="product-image-wrapper">
                                <c:choose>
                                    <c:when test="${not empty product.image}">
                                        <img src="${pageContext.request.contextPath}/images/products/${product.image}" alt="${product.name}" class="product-image">
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
                                    <span class="product-price">₹<fmt:formatNumber value="${product.price}" pattern="#,##,###"/></span>
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${product.productId}" class="btn btn-sm btn-outline-primary">View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty featuredProducts}">
                    <div class="col-12 text-center py-5">
                        <i class="fas fa-mobile-alt fa-4x text-muted mb-3"></i>
                        <h4 class="text-muted">Loading products...</h4>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary mt-3">Browse All Phones</a>
                    </div>
                </c:if>
            </div>
        </div>
    </section>

    <!-- Brands Section -->
    <section class="brands-section py-5 bg-dark-subtle">
        <div class="container text-center">
            <h3 class="mb-4">Top Brands We Carry</h3>
            <div class="d-flex justify-content-center flex-wrap gap-4">
                <div class="brand-logo"><i class="fab fa-apple"></i> Apple</div>
                <div class="brand-logo"><i class="fab fa-samsung"></i> Samsung</div>
                <div class="brand-logo"><i class="fas fa-mobile-alt"></i> OnePlus</div>
                <div class="brand-logo"><i class="fab fa-google"></i> Google</div>
                <div class="brand-logo"><i class="fas fa-mobile-alt"></i> Xiaomi</div>
                <div class="brand-logo"><i class="fas fa-mobile-alt"></i> ASUS</div>
            </div>
        </div>
    </section>

    <!-- Newsletter -->
    <section class="newsletter-section py-5">
        <div class="container text-center">
            <h3 class="text-white mb-3">Stay Updated</h3>
            <p class="text-white-50 mb-4">Get notified about new arrivals and exclusive deals</p>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form class="d-flex gap-2">
                        <input type="email" class="form-control form-control-lg" placeholder="Enter your email">
                        <button class="btn btn-light btn-lg px-4" type="button">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/jsp/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
