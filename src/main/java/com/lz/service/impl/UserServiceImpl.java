package com.lz.service.impl;

import com.lz.entity.User;
import com.lz.mapper.UserMapper;
import com.lz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public boolean isUser(User user) {
        if(userMapper.get(user)!=null){
            return true;
        }
        return false;
    }

    @Override
    public void addUser(User user) {
        if(checkName(user.getUsername())) {
            userMapper.add(user);
        }
    }

    @Override
    public boolean checkName(String username) {
        if(userMapper.checkName(username)==null)
            return true;
        return false;
    }

    @Override
    public int getUid(String username) {
        return userMapper.getUid(username);
    }


    @Override
    public void createCart(int uid) {
        if (userMapper.checkCart(uid)<1)
            userMapper.createCart(uid);
    }

    @Override
    public String getName(int uid) {
        return userMapper.getName(uid);
    }

}
