package com.lz.entity;

public class Cart_item {
    private int cid;
    private int pid;
    private int quantity;

    public Cart_item(int cid, int pid, int quantity) {
        this.cid = cid;
        this.pid = pid;
        this.quantity = quantity;
    }

    public Cart_item(){}

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
