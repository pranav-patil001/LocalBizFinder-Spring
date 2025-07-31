package com.r3sys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.r3sys.model.User;

@Component
public class UserDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void inserUser(User obj){
		hibernateTemplate.save(obj);
	}
	@Transactional
	public void updateUser(User obj){
		hibernateTemplate.update(obj);
	}
	public User getUser(String uid){
		return hibernateTemplate.get(User.class, uid);
	}
	public List<User> getAllUser(){
		return hibernateTemplate.loadAll(User.class);
	}

	public HibernateTemplate getHibernatTemplate() {
		return hibernateTemplate;
	}

	public void setHibernatTemplate(HibernateTemplate hibernatTemplate) {
		this.hibernateTemplate = hibernatTemplate;
	}
	
	

}
