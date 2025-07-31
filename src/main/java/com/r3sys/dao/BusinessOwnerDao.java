package com.r3sys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.r3sys.model.BusinessOwner;

@Component
public class BusinessOwnerDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void insertBusinessOwner(BusinessOwner obj){
		hibernateTemplate.save(obj);
	}
	@Transactional
	public void updateBusinessOwner(BusinessOwner obj){
		hibernateTemplate.update(obj);
	}
	public BusinessOwner getBusinessOwner(String ownerContact){
		return hibernateTemplate.get(BusinessOwner.class, ownerContact);
	}
	public List<BusinessOwner> getAllBusinessOwner(){
		return hibernateTemplate.loadAll(BusinessOwner.class);
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}