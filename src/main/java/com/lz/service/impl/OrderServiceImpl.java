package com.lz.service.impl;

import com.lz.entity.Order;
import com.lz.entity.Product;
import com.lz.mapper.OrderMapper;
import com.lz.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<Order> queryAllOrder(int uid) {
        return orderMapper.listOrder(uid);
    }

    public List<Product> queryOrderProduct(int oid){
        return orderMapper.listProducts(oid);
    }

    @Override
    public void payed(int oid) {
        orderMapper.payed(oid);
    }


    @Override
    public void addOrder(Order order, int[] pid) {
        orderMapper.add(order);
        int oid = orderMapper.queryOid(order.getNo());
        Map<String,Object> map = new HashMap<>();

        for (int p:pid){
            map.put("oid",oid);
            map.put("pid", p);
            orderMapper.addUserAndOrder(map);
            map.clear();
        }
    }


    @Override
    public void deleteOrder(int oid) {
        orderMapper.delete(oid);
        orderMapper.deleteUserAndOrder(oid);
    }
}
