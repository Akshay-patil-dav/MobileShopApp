package com.mobileshop.controller;

import com.mobileshop.dao.CartDAO;
import com.mobileshop.dao.OrderDAO;
import com.mobileshop.model.CartItem;
import com.mobileshop.model.Order;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");

        String shippingAddress = request.getParameter("shippingAddress");
        String paymentMethod = request.getParameter("paymentMethod");
        if (paymentMethod == null || paymentMethod.isEmpty()) {
            paymentMethod = "COD";
        }

        CartDAO cartDAO = new CartDAO();
        List<CartItem> cartItems = cartDAO.getCartItems(customerId);

        if (cartItems.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getSubtotal();
        }

        Order order = new Order();
        order.setCustomerId(customerId);
        order.setTotalAmount(total);
        order.setShippingAddress(shippingAddress);
        order.setPaymentMethod(paymentMethod);

        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.placeOrder(order, cartItems);

        if (orderId > 0) {
            cartDAO.clearCart(customerId);
            request.setAttribute("orderId", orderId);
            request.setAttribute("totalAmount", total);
            request.getRequestDispatcher("/jsp/order-confirmation.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Order placement failed!");
            response.sendRedirect(request.getContextPath() + "/checkout");
        }
    }
}
