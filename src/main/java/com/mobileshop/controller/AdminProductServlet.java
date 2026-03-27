package com.mobileshop.controller;

import com.mobileshop.dao.ProductDAO;
import com.mobileshop.dao.CategoryDAO;
import com.mobileshop.model.Product;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.setAttribute("categories", categoryDAO.getAllCategories());
        request.getRequestDispatcher("/admin/products.jsp").forward(request, response);
    }
}
