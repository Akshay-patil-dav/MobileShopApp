package com.mobileshop.dao;

import com.mobileshop.model.CartItem;
import com.mobileshop.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public boolean addToCart(int customerId, int productId, int quantity) {
        // Check if item already in cart
        String checkSql = "SELECT cart_id, quantity FROM cart WHERE customer_id = ? AND product_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(checkSql)) {
            ps.setInt(1, customerId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Update quantity
                int newQty = rs.getInt("quantity") + quantity;
                String updateSql = "UPDATE cart SET quantity = ? WHERE cart_id = ?";
                try (PreparedStatement ps2 = conn.prepareStatement(updateSql)) {
                    ps2.setInt(1, newQty);
                    ps2.setInt(2, rs.getInt("cart_id"));
                    return ps2.executeUpdate() > 0;
                }
            } else {
                String insertSql = "INSERT INTO cart (customer_id, product_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement ps2 = conn.prepareStatement(insertSql)) {
                    ps2.setInt(1, customerId);
                    ps2.setInt(2, productId);
                    ps2.setInt(3, quantity);
                    return ps2.executeUpdate() > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateQuantity(int cartId, int quantity) {
        String sql = "UPDATE cart SET quantity = ? WHERE cart_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setInt(2, cartId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeFromCart(int cartId) {
        String sql = "DELETE FROM cart WHERE cart_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, cartId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<CartItem> getCartItems(int customerId) {
        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT c.*, p.name AS product_name, p.image AS product_image, p.price AS product_price, p.brand FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.customer_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setCartId(rs.getInt("cart_id"));
                item.setCustomerId(rs.getInt("customer_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setProductName(rs.getString("product_name"));
                item.setProductImage(rs.getString("product_image"));
                item.setProductPrice(rs.getDouble("product_price"));
                item.setBrand(rs.getString("brand"));
                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getCartCount(int customerId) {
        String sql = "SELECT COUNT(*) FROM cart WHERE customer_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
                return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void clearCart(int customerId) {
        String sql = "DELETE FROM cart WHERE customer_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
