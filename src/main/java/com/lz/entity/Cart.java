package com.lz.entity;

public class Cart {
    private int uid;
    private int cid;

    public Cart(int uid, int cid) {
        this.uid = uid;
        this.cid = cid;
    }
    public Cart(){}

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
