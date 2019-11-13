package com.lz.entity;

import java.util.Date;

public class Review {
    private int pid ;
    private int uid;
    private String content;
    private Date date;

    public Review(int pid, int uid, String content, Date date) {
        this.pid = pid;
        this.uid = uid;
        this.content = content;
        this.date = date;
    }
    public Review() {
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
