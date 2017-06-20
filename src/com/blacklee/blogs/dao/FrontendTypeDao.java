package com.blacklee.blogs.dao;


import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blacklee.util.SessionUtil;

@Repository
public class FrontendTypeDao {
	@Autowired
	private SessionUtil sessionUtil;
	
	//获取原创的博客篇数
	public Long getOriginal(){
		String hql = "select count(*) from BlogsType b where b.name = ?";
		Query query = sessionUtil.getSession().createQuery(hql);
		Long sum = (Long) query.setString(0, "原创").uniqueResult();
		return sum;
	}
	
	//获取转载的博客篇数
	public Long getCoyp(){
		String hql = "select count(*) from BlogsType b where b.name = ?";
		Query query = sessionUtil.getSession().createQuery(hql);
		Long sum = (Long) query.setString(0, "转载").uniqueResult();
		return sum;
	}
}
