package com.lz.service;

import com.lz.entity.Order;

import java.sql.Timestamp;
import java.util.List;

public interface OrderService {
    List<Order> queryAllOrder (int uid);
    void addOrder(Order order);
    void deleteOrder(int uid, int pid);
}
