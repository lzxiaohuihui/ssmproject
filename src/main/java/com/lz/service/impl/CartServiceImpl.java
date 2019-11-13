package com.lz.service.impl;

import com.lz.entity.Product;
import com.lz.mapper.CartMapper;
import com.lz.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartMapper cartMapper;

    @Override
    public List<Product> getCartProducts(int uid) {
        return cartMapper.list(uid);
    }

    @Override
    public void addCart(int uid, int pid) {
        cartMapper.add(uid,pid);
    }
}
