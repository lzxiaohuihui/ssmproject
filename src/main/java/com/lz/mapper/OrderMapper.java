package com.lz.mapper;

import com.lz.entity.Order;
import com.lz.entity.Order_item;
import com.lz.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    List<Order> listOrder (int uid);
    List<Product> listProducts (int oid);
    List<Order_item> listOrderItem(int oid);
    int queryOid(long no);
    void add(Order order);
    void addUserAndOrder(Map map);
    void delete(int oid);
    void deleteUserAndOrder(int oid);
    void setStatus(@Param("oid") int oid, @Param("status") int status);
    int queryStatus(int oid);
}
