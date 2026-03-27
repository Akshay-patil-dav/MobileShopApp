<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Order Confirmed - MobileHub</title>
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
                            <div class="row justify-content-center">
                                <div class="col-md-6">
                                    <div class="text-center order-success-card">
                                        <div class="success-icon mb-4">
                                            <i class="fas fa-check-circle"></i>
                                        </div>
                                        <h2 class="fw-bold text-success">Order Placed Successfully!</h2>
                                        <p class="text-muted fs-5 mb-4">Thank you for shopping with MobileHub</p>

                                        <div class="order-info-box mb-4">
                                            <div class="mb-2">
                                                <strong>Order ID:</strong> #${orderId}
                                            </div>
                                            <div>
                                                <strong>Total Amount:</strong>
                                                <span class="text-primary fs-5 fw-bold">₹
                                                    <fmt:formatNumber value="${totalAmount}" pattern="#,##,###" />
                                                </span>
                                            </div>
                                        </div>

                                        <p class="text-muted">You will receive a confirmation email shortly.</p>

                                        <div class="d-flex justify-content-center gap-3 mt-4">
                                            <a href="${pageContext.request.contextPath}/products"
                                                class="btn btn-primary btn-lg">
                                                <i class="fas fa-shopping-bag me-2"></i>Continue Shopping
                                            </a>
                                            <a href="${pageContext.request.contextPath}/"
                                                class="btn btn-outline-secondary btn-lg">
                                                <i class="fas fa-home me-2"></i>Home
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <%@ include file="/jsp/footer.jsp" %>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>