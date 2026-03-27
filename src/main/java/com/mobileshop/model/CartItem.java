package com.mobileshop.model;

public class CartItem {
    private int cartId;
    private int customerId;
    private int productId;
    private int quantity;
    private String productName;
    private String productImage;
    private double productPrice;
    private String brand;

    public CartItem() {}

    public int getCartId() { return cartId; }
    public void setCartId(int cartId) { this.cartId = cartId; }
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    public String getProductImage() { return productImage; }
    public void setProductImage(String productImage) { this.productImage = productImage; }
    public double getProductPrice() { return productPrice; }
    public void setProductPrice(double productPrice) { this.productPrice = productPrice; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public double getSubtotal() {
        return productPrice * quantity;
    }
}
