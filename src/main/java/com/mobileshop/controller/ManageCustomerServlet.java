package com.mobileshop.controller;

import com.mobileshop.dao.CustomerDAO;
import com.mobileshop.model.Customer;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ManageCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        CustomerDAO dao = new CustomerDAO();

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteCustomer(id);
            response.sendRedirect(request.getContextPath() + "/admin/customers");
            return;
        }

        List<Customer> customers = dao.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/admin/customers.jsp").forward(request, response);
    }
}
