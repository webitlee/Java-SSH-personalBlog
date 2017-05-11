package com.blacklee.admin.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.BlogsClassification;

@Repository
public class ClassificationDao {
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private BlogsClassification blogsClassification;

	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//获取博文所有分类
	@SuppressWarnings("unchecked")
	public List<Object> getClassification(){
		String hql = "from BlogsClassification b";
		Query query = getSession().createQuery(hql);
		return query.list();
	}
	//根据分类名称获取分类id
	public Integer getIdByClassificationName(String name){
		String hql = "select b.id from BlogsClassification b where b.name = ?";
		Query query = getSession().createQuery(hql).setString(0, name);
		return (Integer) query.uniqueResult();
	}
	
	//添加新分类
	public void save(String name){
		blogsClassification.setName(name);
		getSession().save(blogsClassification);
	}
	
	//根据id修改分类名
	public void update(Integer id, String name){
		BlogsClassification classification = (BlogsClassification) getSession().get(BlogsClassification.class, id);
		classification.setName(name);
	}
}
