<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- Footer -->
    <footer class="site-footer py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4">
                    <h5 class="text-white"><i class="fas fa-mobile-alt me-2"></i>MobileHub</h5>
                    <p class="text-white-50">Your trusted destination for the latest smartphones. We offer genuine
                        products with warranty and excellent customer support.</p>
                </div>
                <div class="col-lg-2">
                    <h6 class="text-white mb-3">Quick Links</h6>
                    <ul class="list-unstyled footer-links">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h6 class="text-white mb-3">Brands</h6>
                    <ul class="list-unstyled footer-links">
                        <li><a href="${pageContext.request.contextPath}/products?brand=Samsung">Samsung</a></li>
                        <li><a href="${pageContext.request.contextPath}/products?brand=Apple">Apple</a></li>
                        <li><a href="${pageContext.request.contextPath}/products?brand=OnePlus">OnePlus</a></li>
                        <li><a href="${pageContext.request.contextPath}/products?brand=Xiaomi">Xiaomi</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h6 class="text-white mb-3">Contact</h6>
                    <ul class="list-unstyled footer-links">
                        <li><i class="fas fa-envelope me-2"></i>support@mobilehub.com</li>
                        <li><i class="fas fa-phone me-2"></i>+91 98765 43210</li>
                        <li><i class="fas fa-map-marker-alt me-2"></i>Mumbai, India</li>
                    </ul>
                </div>
            </div>
            <hr class="border-secondary my-4">
            <p class="text-center text-white-50 mb-0">&copy; 2024 MobileHub. All rights reserved.</p>
        </div>
    </footer>