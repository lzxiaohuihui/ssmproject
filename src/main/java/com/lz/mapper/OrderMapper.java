package com.lz.mapper;

import com.lz.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    List<Order> list (int uid);
    void add(Order order);
    void delete(@Param("uid") int uid ,@Param("pid") int pid);
}
