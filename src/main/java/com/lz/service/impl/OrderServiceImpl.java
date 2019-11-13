package com.lz.service.impl;

import com.lz.entity.Order;
import com.lz.mapper.OrderMapper;
import com.lz.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<Order> queryAllOrder() {
        return orderMapper.list();
    }

    @Override
    public void addOder(Order order) {
        orderMapper.add(order);
    }
}
