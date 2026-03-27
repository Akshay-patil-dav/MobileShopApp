<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login - MobileHub</title>
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
                            <div class="col-md-5">
                                <div class="auth-card">
                                    <div class="text-center mb-4">
                                        <div class="auth-icon"><i class="fas fa-user-circle"></i></div>
                                        <h3 class="fw-bold">Welcome Back</h3>
                                        <p class="text-muted">Login to your account</p>
                                    </div>

                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger"><i
                                                class="fas fa-exclamation-circle me-2"></i>${error}</div>
                                    </c:if>
                                    <c:if test="${not empty success}">
                                        <div class="alert alert-success"><i
                                                class="fas fa-check-circle me-2"></i>${success}</div>
                                    </c:if>

                                    <form action="${pageContext.request.contextPath}/login" method="post"
                                        id="loginForm">
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                                <input type="email" name="email" class="form-control"
                                                    placeholder="Enter email" required>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Password</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                                <input type="password" name="password" class="form-control"
                                                    placeholder="Enter password" required>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary w-100 btn-lg btn-glow">
                                            <i class="fas fa-sign-in-alt me-2"></i>Login
                                        </button>
                                    </form>

                                    <p class="text-center mt-3 mb-0">Don't have an account? <a
                                            href="${pageContext.request.contextPath}/register"
                                            class="text-primary fw-semibold">Register</a></p>
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