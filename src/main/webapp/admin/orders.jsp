<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Manage Orders - Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">
                <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
            </head>

            <body class="admin-body">
                <jsp:include page="sidebar.jsp">
                    <jsp:param name="page" value="orders" />
                </jsp:include>

                <div class="admin-content">
                    <jsp:include page="header.jsp" />

                    <div class="admin-main p-4">
                        <h4 class="fw-bold mb-4"><i class="fas fa-shopping-bag me-2"></i>Manage Orders</h4>

                        <div class="admin-card">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th>Order #</th>
                                            <th>Customer</th>
                                            <th>Amount</th>
                                            <th>Status</th>
                                            <th>Payment</th>
                                            <th>Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td class="fw-bold">#${order.orderId}</td>
                                                <td>
                                                    <div>${order.customerName}</div>
                                                    <small class="text-muted">${order.customerEmail}</small>
                                                </td>
                                                <td class="fw-bold">₹
                                                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,##,###" />
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.orderStatus == 'Pending'}"><span
                                                                class="badge bg-warning">${order.orderStatus}</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'Processing'}"><span
                                                                class="badge bg-info">${order.orderStatus}</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'Shipped'}"><span
                                                                class="badge bg-primary">${order.orderStatus}</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'Delivered'}"><span
                                                                class="badge bg-success">${order.orderStatus}</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'Cancelled'}"><span
                                                                class="badge bg-danger">${order.orderStatus}</span>
                                                        </c:when>
                                                        <c:otherwise><span
                                                                class="badge bg-secondary">${order.orderStatus}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${order.paymentMethod}</td>
                                                <td><small>${order.orderDate}</small></td>
                                                <td>
                                                    <div class="d-flex gap-1">
                                                        <form action="${pageContext.request.contextPath}/admin/orders"
                                                            method="post" class="d-inline">
                                                            <input type="hidden" name="orderId"
                                                                value="${order.orderId}">
                                                            <select name="status" class="form-select form-select-sm"
                                                                onchange="this.form.submit()" style="width: 130px;">
                                                                <option value="Pending" ${order.orderStatus=='Pending'
                                                                    ? 'selected' : '' }>Pending</option>
                                                                <option value="Processing"
                                                                    ${order.orderStatus=='Processing' ? 'selected' : ''
                                                                    }>Processing</option>
                                                                <option value="Shipped" ${order.orderStatus=='Shipped'
                                                                    ? 'selected' : '' }>Shipped</option>
                                                                <option value="Delivered"
                                                                    ${order.orderStatus=='Delivered' ? 'selected' : ''
                                                                    }>Delivered</option>
                                                                <option value="Cancelled"
                                                                    ${order.orderStatus=='Cancelled' ? 'selected' : ''
                                                                    }>Cancelled</option>
                                                            </select>
                                                        </form>
                                                        <a href="${pageContext.request.contextPath}/admin/orders?action=delete&id=${order.orderId}"
                                                            class="btn btn-sm btn-outline-danger"
                                                            onclick="return confirm('Delete this order?')"><i
                                                                class="fas fa-trash"></i></a>
                                                    </div>
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