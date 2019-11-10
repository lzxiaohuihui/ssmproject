package com.lz.mapper;

import com.lz.entity.Product;

import java.util.List;

public interface ProductMapper {
    public void add(Product product);
    public void delete(int id);
    public Product get(int id);
    public void uptate(Product product);
    public List<Product> list();
    public int count();
}
