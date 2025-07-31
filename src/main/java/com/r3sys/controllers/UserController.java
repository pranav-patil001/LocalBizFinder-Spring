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

import com.r3sys.dao.*;
import com.r3sys.model.*;

@Controller
public class UserController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	BusinessOwner businessOwner = (BusinessOwner) context.getBean("businessOwner");
	BusinessOwnerDao businessOwnerDao = (BusinessOwnerDao)context.getBean("businessOwnerDao");
	User user = (User)context.getBean("user");
	UserDao userDao = (UserDao)context.getBean("userDao");
	@RequestMapping("/UserRegister")
	public String openUserRegister(){
		return "UserRegister";
	}
	
	@RequestMapping(path="/UserRegisterSubmit", method=RequestMethod.POST)
	public String openUserRegisterSubmit(HttpServletRequest request){
		
		user.setUserContact(request.getParameter("userContact"));
		user.setUserName(request.getParameter("userName"));
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserPassword(request.getParameter("userPassword"));
		user.setUserCity(request.getParameter("userCity"));
		
		userDao.inserUser(user);
		return "UserLogin";
		
	}
	
	@RequestMapping("/UserLogin")
	public String openUserLogin(){
		return "UserLogin";
	}
	
	@RequestMapping(path="/UserLoginSubmit", method=RequestMethod.POST)
	public String openUserLoginSubmit(HttpServletRequest request){
		
		String userContact = request.getParameter("userContact");
		String userPassword = request.getParameter("userPassword");
		
		user = userDao.getUser(userContact);
		if(user != null){
			if(userContact.equals(user.getUserContact()) && userPassword.equals(user.getUserPassword())){
				user.setUserContact(userContact);
				return "UserDashboard";
			}else{
				return "UserLogin";
			}
		}else{
			return "UserLogin";
		}
	}
	
	@RequestMapping("/UserSearchBusinessByName")
	public String openUserSearchBusinessByName(){
		return "UserSearchBusinessByName";
	}
	
	@RequestMapping(path="/BusinessNameSubmit", method=RequestMethod.POST)
	public String openBusinessNameSubmit(HttpServletRequest request, Model m){
		String businessName = request.getParameter("businessName");
		
		List<BusinessOwner> allBusinessOwners = (List<BusinessOwner>) businessOwnerDao.getAllBusinessOwner();
		List<BusinessOwner> searchedBusiness = new ArrayList<BusinessOwner>();

		for(BusinessOwner b: allBusinessOwners){
			if(b.getBusinessName().equalsIgnoreCase(businessName)){
				searchedBusiness.add(b);
			}
		}
		m.addAttribute("searchedBusiness", searchedBusiness);
		return "UserSearchBusinessByName";
		
	}
	@RequestMapping(path="/SearchedBusinessDetails")
	public String openSearchedBusinessDetails(HttpServletRequest request, Model m){
		String contact = request.getParameter("contact");
		businessOwner = businessOwnerDao.getBusinessOwner(contact);
		m.addAttribute("businessOwner", businessOwner);
		String userContact = user.getUserContact();
		m.addAttribute("userContact", userContact);
		System.out.println("usercontact is "+userContact);
		return "SearchedBusinessDetails";
	}
	
	@RequestMapping(path="UserPasswordChange")
	public String openUserPasswordChange(HttpServletRequest request){
		return "UserPasswordChange";
	}
	@RequestMapping("/UserPasswordChangeSubmit")
	public String openUserPasswordChangeSubmit(HttpServletRequest request){
		
		String currentPassword = request.getParameter("userCurrentPassword");
		String newPassword = request.getParameter("userNewPassword");
		String userContact = user.getUserContact();
		
		user = userDao.getUser(userContact);
		if(user.getUserPassword().equals(currentPassword)){
			user.setUserPassword(newPassword);
			userDao.updateUser(user);
			return "redirect:/UserPasswordChange";
		}else{
			return "UserDashboard";
		}
	}
	
	
	
	
	

}
