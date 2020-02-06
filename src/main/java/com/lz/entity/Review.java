package com.lz.entity;

import java.util.Date;

public class Review {
    private int pid ;
    private String username;
    private String content;
    private Date date;

    public Review(int pid, String username, String content, Date date) {
        this.pid = pid;
        this.username = username;
        this.content = content;
        this.date = date;
    }
    public Review() {
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
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
