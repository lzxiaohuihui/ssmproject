package com.lz.entity;

public class User {
    private int uid;
    private String username;
    private String pwd;

    public User(int uid, String username, String pwd) {
        this.uid = uid;
        this.username = username;
        this.pwd = pwd;
    }
    public User(String username, String pwd) {
        this.username = username;
        this.pwd = pwd;
    }
    public User() {
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return this.username+"-"+this.pwd;
    }
}
