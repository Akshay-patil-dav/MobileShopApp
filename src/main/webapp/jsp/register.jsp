<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Register - MobileHub</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        </head>

        <body>
            <%@ include file="/jsp/header.jsp" %>

                <section class="auth-section py-5">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-7">
                                <div class="auth-card">
                                    <div class="text-center mb-4">
                                        <div class="auth-icon"><i class="fas fa-user-plus"></i></div>
                                        <h3 class="fw-bold">Create Account</h3>
                                        <p class="text-muted">Join MobileHub today</p>
                                    </div>

                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger"><i
                                                class="fas fa-exclamation-circle me-2"></i>${error}</div>
                                    </c:if>

                                    <form action="${pageContext.request.contextPath}/register" method="post"
                                        id="registerForm">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label class="form-label">Full Name *</label>
                                                <input type="text" name="name" class="form-control"
                                                    placeholder="John Doe" required>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Email *</label>
                                                <input type="email" name="email" class="form-control"
                                                    placeholder="john@example.com" required>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Phone *</label>
                                                <input type="tel" name="phone" class="form-control"
                                                    placeholder="+91 98765 43210" required>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Password *</label>
                                                <input type="password" name="password" class="form-control"
                                                    placeholder="Min 6 characters" required minlength="6">
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label">Address</label>
                                                <textarea name="address" class="form-control" rows="2"
                                                    placeholder="Street address"></textarea>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label">City</label>
                                                <input type="text" name="city" class="form-control"
                                                    placeholder="Mumbai">
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label">State</label>
                                                <input type="text" name="state" class="form-control"
                                                    placeholder="Maharashtra">
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label">Pincode</label>
                                                <input type="text" name="pincode" class="form-control"
                                                    placeholder="400001">
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary w-100 btn-lg btn-glow">
                                                    <i class="fas fa-user-plus me-2"></i>Register
                                                </button>
                                            </div>
                                        </div>
                                    </form>

                                    <p class="text-center mt-3 mb-0">Already have an account? <a
                                            href="${pageContext.request.contextPath}/login"
                                            class="text-primary fw-semibold">Login</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <%@ include file="/jsp/footer.jsp" %>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/script.js"></script>
        </body>

        </html>