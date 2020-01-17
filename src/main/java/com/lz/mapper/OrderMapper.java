package com.lz.mapper;

import com.lz.entity.Order;
import com.lz.entity.Product;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    List<Order> listOrder (int uid);
    List<Product> listProducts (int oid);
    int queryOid(long no);
    void add(Order order);
    void addUserAndOrder(Map map);
    void delete(int oid);
    void deleteUserAndOrder(int oid);
    void payed(int oid);
}
