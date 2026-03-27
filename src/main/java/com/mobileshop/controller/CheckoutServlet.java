package com.mobileshop.controller;

import com.mobileshop.dao.CartDAO;
import com.mobileshop.dao.CustomerDAO;
import com.mobileshop.model.CartItem;
import com.mobileshop.model.Customer;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");

        CartDAO cartDAO = new CartDAO();
        CustomerDAO customerDAO = new CustomerDAO();

        List<CartItem> cartItems = cartDAO.getCartItems(customerId);
        Customer customer = customerDAO.getById(customerId);

        if (cartItems.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getSubtotal();
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", total);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/jsp/checkout.jsp").forward(request, response);
    }
}
