package com.lz.mapper;

import com.lz.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    List<Product> list(int uid);
    void add(@Param("uid") int uid,@Param("pid") int pid, @Param("quantity") int quantity);
    void delete (@Param("uid") int uid,@Param("pid") int pid);
}
