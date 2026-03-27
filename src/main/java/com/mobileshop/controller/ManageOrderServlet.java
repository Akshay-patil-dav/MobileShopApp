package com.mobileshop.controller;

import com.mobileshop.dao.OrderDAO;
import com.mobileshop.model.Order;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ManageOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        OrderDAO dao = new OrderDAO();

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteOrder(id);
            response.sendRedirect(request.getContextPath() + "/admin/orders");
            return;
        }

        if ("view".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Order order = dao.getOrderById(id);
            request.setAttribute("order", order);
            request.getRequestDispatcher("/admin/order-detail.jsp").forward(request, response);
            return;
        }

        List<Order> orders = dao.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        OrderDAO dao = new OrderDAO();
        dao.updateOrderStatus(orderId, status);

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}
