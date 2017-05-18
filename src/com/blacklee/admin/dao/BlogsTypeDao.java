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
	
	public BlogsType getTypeByBlog(Blogs blog){
		String hql = "from BlogsType b where b.blogsId = ?";
		Query query = getSession().createQuery(hql);
		return (BlogsType) query.setEntity(0, blog).uniqueResult();
	}
}
