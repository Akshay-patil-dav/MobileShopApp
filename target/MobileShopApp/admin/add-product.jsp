<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add Product - Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
        </head>

        <body class="admin-body">
            <jsp:include page="sidebar.jsp">
                <jsp:param name="page" value="products" />
            </jsp:include>

            <div class="admin-content">
                <jsp:include page="header.jsp" />

                <div class="admin-main p-4">
                    <h4 class="fw-bold mb-4"><i class="fas fa-plus-circle me-2"></i>Add New Product</h4>

                    <div class="admin-card">
                        <form action="${pageContext.request.contextPath}/admin/add-product" method="post"
                            enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Mobile Name *</label>
                                    <input type="text" name="name" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Brand *</label>
                                    <input type="text" name="brand" class="form-control" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Price (₹) *</label>
                                    <input type="number" name="price" class="form-control" step="0.01" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Category *</label>
                                    <select name="categoryId" class="form-select" required>
                                        <option value="">Select Category</option>
                                        <c:forEach var="cat" items="${categories}">
                                            <option value="${cat.categoryId}">${cat.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Stock *</label>
                                    <input type="number" name="stock" class="form-control" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">RAM</label>
                                    <input type="text" name="ram" class="form-control" placeholder="e.g. 8 GB">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Storage</label>
                                    <input type="text" name="storage" class="form-control" placeholder="e.g. 128 GB">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Camera</label>
                                    <input type="text" name="camera" class="form-control"
                                        placeholder="e.g. 50 MP + 12 MP">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Battery</label>
                                    <input type="text" name="battery" class="form-control" placeholder="e.g. 5000 mAh">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Display Size</label>
                                    <input type="text" name="displaySize" class="form-control"
                                        placeholder="e.g. 6.7 inches">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Processor</label>
                                    <input type="text" name="processor" class="form-control"
                                        placeholder="e.g. Snapdragon 8 Gen 3">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">OS</label>
                                    <input type="text" name="os" class="form-control" placeholder="e.g. Android 14">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Product Image</label>
                                    <input type="file" name="image" class="form-control" accept="image/*">
                                </div>
                                <div class="col-md-4 d-flex align-items-end">
                                    <div class="form-check">
                                        <input type="checkbox" name="featured" class="form-check-input" id="featured">
                                        <label class="form-check-label" for="featured">Featured Product</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Description</label>
                                    <textarea name="description" class="form-control" rows="3"></textarea>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-lg"><i
                                            class="fas fa-save me-2"></i>Add Product</button>
                                    <a href="${pageContext.request.contextPath}/admin/products"
                                        class="btn btn-secondary btn-lg ms-2">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/script.js"></script>
        </body>

        </html>