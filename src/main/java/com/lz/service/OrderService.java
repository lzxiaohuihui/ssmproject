package com.lz.service;

import com.lz.entity.Order;
import com.lz.entity.Order_item;
import com.lz.entity.Product;

import java.util.List;

public interface OrderService {
    List<Order> queryAllOrder (int uid);
    void addOrder(Order order, int[] pid, int[] quantity);
    void deleteOrder(int oid);
    List<Product> queryOrderProduct(int oid);
    void payed(int oid);
    List<Order_item> queryOrderItem(int oid);
}
