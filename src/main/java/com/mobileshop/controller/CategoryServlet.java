package com.mobileshop.controller;

import com.mobileshop.dao.CategoryDAO;
import com.mobileshop.model.Category;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            new CategoryDAO().deleteCategory(id);
            response.sendRedirect(request.getContextPath() + "/admin/categories");
            return;
        }

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Category cat = new CategoryDAO().getById(id);
            request.setAttribute("editCategory", cat);
        }

        CategoryDAO dao = new CategoryDAO();
        request.setAttribute("categories", dao.getAllCategories());
        request.getRequestDispatcher("/admin/categories.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("categoryId");
        String name = request.getParameter("categoryName");
        String desc = request.getParameter("description");

        CategoryDAO dao = new CategoryDAO();
        Category cat = new Category();
        cat.setCategoryName(name);
        cat.setDescription(desc);

        if (idStr != null && !idStr.isEmpty()) {
            cat.setCategoryId(Integer.parseInt(idStr));
            dao.updateCategory(cat);
        } else {
            dao.addCategory(cat);
        }

        response.sendRedirect(request.getContextPath() + "/admin/categories");
    }
}
