<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Order #${order.orderId} - Admin</title>
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
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="fw-bold mb-0">Order #${order.orderId}</h4>
                            <a href="${pageContext.request.contextPath}/admin/orders" class="btn btn-secondary"><i
                                    class="fas fa-arrow-left me-2"></i>Back</a>
                        </div>
                        <div class="row g-4">
                            <div class="col-md-8">
                                <div class="admin-card">
                                    <h5 class="fw-bold mb-3">Order Items</h5>
                                    <table class="table align-middle">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Qty</th>
                                                <th>Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${order.orderItems}">
                                                <tr>
                                                    <td>${item.productName}</td>
                                                    <td>₹
                                                        <fmt:formatNumber value="${item.price}" pattern="#,##,###" />
                                                    </td>
                                                    <td>${item.quantity}</td>
                                                    <td class="fw-bold">₹
                                                        <fmt:formatNumber value="${item.subtotal}" pattern="#,##,###" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="3" class="text-end fw-bold">Total</td>
                                                <td class="fw-bold text-primary">₹
                                                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,##,###" />
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="admin-card">
                                    <h5 class="fw-bold mb-3">Details</h5>
                                    <p><strong>Customer:</strong> ${order.customerName}</p>
                                    <p><strong>Email:</strong> ${order.customerEmail}</p>
                                    <p><strong>Address:</strong> ${order.shippingAddress}</p>
                                    <p><strong>Payment:</strong> ${order.paymentMethod}</p>
                                    <p><strong>Date:</strong> ${order.orderDate}</p>
                                    <p><strong>Status:</strong>
                                        <c:choose>
                                            <c:when test="${order.orderStatus == 'Delivered'}"><span
                                                    class="badge bg-success">${order.orderStatus}</span></c:when>
                                            <c:when test="${order.orderStatus == 'Cancelled'}"><span
                                                    class="badge bg-danger">${order.orderStatus}</span></c:when>
                                            <c:otherwise><span class="badge bg-warning">${order.orderStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>