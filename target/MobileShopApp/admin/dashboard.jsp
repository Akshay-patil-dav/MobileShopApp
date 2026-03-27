<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Admin Dashboard - MobileHub</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">
                <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
            </head>

            <body class="admin-body">
                <jsp:include page="sidebar.jsp">
                    <jsp:param name="page" value="dashboard" />
                </jsp:include>

                <div class="admin-content">
                    <jsp:include page="header.jsp" />

                    <div class="admin-main p-4">
                        <h4 class="fw-bold mb-4">Dashboard Overview</h4>

                        <div class="row g-4 mb-4">
                            <div class="col-md-3 col-sm-6">
                                <div class="stat-card stat-products">
                                    <div class="stat-icon"><i class="fas fa-mobile-alt"></i></div>
                                    <div class="stat-value">${totalProducts}</div>
                                    <div class="stat-label">Total Products</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="stat-card stat-orders">
                                    <div class="stat-icon"><i class="fas fa-shopping-bag"></i></div>
                                    <div class="stat-value">${totalOrders}</div>
                                    <div class="stat-label">Total Orders</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="stat-card stat-customers">
                                    <div class="stat-icon"><i class="fas fa-users"></i></div>
                                    <div class="stat-value">${totalCustomers}</div>
                                    <div class="stat-label">Total Customers</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="stat-card stat-sales">
                                    <div class="stat-icon"><i class="fas fa-rupee-sign"></i></div>
                                    <div class="stat-value">₹
                                        <fmt:formatNumber value="${totalSales}" pattern="#,##,###" />
                                    </div>
                                    <div class="stat-label">Total Sales</div>
                                </div>
                            </div>
                        </div>

                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="admin-card">
                                    <h5 class="fw-bold mb-3"><i class="fas fa-bolt me-2 text-warning"></i>Quick Actions
                                    </h5>
                                    <div class="d-grid gap-2">
                                        <a href="${pageContext.request.contextPath}/admin/add-product"
                                            class="btn btn-outline-primary"><i class="fas fa-plus me-2"></i>Add New
                                            Product</a>
                                        <a href="${pageContext.request.contextPath}/admin/products"
                                            class="btn btn-outline-info"><i class="fas fa-list me-2"></i>View All
                                            Products</a>
                                        <a href="${pageContext.request.contextPath}/admin/orders"
                                            class="btn btn-outline-success"><i
                                                class="fas fa-shopping-bag me-2"></i>Manage Orders</a>
                                        <a href="${pageContext.request.contextPath}/admin/customers"
                                            class="btn btn-outline-warning"><i class="fas fa-users me-2"></i>View
                                            Customers</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="admin-card">
                                    <h5 class="fw-bold mb-3"><i class="fas fa-info-circle me-2 text-info"></i>System
                                        Info</h5>
                                    <table class="table table-borderless mb-0">
                                        <tr>
                                            <td class="text-muted">Application</td>
                                            <td class="fw-semibold">MobileHub v1.0</td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">Server</td>
                                            <td class="fw-semibold">Apache Tomcat</td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">Database</td>
                                            <td class="fw-semibold">MySQL</td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">Framework</td>
                                            <td class="fw-semibold">Java Servlets + JSP</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/script.js"></script>
            </body>

            </html>