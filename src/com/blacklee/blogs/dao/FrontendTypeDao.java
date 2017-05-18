package com.blacklee.blogs.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class FrontendTypeDao {

	@Resource
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//获取原创的博客篇数
	public Long getOriginal(){
		String hql = "select count(*) from BlogsType b where b.name = ?";
		Query query = getSession().createQuery(hql);
		Long sum = (Long) query.setString(0, "原创").uniqueResult();
		return sum;
	}
	
	//获取转载的博客篇数
	public Long getCoyp(){
		String hql = "select count(*) from BlogsType b where b.name = ?";
		Query query = getSession().createQuery(hql);
		Long sum = (Long) query.setString(0, "转载").uniqueResult();
		return sum;
	}
}
