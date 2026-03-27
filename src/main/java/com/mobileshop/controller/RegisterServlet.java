package com.mobileshop.controller;

import com.mobileshop.dao.CustomerDAO;
import com.mobileshop.model.Customer;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");

        CustomerDAO dao = new CustomerDAO();

        if (dao.isEmailExists(email)) {
            request.setAttribute("error", "Email already registered!");
            request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
            return;
        }

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setPhone(phone);
        customer.setPassword(password);
        customer.setAddress(address);
        customer.setCity(city);
        customer.setState(state);
        customer.setPincode(pincode);

        if (dao.register(customer)) {
            request.setAttribute("success", "Registration successful! Please login.");
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed! Please try again.");
            request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
        }
    }
}
