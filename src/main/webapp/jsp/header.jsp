<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top main-nav">
            <div class="container">
                <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">
                    <i class="fas fa-mobile-alt me-2"></i>Mobile<span class="text-gradient">Hub</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/"><i
                                    class="fas fa-home me-1"></i> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/products"><i
                                    class="fas fa-th-large me-1"></i> Products</a>
                        </li>
                    </ul>
                    <!-- Search Form -->
                    <form class="d-flex me-3" action="${pageContext.request.contextPath}/search" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control search-input" name="keyword"
                                placeholder="Search phones..." value="${keyword}">
                            <button class="btn btn-outline-light" type="submit"><i class="fas fa-search"></i></button>
                        </div>
                    </form>
                    <ul class="navbar-nav">
                        <c:choose>
                            <c:when test="${not empty sessionScope.customerId}">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/cart">
                                        <i class="fas fa-shopping-cart me-1"></i> Cart
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button"
                                        data-bs-toggle="dropdown">
                                        <i class="fas fa-user me-1"></i> ${sessionScope.customerName}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i
                                                    class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/login"><i
                                            class="fas fa-sign-in-alt me-1"></i> Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm btn-primary ms-2 px-3"
                                        href="${pageContext.request.contextPath}/register">Register</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>