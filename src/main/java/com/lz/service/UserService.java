package com.lz.service;

import com.lz.entity.User;

public interface UserService {
    boolean isUser (User user);
    void addUser(User user);
    boolean checkName(String username);
    int getUid(String username);
    void createCart(int uid);
    String getName(int uid);
}
