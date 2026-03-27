<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Admin Login - MobileHub</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
        </head>

        <body class="admin-login-body">
            <div class="container">
                <div class="row justify-content-center align-items-center min-vh-100">
                    <div class="col-md-4">
                        <div class="admin-login-card">
                            <div class="text-center mb-4">
                                <div class="admin-logo"><i class="fas fa-shield-alt"></i></div>
                                <h3 class="fw-bold text-white">Admin Panel</h3>
                                <p class="text-white-50">MobileHub Management</p>
                            </div>

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger"><i class="fas fa-exclamation-circle me-2"></i>${error}
                                </div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/admin/login" method="post">
                                <div class="mb-3">
                                    <label class="form-label text-white-50">Username</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-dark border-secondary text-white"><i
                                                class="fas fa-user"></i></span>
                                        <input type="text" name="username"
                                            class="form-control bg-dark border-secondary text-white"
                                            placeholder="Enter username" required>
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label text-white-50">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-dark border-secondary text-white"><i
                                                class="fas fa-lock"></i></span>
                                        <input type="password" name="password"
                                            class="form-control bg-dark border-secondary text-white"
                                            placeholder="Enter password" required>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 btn-lg">
                                    <i class="fas fa-sign-in-alt me-2"></i>Login
                                </button>
                            </form>

                            <p class="text-center mt-3 mb-0">
                                <a href="${pageContext.request.contextPath}/" class="text-white-50"><i
                                        class="fas fa-arrow-left me-1"></i>Back to Store</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>