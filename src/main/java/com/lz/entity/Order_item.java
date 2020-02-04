package com.lz.entity;

public class Order_item {
    private int oid;
    private int quantity;
    private Product product;

    public Order_item(int oid, int quantity, Product product) {
        this.oid = oid;
        this.quantity = quantity;
        this.product = product;
    }


    public Order_item(){}

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
