package com.mobileshop.controller;

import com.mobileshop.dao.ProductDAO;
import com.mobileshop.model.Product;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        ProductDAO dao = new ProductDAO();
        Product product = dao.getById(Integer.parseInt(idStr));

        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        request.setAttribute("product", product);
        request.getRequestDispatcher("/jsp/product-detail.jsp").forward(request, response);
    }
}
