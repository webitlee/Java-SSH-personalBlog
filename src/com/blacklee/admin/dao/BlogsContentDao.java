package com.blacklee.admin.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsContent;

@Repository
@Scope("prototype")
public class BlogsContentDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	private BlogsContent blogsContent;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//根据对应的blog获取记录
	public BlogsContent getContentByBlog(Blogs blog){
		String hql = "from BlogsContent b where b.blogsId = ?";
		Query query = getSession().createQuery(hql);
		return (BlogsContent) query.setEntity(0, blog).uniqueResult();
	}
	
}
