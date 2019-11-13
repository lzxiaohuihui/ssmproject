package com.lz.service;

import com.lz.entity.Review;

import java.util.List;

public interface ReviewService {
    List<Review> queryReviewByPid(int pid);
    void addReviewByPid(Review review);
}
