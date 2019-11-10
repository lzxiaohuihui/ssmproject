package com.lz.test;

import com.lz.entity.Product;
import com.lz.entity.User;
import com.lz.mapper.ProductMapper;
import com.lz.mapper.UserMapper;
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
    private UserMapper userMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private UserService userService;


    @Test
    public void testAdd() {
        Product product = new Product();
        product.setName("new product");
        productMapper.add(product);
    }

    @Test
    public void testList() {
        System.out.println(productMapper);
        List<Product> ps=productMapper.list();
        for (Product p : ps) {
            System.out.println(p.getName());
        }
    }
    @Test
    public void testAddUser(){
        //userMapper.add(new User("ls","24"));
        //User user = userMapper.get(new User("l2","24"));
        //User user = userMapper.checkName("1s");

//        System.out.println(user);
        userService.addUser(new User("ll","26"));
        int uid = userService.getUid("ll");
        userService.createCart(uid);
    }
}
