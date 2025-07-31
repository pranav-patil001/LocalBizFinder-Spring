package com.r3sys.controllers;


import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.*;
import com.r3sys.dao.BusinessOwnerDao;
import com.r3sys.dao.UserDao;
import com.r3sys.model.BusinessOwner;
import com.r3sys.model.User;

@Controller
public class AdminController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	BusinessOwner businessOwner = (BusinessOwner) context.getBean("businessOwner");
	BusinessOwnerDao businessOwnerDao = (BusinessOwnerDao)context.getBean("businessOwnerDao");
	User user = (User)context.getBean("user");
	UserDao userDao = (UserDao)context.getBean("userDao");
	@RequestMapping("/")
	public String openLogin(){
		return "index";
	}
	@RequestMapping("/index")
	public String openLogin2(){
		return "index";
	}
	@RequestMapping("/AdminLogin")
	public String openAdminLogin(){
		return "AdminLogin";
	}
	@RequestMapping(path="/AdminLoginSubmit", method=RequestMethod.POST)
	public String adminLogin(HttpServletRequest request){
		String aemail = request.getParameter("aemail");
		String apassword = request.getParameter("apassword");
		
		if(aemail.equals("admin@gmail.com") && apassword.equals("admin")){
			return "AdminDashboard";
		}else{
			return "index";
		}	
	}
	@RequestMapping("/ViewPendingBusinessOwner")
	public String openViewPendingBusinessOwner(Model m){
		List<BusinessOwner> businessOwners  = businessOwnerDao.getAllBusinessOwner();
		m.addAttribute("businessOwners", businessOwners);
		return "ViewPendingBusinessOwner";
	}
	@RequestMapping("/ViewApprovedBusinessOwner")
	public String openViewApprovedBusinessOwner(Model m){
		List<BusinessOwner> businessOwners  = businessOwnerDao.getAllBusinessOwner();
		m.addAttribute("businessOwners", businessOwners);
		return "ViewApprovedBusinessOwner";
	}
	@RequestMapping("/ViewRejectedBusinessOwner")
	public String openViewRejectedBusinessOwner(Model m){
		List<BusinessOwner> businessOwners  = businessOwnerDao.getAllBusinessOwner();
		m.addAttribute("businessOwners", businessOwners);
		return "ViewRejectedBusinessOwner";
	}
	@RequestMapping("/ChangeBusinessStatus")
	public String openChangeBusinessStatus(HttpServletRequest request){
		String contact = request.getParameter("contact");
		String status = request.getParameter("status");
		
		businessOwner = businessOwnerDao.getBusinessOwner(contact);
		businessOwner.setBusinessStatus(status);
		businessOwnerDao.updateBusinessOwner(businessOwner);
		return "redirect:/ViewPendingBusinessOwner";
		
		
	}
	@RequestMapping("/ViewAllUser")
	public String openViewAllUsers(Model m){	
		List<User> users = userDao.getAllUser();
		m.addAttribute("users", users);
		return "ViewAllUser";
	}
}
