package com.lz.service.impl;

import com.lz.entity.Review;
import com.lz.mapper.ReviewMapper;
import com.lz.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewMapper reviewMapper;
    @Override
    public List<Review> queryReviewByPid(int pid) {
        return reviewMapper.queryReview(pid);
    }

    @Override
    public void addReviewByPid(Review review) {
        reviewMapper.addReview(review);
    }
}
