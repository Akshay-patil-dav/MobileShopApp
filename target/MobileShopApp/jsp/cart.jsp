<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Shopping Cart - MobileHub</title>
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
                            <h3 class="fw-bold mb-4"><i class="fas fa-shopping-cart me-2"></i>Shopping Cart</h3>

                            <c:choose>
                                <c:when test="${not empty cartItems}">
                                    <div class="row g-4">
                                        <div class="col-lg-8">
                                            <div class="table-responsive">
                                                <table class="table table-modern align-middle">
                                                    <thead>
                                                        <tr>
                                                            <th>Product</th>
                                                            <th>Price</th>
                                                            <th>Quantity</th>
                                                            <th>Subtotal</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="item" items="${cartItems}">
                                                            <tr>
                                                                <td>
                                                                    <div class="d-flex align-items-center">
                                                                        <c:choose>
                                                                            <c:when
                                                                                test="${not empty item.productImage}">
                                                                                <img src="${pageContext.request.contextPath}/images/products/${item.productImage}"
                                                                                    alt="" class="cart-thumb me-3">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <div
                                                                                    class="cart-thumb-placeholder me-3">
                                                                                    <i class="fas fa-mobile-alt"></i>
                                                                                </div>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <div>
                                                                            <strong>${item.productName}</strong>
                                                                            <br><small
                                                                                class="text-muted">${item.brand}</small>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>₹
                                                                    <fmt:formatNumber value="${item.productPrice}"
                                                                        pattern="#,##,###" />
                                                                </td>
                                                                <td>
                                                                    <form
                                                                        action="${pageContext.request.contextPath}/cart"
                                                                        method="post" class="d-flex align-items-center"
                                                                        style="width: 120px;">
                                                                        <input type="hidden" name="action"
                                                                            value="update">
                                                                        <input type="hidden" name="cartId"
                                                                            value="${item.cartId}">
                                                                        <input type="number" name="quantity"
                                                                            value="${item.quantity}" min="1"
                                                                            class="form-control form-control-sm"
                                                                            onchange="this.form.submit()">
                                                                    </form>
                                                                </td>
                                                                <td class="fw-bold">₹
                                                                    <fmt:formatNumber value="${item.subtotal}"
                                                                        pattern="#,##,###" />
                                                                </td>
                                                                <td>
                                                                    <form
                                                                        action="${pageContext.request.contextPath}/cart"
                                                                        method="post">
                                                                        <input type="hidden" name="action"
                                                                            value="remove">
                                                                        <input type="hidden" name="cartId"
                                                                            value="${item.cartId}">
                                                                        <button type="submit"
                                                                            class="btn btn-sm btn-outline-danger"><i
                                                                                class="fas fa-trash"></i></button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="cart-summary">
                                                <h5 class="fw-bold mb-3">Order Summary</h5>
                                                <hr>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span>Items (${cartItems.size()})</span>
                                                    <span>₹
                                                        <fmt:formatNumber value="${cartTotal}" pattern="#,##,###" />
                                                    </span>
                                                </div>
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
                                                <a href="${pageContext.request.contextPath}/checkout"
                                                    class="btn btn-primary btn-lg w-100 btn-glow">
                                                    <i class="fas fa-credit-card me-2"></i>Proceed to Checkout
                                                </a>
                                                <a href="${pageContext.request.contextPath}/products"
                                                    class="btn btn-outline-secondary w-100 mt-2">Continue Shopping</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="text-center py-5">
                                        <i class="fas fa-shopping-cart fa-5x text-muted mb-3"></i>
                                        <h4 class="text-muted">Your cart is empty</h4>
                                        <a href="${pageContext.request.contextPath}/products"
                                            class="btn btn-primary mt-3">Start Shopping</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </section>

                    <%@ include file="/jsp/footer.jsp" %>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/script.js"></script>
            </body>

            </html>