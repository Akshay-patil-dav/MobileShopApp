package com.mobileshop.controller;

import com.mobileshop.dao.ProductDAO;
import com.mobileshop.dao.OrderDAO;
import com.mobileshop.dao.CustomerDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        OrderDAO orderDAO = new OrderDAO();
        CustomerDAO customerDAO = new CustomerDAO();

        request.setAttribute("totalProducts", productDAO.getTotalProducts());
        request.setAttribute("totalOrders", orderDAO.getTotalOrders());
        request.setAttribute("totalCustomers", customerDAO.getTotalCustomers());
        request.setAttribute("totalSales", orderDAO.getTotalSales());

        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}
