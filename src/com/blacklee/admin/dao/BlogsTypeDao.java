package com.blacklee.admin.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsType;

@Repository
@Scope("prototype")
public class BlogsTypeDao {
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private BlogsType blogsType;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//根据博客对象获取博客类型
	public BlogsType getTypeByBlog(Blogs blog){
		String hql = "from BlogsType b where b.blogsId = ?";
		Query query = getSession().createQuery(hql);
		return (BlogsType) query.setEntity(0, blog).uniqueResult();
	}
	
	//按类型名称获取博客总数
	public Integer getTypeSum(String typeName){
		String hql = "select count(*) from BlogsType t where t.name = ?";
		Query query = getSession().createQuery(hql);
		Long originalSum = (Long) query.setString(0, typeName).uniqueResult();
		return originalSum.intValue();
	}
}
