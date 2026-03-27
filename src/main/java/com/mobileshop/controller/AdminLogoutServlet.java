package com.mobileshop.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminLogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("admin");
            session.removeAttribute("adminName");
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
}
