package com.blacklee.admin.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.BlogsContent;

@Repository
public class BlogsContentDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	private BlogsContent blogsContent;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
}
