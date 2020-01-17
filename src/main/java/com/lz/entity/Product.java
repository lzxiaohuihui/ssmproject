package com.lz.entity;

public class Product {
    private int pid;
    private String name;
    private float price;
    private int stock;
    private int sales;
    private int reviews;

    public int getReviews() {
        return reviews;
    }

    public void setReviews(int reviews) {
        this.reviews = reviews;
    }

    public Product() {
    }
    public Product(int pid, String name, float price) {
        this.pid = pid;
        this.name = name;
        this.price = price;
    }
    public Product(int pid, String name, float price, int stock, int sales, int reviews) {
        this.pid = pid;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.sales = sales;
        this.reviews = reviews;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }
}
