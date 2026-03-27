<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Admin Sidebar -->
        <div class="admin-sidebar" id="adminSidebar">
            <div class="sidebar-brand">
                <i class="fas fa-mobile-alt me-2"></i>Mobile<span>Hub</span>
            </div>
            <nav class="sidebar-nav">
                <a href="${pageContext.request.contextPath}/admin/dashboard"
                    class="sidebar-link ${param.page == 'dashboard' ? 'active' : ''}">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/admin/products"
                    class="sidebar-link ${param.page == 'products' ? 'active' : ''}">
                    <i class="fas fa-mobile-alt"></i> Products
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories"
                    class="sidebar-link ${param.page == 'categories' ? 'active' : ''}">
                    <i class="fas fa-tags"></i> Categories
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders"
                    class="sidebar-link ${param.page == 'orders' ? 'active' : ''}">
                    <i class="fas fa-shopping-bag"></i> Orders
                </a>
                <a href="${pageContext.request.contextPath}/admin/customers"
                    class="sidebar-link ${param.page == 'customers' ? 'active' : ''}">
                    <i class="fas fa-users"></i> Customers
                </a>
                <hr class="border-secondary">
                <a href="${pageContext.request.contextPath}/" class="sidebar-link">
                    <i class="fas fa-store"></i> View Store
                </a>
                <a href="${pageContext.request.contextPath}/admin/logout" class="sidebar-link text-danger">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </nav>
        </div>