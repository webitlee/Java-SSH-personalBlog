package com.blacklee.blogs.dao;

import java.util.List;


import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blacklee.util.SessionUtil;

@Repository
public class FrontendClassificationDao {
	@Autowired
	private SessionUtil sessionUtil;
	
	//获取所有分类名称
	public List<String> getClassificationName(){
		String hql = "select c.name, c.id from BlogsClassification c";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<String> names = query.list();
		return names;
	}
}
