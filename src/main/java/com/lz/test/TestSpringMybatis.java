package com.lz.test;

import com.lz.entity.Order;
import com.lz.entity.Product;
import com.lz.mapper.ProductMapper;
import com.lz.service.CartService;
import com.lz.service.OrderService;
import com.lz.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestSpringMybatis {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    @Test
    public void testTemp(){

    }
}
