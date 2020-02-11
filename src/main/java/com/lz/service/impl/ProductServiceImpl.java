package com.lz.service.impl;

import com.lz.entity.Product;
import com.lz.mapper.ProductMapper;
import com.lz.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;


    public void setProductMapper(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public List<Product> queryAllProduct() {
        return productMapper.list();
    }

    @Override
    public Product queryProductByPid(int pid) {
        return productMapper.get(pid);
    }

    @Override
    public void addReview(int pid) {
        int reviewNum = productMapper.queryProductReviewNum(pid);
        productMapper.addReview(pid,reviewNum+1);
    }

    @Override
    public void sale(int pid, int saleNum) {
        saleNum += productMapper.queryProductReviewNum(pid);
        productMapper.sale(pid, saleNum);
    }

}
