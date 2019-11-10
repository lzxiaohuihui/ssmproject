package com.lz.controller;


import com.lz.entity.Product;
import com.lz.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

//接口/类    注解   配置
@RequestMapping("")
@Controller
public class IndexController {

    @Autowired
    ProductService productService;


    @RequestMapping("/index")
    public String queryAllProduct(Map<String,Object> map) {
        List<Product> products = (List<Product>) productService.queryAllProduct();
        map.put("products",products) ;
        return "index";
    }

}
