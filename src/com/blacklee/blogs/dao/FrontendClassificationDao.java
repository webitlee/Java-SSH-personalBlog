package com.blacklee.blogs.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class FrontendClassificationDao {

	@Resource
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//获取所有分类名称
	public List<String> getClassificationName(){
		String hql = "select c.name, c.id from BlogsClassification c";
		Query query = getSession().createQuery(hql);
		List<String> names = query.list();
		return names;
	}
}
