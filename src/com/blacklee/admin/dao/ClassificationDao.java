package com.blacklee.admin.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ClassificationDao {
	@Resource
	private SessionFactory sessionFactory;

	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//获取博文所有分类
	@SuppressWarnings("unchecked")
	public List<Object> getClassification(){
		String hql = "select b.name from BlogsClassification b";
		Query query = getSession().createQuery(hql);
		return query.list();
	}
	//根据分类名称获取分类id
	public Integer getIdByClassificationName(String name){
		String hql = "select b.id from BlogsClassification b where b.name = ?";
		Query query = getSession().createQuery(hql).setString(0, name);
		return (Integer) query.uniqueResult();
	}
}
