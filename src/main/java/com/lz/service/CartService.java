package com.lz.service;

import com.lz.entity.Product;

import java.util.List;

public interface CartService {
    List<Product> getCartProducts (int uid);
    void addCart(int uid, int pid, int quantity);
    void deleteCart(int uid ,int pid);
}
