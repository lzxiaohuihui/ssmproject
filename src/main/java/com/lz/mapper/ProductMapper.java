package com.lz.mapper;

import com.lz.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    public void add(Product product);
    public void delete(int id);
    public Product get(int id);
    public void uptate(Product product);
    public List<Product> list();
    public int count();
    public void addReview(@Param("pid") int pid, @Param("reviewNum") int reviewNum);
    public int queryProductReviewNum(int pid);
    public void sale(@Param("pid") int pid, @Param("saleNum") int saleNum);
    public int queryProductSales(int pid);
}
