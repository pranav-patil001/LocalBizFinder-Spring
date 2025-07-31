package com.r3sys.controllers;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.r3sys.dao.BusinessOwnerDao;
import com.r3sys.dao.ReviewDao;
import com.r3sys.dao.UserDao;
import com.r3sys.model.BusinessOwner;
import com.r3sys.model.Review;
import com.r3sys.model.User;



@Controller
public class BusinessOwnerController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	BusinessOwner businessOwner = (BusinessOwner) context.getBean("businessOwner");
	BusinessOwnerDao businessOwnerDao = (BusinessOwnerDao)context.getBean("businessOwnerDao");
	Review review = (Review)context.getBean("review");
	ReviewDao reviewDao = (ReviewDao)context.getBean("reviewDao");
	User user = (User)context.getBean("user");
	UserDao userDao = (UserDao)context.getBean("userDao");
	
	@RequestMapping("/BusinessOwnerRegister")
	public String openBusinessOwnerRegister(){
		return "BusinessOwnerRegister";
	}
	
	@RequestMapping(path="/BusinessOwnerRegisterSubmit", method=RequestMethod.POST)
	public String submitBusinessOwnerRegister(HttpServletRequest request){
		
		businessOwner.setOwnerName(request.getParameter("ownerName"));
		businessOwner.setOwnerEmail(request.getParameter("ownerEmail"));
		businessOwner.setOwnerContact(request.getParameter("ownerContact"));
		businessOwner.setOwnerPassword(request.getParameter("ownerPassword"));
		businessOwner.setOwnerCity(request.getParameter("ownerCity"));
		businessOwner.setBusinessName(request.getParameter("businessName"));
		businessOwner.setBusinessCategory(request.getParameter("businessCategory"));
		businessOwner.setBusinessDescription(request.getParameter("businessDescription"));
		businessOwner.setBusinessAddress(request.getParameter("businessAddress"));
		businessOwner.setBusinessStatus("Pending");
		
		businessOwnerDao.insertBusinessOwner(businessOwner);
		return "BusinessOwnerLogin";
	}
	
	@RequestMapping("/BusinessOwnerLogin")
	public String openBusinessOwnerLogin(){
		return "BusinessOwnerLogin";
	}
	
	@RequestMapping(path="/BusinessOwnerLoginSubmit", method=RequestMethod.POST)
	public String submitBusinessOwnerLogin(HttpServletRequest request){
		String ownerContact = request.getParameter("ownerContact");
		String ownerPassword = request.getParameter("ownerPassword");
		businessOwner = businessOwnerDao.getBusinessOwner(ownerContact);
		if(businessOwner!= null){
			if(businessOwner.getOwnerContact().equals(ownerContact) && businessOwner.getOwnerPassword().equals(ownerPassword)){
				businessOwner.setOwnerContact(ownerContact);
				return "BusinessOwnerDashboard";
			}else{
				System.out.println("first else");
				return "index";	
			}
		}else{
			System.out.println("second else");
			return "index";
			
		}
	}
	
	@RequestMapping("/ViewOwnBusinessInformation")
	public String viewOwnBusinessInformation(Model m){
		
		m.addAttribute("businessOwner", businessOwner);
		return "ViewOwnBusinessInformation";
	}
	@RequestMapping("/UpdateOwnBusinessInformation")
	public String updateOwnBusinessInformation(){
		System.out.println(businessOwner.getOwnerContact());
		return "UpdateOwnBusinessInformation";
	}
	
	@RequestMapping(path="/UpdateOwnBusinessInfoSubmit", method=RequestMethod.POST)
	public String updateOwnBusinessInfoSubmit(HttpServletRequest request){
		businessOwner = businessOwnerDao.getBusinessOwner(businessOwner.getOwnerContact());
		if(businessOwner != null){
			
			String ownerName = request.getParameter("ownerName");
			if (ownerName != null ) {
			    businessOwner.setOwnerName(ownerName);
			}
			businessOwner.setOwnerEmail(request.getParameter("ownerEmail"));
			businessOwner.setOwnerCity(request.getParameter("ownerCity"));
			businessOwner.setBusinessName(request.getParameter("businessName"));
			businessOwner.setBusinessCategory(request.getParameter("businessCategory"));
			businessOwner.setBusinessDescription(request.getParameter("businessDescription"));
			businessOwner.setBusinessAddress(request.getParameter("businessAddress"));
			
			businessOwnerDao.updateBusinessOwner(businessOwner);
			return "redirect:/ViewOwnBusinessInformation";	
		}else{
			return "BusinessOwnerDashboard";
		}
	}
	
	@RequestMapping(path="/ViewReviewsOwnBusiness")
	public String openViewReviewsOwnBusiness(Model m){
		String ownerContact = businessOwner.getOwnerContact();
		List<Review> reviews = (List<Review>)reviewDao.getAllReview();
		List<Review> ownReview = new ArrayList<Review>();
		List<String> userName = new ArrayList<String>();
		for(Review r: reviews){
			if(r.getOwnerContact().equals(ownerContact)){
				ownReview.add(r);
				user = userDao.getUser(r.getUserContact());
				userName.add(user.getUserName());
			}
		}
		m.addAttribute("ownReview", ownReview);
		m.addAttribute("userName", userName);
		return "ViewReviewsOwnBusiness";
	}
	
	@RequestMapping("/ViewAllBusiness")
	public String openViewAllBusiness(Model m){
		
		List<BusinessOwner> allBusiness = (List<BusinessOwner>) businessOwnerDao.getAllBusinessOwner();
		m.addAttribute("allBusiness", allBusiness);
		return "ViewAllBusiness";
	}
	
	@RequestMapping("/ViewAllBusinessReviews")
	public String openViewAllBusinessReviews(HttpServletRequest request, Model m){
		String contact = request.getParameter("contact");
		BusinessOwner businessOwner1 = businessOwnerDao.getBusinessOwner(contact);
		
		List<Review> allreviews = (List<Review>)reviewDao.getAllReview();
		List<Review> review = new ArrayList<Review>();
		List<User> users = new ArrayList<User>();
		List<String> userName = new ArrayList<String>();
		System.out.println("upper"+businessOwner1.getOwnerContact());
		for(Review r: allreviews){
			if(contact.equals(r.getOwnerContact())){
				review.add(r);
				user = userDao.getUser(r.getUserContact());
				userName.add(user.getUserName());
				System.out.println("lower"+businessOwner1.getOwnerContact());
			}
		}
		m.addAttribute("review", review);
		m.addAttribute("businessOwner", businessOwner);
		m.addAttribute("userName", userName);
		return "ViewAllBusinessReviews";
	}
	
	@RequestMapping("/BusinessOwnerPasswordChange")
	public String openBusinessOwnerPasswordChange(){
		return "BusinessOwnerPasswordChange";
	}
	
	@RequestMapping("/BusinessOwnerPasswordChangeSubmit")
	public String openBusinessOwnerPasswordChangeSubmit(HttpServletRequest request){
		
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String ownerContact = businessOwner.getOwnerContact();
		
		businessOwner = businessOwnerDao.getBusinessOwner(ownerContact);
		if(businessOwner.getOwnerPassword().equals(currentPassword)){
			businessOwner.setOwnerPassword(newPassword);
			businessOwnerDao.updateBusinessOwner(businessOwner);
			return "redirect:/BusinessOwnerPasswordChange";
		}else{
			return "BusinessOwnerDashboard";
		}
	}

	
	

}
