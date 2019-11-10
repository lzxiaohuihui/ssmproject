package com.lz.test;

import com.lz.entity.Product;
import com.lz.mapper.ProductMapper;
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
}
