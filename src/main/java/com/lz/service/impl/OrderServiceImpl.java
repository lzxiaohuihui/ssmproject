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
    public List<Order> queryAllOrder(int uid) {
        return orderMapper.list(uid);
    }


    @Override
    public void addOrder(Order order) {
        orderMapper.add(order);
    }

    @Override
    public void deleteOrder(int uid, int pid) {
        orderMapper.delete(uid,pid);
    }
}
