package com.lz.service;

import com.lz.entity.Order;

import java.util.List;

public interface OrderService {
    List<Order> queryAllOrder ();
    void addOder(Order order);
}
