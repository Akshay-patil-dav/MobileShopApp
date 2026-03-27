package com.mobileshop.controller;

import com.mobileshop.dao.CartDAO;
import com.mobileshop.model.CartItem;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");

        CartDAO dao = new CartDAO();
        List<CartItem> cartItems = dao.getCartItems(customerId);

        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getSubtotal();
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", total);
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");

        String action = request.getParameter("action");
        CartDAO dao = new CartDAO();

        switch (action) {
            case "add":
                int productId = Integer.parseInt(request.getParameter("productId"));
                int quantity = 1;
                String qtyStr = request.getParameter("quantity");
                if (qtyStr != null && !qtyStr.isEmpty()) {
                    quantity = Integer.parseInt(qtyStr);
                }
                dao.addToCart(customerId, productId, quantity);
                // Redirect back to referring page or cart
                String referer = request.getHeader("Referer");
                if (referer != null) {
                    response.sendRedirect(referer);
                } else {
                    response.sendRedirect(request.getContextPath() + "/cart");
                }
                break;

            case "update":
                int cartId = Integer.parseInt(request.getParameter("cartId"));
                int newQty = Integer.parseInt(request.getParameter("quantity"));
                if (newQty <= 0) {
                    dao.removeFromCart(cartId);
                } else {
                    dao.updateQuantity(cartId, newQty);
                }
                response.sendRedirect(request.getContextPath() + "/cart");
                break;

            case "remove":
                int removeId = Integer.parseInt(request.getParameter("cartId"));
                dao.removeFromCart(removeId);
                response.sendRedirect(request.getContextPath() + "/cart");
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/cart");
        }
    }
}
