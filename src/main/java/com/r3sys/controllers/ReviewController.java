package com.r3sys.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.r3sys.dao.BusinessOwnerDao;
import com.r3sys.dao.ReviewDao;
import com.r3sys.model.BusinessOwner;
import com.r3sys.model.Review;

@Controller
public class ReviewController {
	
	
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	/*BusinessOwner businessOwner = (BusinessOwner) context.getBean("businessOwner");
	BusinessOwnerDao businessOwnerDao = (BusinessOwnerDao)context.getBean("businessOwnerDao");*/
	Review review = (Review)context.getBean("review");
	ReviewDao reviewDao = (ReviewDao)context.getBean("reviewDao");
	
	@RequestMapping(path="/ReviewSubmit", method=RequestMethod.POST)
	public String openReviewSubmit(HttpServletRequest request){
		
		review.setUserContact(request.getParameter("userContact"));
		review.setOwnerContact(request.getParameter("ownerContact"));
		review.setRating(Integer.parseInt(request.getParameter("rating")));
		review.setComment(request.getParameter("comment"));
		review.setDate(request.getParameter("date"));
		reviewDao.insertReview(review);
		return "UserDashboard";	
	}

	
	
	
}
