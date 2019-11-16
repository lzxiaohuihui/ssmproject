package com.lz.entity;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.sql.Timestamp;
import java.util.Date;

public class Order {
    private int uid;
    private int pid;
    private int quantity;
    private Date date;

    public Order(int uid, int pid, int quantity, Timestamp date) {
        this.uid = uid;
        this.pid = pid;
        this.quantity = quantity;
        this.date = date;
    }
    public Order(int uid, int pid, int quantity) {
        this.uid = uid;
        this.pid = pid;
        this.quantity = quantity;
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

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
