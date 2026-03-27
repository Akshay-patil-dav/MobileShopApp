<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Manage Customers - Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
        </head>

        <body class="admin-body">
            <jsp:include page="sidebar.jsp">
                <jsp:param name="page" value="customers" />
            </jsp:include>

            <div class="admin-content">
                <jsp:include page="header.jsp" />

                <div class="admin-main p-4">
                    <h4 class="fw-bold mb-4"><i class="fas fa-users me-2"></i>Manage Customers</h4>

                    <div class="admin-card">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>City</th>
                                        <th>Joined</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="c" items="${customers}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td class="fw-semibold">${c.name}</td>
                                            <td>${c.email}</td>
                                            <td>${c.phone}</td>
                                            <td>${c.city}</td>
                                            <td><small>${c.createdAt}</small></td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/customers?action=delete&id=${c.customerId}"
                                                    class="btn btn-sm btn-outline-danger"
                                                    onclick="return confirm('Delete this customer?')"><i
                                                        class="fas fa-trash"></i></a>
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