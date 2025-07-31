package com.r3sys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;

import com.r3sys.model.Review;


@Controller
public class ReviewDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void insertReview(Review obj){
		hibernateTemplate.save(obj);
	}
	
	@Transactional
	public void updateReview(Review obj){
		hibernateTemplate.update(obj);
	}
	
	public Review getReview(String ownerContact){
		return hibernateTemplate.get(Review.class, ownerContact);
	}
	
	public List<Review> getAllReview(){
		return hibernateTemplate.loadAll(Review.class);
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	

}
