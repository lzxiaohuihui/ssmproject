package com.lz.mapper;

import com.lz.entity.Order;

import java.util.List;

public interface OrderMapper {
    List<Order> list ();
    void add(Order order);
}
