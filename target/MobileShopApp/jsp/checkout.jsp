<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Checkout - MobileHub</title>
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
                            <h3 class="fw-bold mb-4"><i class="fas fa-credit-card me-2"></i>Checkout</h3>

                            <form action="${pageContext.request.contextPath}/order" method="post">
                                <div class="row g-4">
                                    <div class="col-lg-7">
                                        <div class="checkout-card">
                                            <h5 class="fw-bold mb-3"><i
                                                    class="fas fa-map-marker-alt me-2 text-primary"></i>Shipping Details
                                            </h5>
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Name</label>
                                                    <input type="text" class="form-control" value="${customer.name}"
                                                        readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Email</label>
                                                    <input type="email" class="form-control" value="${customer.email}"
                                                        readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Phone</label>
                                                    <input type="text" class="form-control" value="${customer.phone}"
                                                        readonly>
                                                </div>
                                                <div class="col-12">
                                                    <label class="form-label">Shipping Address *</label>
                                                    <textarea name="shippingAddress" class="form-control" rows="3"
                                                        required>${customer.address}, ${customer.city}, ${customer.state} - ${customer.pincode}</textarea>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Payment Method</label>
                                                    <select name="paymentMethod" class="form-select">
                                                        <option value="COD">Cash on Delivery</option>
                                                        <option value="UPI">UPI</option>
                                                        <option value="Card">Credit/Debit Card</option>
                                                        <option value="NetBanking">Net Banking</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-5">
                                        <div class="cart-summary">
                                            <h5 class="fw-bold mb-3"><i
                                                    class="fas fa-receipt me-2 text-primary"></i>Order Summary</h5>
                                            <hr>
                                            <c:forEach var="item" items="${cartItems}">
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span>${item.productName} × ${item.quantity}</span>
                                                    <span>₹
                                                        <fmt:formatNumber value="${item.subtotal}" pattern="#,##,###" />
                                                    </span>
                                                </div>
                                            </c:forEach>
                                            <hr>
                                            <div class="d-flex justify-content-between mb-2">
                                                <span>Shipping</span>
                                                <span class="text-success">Free</span>
                                            </div>
                                            <hr>
                                            <div class="d-flex justify-content-between mb-3">
                                                <strong class="fs-5">Total</strong>
                                                <strong class="fs-5 text-primary">₹
                                                    <fmt:formatNumber value="${cartTotal}" pattern="#,##,###" />
                                                </strong>
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-lg w-100 btn-glow">
                                                <i class="fas fa-check-circle me-2"></i>Confirm Order
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>

                    <%@ include file="/jsp/footer.jsp" %>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/script.js"></script>
            </body>

            </html>