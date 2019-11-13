package com.lz.mapper;

import com.lz.entity.Review;

import java.util.List;

public interface ReviewMapper {
    void addReview(Review review);
    List<Review> queryReview(int pid);

}
