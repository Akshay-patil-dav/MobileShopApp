package com.mobileshop.model;

public class Product {
    private int productId;
    private String name;
    private String brand;
    private double price;
    private String ram;
    private String storage;
    private String camera;
    private String battery;
    private String displaySize;
    private String processor;
    private String os;
    private String description;
    private String image;
    private int categoryId;
    private String categoryName;
    private int stock;
    private boolean featured;

    public Product() {}

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getRam() { return ram; }
    public void setRam(String ram) { this.ram = ram; }
    public String getStorage() { return storage; }
    public void setStorage(String storage) { this.storage = storage; }
    public String getCamera() { return camera; }
    public void setCamera(String camera) { this.camera = camera; }
    public String getBattery() { return battery; }
    public void setBattery(String battery) { this.battery = battery; }
    public String getDisplaySize() { return displaySize; }
    public void setDisplaySize(String displaySize) { this.displaySize = displaySize; }
    public String getProcessor() { return processor; }
    public void setProcessor(String processor) { this.processor = processor; }
    public String getOs() { return os; }
    public void setOs(String os) { this.os = os; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }
    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
    public boolean isFeatured() { return featured; }
    public void setFeatured(boolean featured) { this.featured = featured; }
}
