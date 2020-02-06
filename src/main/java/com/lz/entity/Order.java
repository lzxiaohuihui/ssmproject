package com.lz.entity;

import java.sql.Timestamp;

public class Order {
    private int uid;
    private int oid;
    private Timestamp date;
    private long no;
    private String address;
    private int post;
    private String receiver;
    private long mobile;
    private float price;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }


    public Order(String address, int post, String receiver, long mobile) {
        this.address = address;
        this.post = post;
        this.receiver = receiver;
        this.mobile = mobile;
    }
    public Order(int uid, Timestamp date) {
        this.uid = uid;
        this.date = date;
    }

    public Order(int uid) {
        this.uid = uid;
    }
    public Order(int uid, int oid, Timestamp date, long no, String address, int post, String receiver, long mobile) {
        this.uid = uid;
        this.oid = oid;
        this.date = date;
        this.no = no;
        this.address = address;
        this.post = post;
        this.receiver = receiver;
        this.mobile = mobile;
    }
    public Order(int uid, Timestamp date, long no, String address, int post, String receiver, long mobile) {
        this.uid = uid;
        this.date = date;
        this.no = no;
        this.address = address;
        this.post = post;
        this.receiver = receiver;
        this.mobile = mobile;
    }

    public Order(int uid, int oid, Timestamp date, long no, String address, int post, String receiver, long mobile, float price, int status) {
        this.uid = uid;
        this.oid = oid;
        this.date = date;
        this.no = no;
        this.address = address;
        this.post = post;
        this.receiver = receiver;
        this.mobile = mobile;
        this.price = price;
        this.status = status;
    }

    public Order() {
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public long getNo() {
        return no;
    }

    public void setNo(long no) {
        this.no = no;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPost() {
        return post;
    }

    public void setPost(int post) {
        this.post = post;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public long getMobile() {
        return mobile;
    }

    public void setMobile(long mobile) {
        this.mobile = mobile;
    }


    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }


    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
