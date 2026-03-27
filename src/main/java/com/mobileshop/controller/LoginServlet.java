package com.mobileshop.controller;

import com.mobileshop.dao.CustomerDAO;
import com.mobileshop.model.Customer;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.login(email, password);

        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            session.setAttribute("customerId", customer.getCustomerId());
            session.setAttribute("customerName", customer.getName());

            String redirect = (String) session.getAttribute("redirectAfterLogin");
            if (redirect != null) {
                session.removeAttribute("redirectAfterLogin");
                response.sendRedirect(redirect);
            } else {
                response.sendRedirect(request.getContextPath() + "/");
            }
        } else {
            request.setAttribute("error", "Invalid email or password!");
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        }
    }
}
