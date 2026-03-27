package com.mobileshop.controller;

import com.mobileshop.dao.ProductDAO;
import com.mobileshop.dao.CategoryDAO;
import com.mobileshop.model.Product;
import com.mobileshop.model.Category;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        String brand = request.getParameter("brand");
        String category = request.getParameter("category");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");

        List<Product> products;

        if (brand != null && !brand.isEmpty()) {
            products = productDAO.getByBrand(brand);
            request.setAttribute("selectedBrand", brand);
        } else if (category != null && !category.isEmpty()) {
            products = productDAO.getByCategory(Integer.parseInt(category));
            request.setAttribute("selectedCategory", category);
        } else if (minPrice != null && maxPrice != null && !minPrice.isEmpty() && !maxPrice.isEmpty()) {
            products = productDAO.getByPriceRange(Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            request.setAttribute("minPrice", minPrice);
            request.setAttribute("maxPrice", maxPrice);
        } else {
            products = productDAO.getAllProducts();
        }

        List<String> brands = productDAO.getAllBrands();
        List<Category> categories = categoryDAO.getAllCategories();

        request.setAttribute("products", products);
        request.setAttribute("brands", brands);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/jsp/products.jsp").forward(request, response);
    }
}
