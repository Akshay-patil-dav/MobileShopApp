package com.mobileshop.controller;

import com.mobileshop.dao.ProductDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            ProductDAO dao = new ProductDAO();
            dao.deleteProduct(Integer.parseInt(idStr));
        }
        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}
