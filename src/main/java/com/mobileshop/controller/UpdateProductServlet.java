package com.mobileshop.controller;

import com.mobileshop.dao.ProductDAO;
import com.mobileshop.dao.CategoryDAO;
import com.mobileshop.model.Product;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import java.util.*;

public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
            return;
        }

        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        Product product = productDAO.getById(Integer.parseInt(idStr));
        request.setAttribute("product", product);
        request.setAttribute("categories", categoryDAO.getAllCategories());
        request.getRequestDispatcher("/admin/edit-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uploadDir = getServletContext().getRealPath("/images/products");
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists())
            uploadFolder.mkdirs();


        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        Product product = new Product();
        String imageName = "";
        String existingImage = "";

        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String value = item.getString("UTF-8");
                    switch (fieldName) {
                        case "productId":
                            product.setProductId(Integer.parseInt(value));
                            break;
                        case "name":
                            product.setName(value);
                            break;
                        case "brand":
                            product.setBrand(value);
                            break;
                        case "price":
                            product.setPrice(Double.parseDouble(value));
                            break;
                        case "ram":
                            product.setRam(value);
                            break;
                        case "storage":
                            product.setStorage(value);
                            break;
                        case "camera":
                            product.setCamera(value);
                            break;
                        case "battery":
                            product.setBattery(value);
                            break;
                        case "displaySize":
                            product.setDisplaySize(value);
                            break;
                        case "processor":
                            product.setProcessor(value);
                            break;
                        case "os":
                            product.setOs(value);
                            break;
                        case "description":
                            product.setDescription(value);
                            break;
                        case "categoryId":
                            product.setCategoryId(Integer.parseInt(value));
                            break;
                        case "stock":
                            product.setStock(Integer.parseInt(value));
                            break;
                        case "featured":
                            product.setFeatured("on".equals(value) || "true".equals(value));
                            break;
                        case "existingImage":
                            existingImage = value;
                            break;
                    }
                } else {
                    if (item.getSize() > 0) {
                        imageName = System.currentTimeMillis() + "_" + item.getName();
                        File file = new File(uploadDir + File.separator + imageName);
                        item.write(file);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (imageName.isEmpty()) {
            product.setImage(existingImage);
        } else {
            product.setImage(imageName);
        }

        ProductDAO dao = new ProductDAO();
        dao.updateProduct(product);

        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}
