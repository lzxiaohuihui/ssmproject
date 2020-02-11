package com.lz.service;

import com.lz.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> queryAllProduct();

    Product queryProductByPid(int pid);
    void addReview(int pid);
    void sale(int pid, int saleNum);
}
