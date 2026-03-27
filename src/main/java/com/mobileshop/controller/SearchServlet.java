package com.mobileshop.controller;

import com.mobileshop.dao.ProductDAO;
import com.mobileshop.model.Product;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        ProductDAO dao = new ProductDAO();

        List<Product> products;
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = dao.searchProducts(keyword.trim());
            request.setAttribute("keyword", keyword);
        } else {
            products = dao.getAllProducts();
        }

        request.setAttribute("products", products);
        request.setAttribute("brands", dao.getAllBrands());
        request.getRequestDispatcher("/jsp/products.jsp").forward(request, response);
    }
}
