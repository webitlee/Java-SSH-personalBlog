package com.blacklee.admin.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsContent;

@Repository
public class BlogsContentDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	private Blogs blogs;
	@Autowired
	private BlogsContent blogsContent;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//添加博文详细内容
	
	public Boolean insert(String content){
		blogsContent.setContent(content);
		blogsContent.setBlogsId(blogs);
		Integer result = (Integer) getSession().save(blogsContent);
		if(result != null){
			return true;
		}else{
			return false;
		}
	}
}
