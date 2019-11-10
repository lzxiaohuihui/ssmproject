package com.lz.mapper;

import com.lz.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    void add(User user);
    User get(User user);
    User checkName(@Param("username") String username);
    void createCart(@Param("uid") int uid);
    int getUid(@Param("username") String username);
    int checkCart(@Param("uid") int uid);
}
