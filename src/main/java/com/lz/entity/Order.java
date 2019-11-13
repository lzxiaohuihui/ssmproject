package com.lz.entity;

import java.util.Date;

public class Order {
    private int uid;
    private int pid;
    private int quantity;
    private Date date;

    public Order(int uid, int pid, int quantity, Date date) {
        this.uid = uid;
        this.pid = pid;
        this.quantity = quantity;
        this.date = date;
    }
    public Order() {
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
