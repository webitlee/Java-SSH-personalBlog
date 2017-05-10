package com.blacklee.admin.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsClassification;
import com.blacklee.admin.entity.BlogsContent;
import com.blacklee.admin.entity.BlogsType;

@Repository
public class BlogsDao {

	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private Blogs blogs;
	@Resource
	private BlogsContent blogsContent;
	@Resource
	private BlogsType blogsType;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//为博文表添加数据
	public void insert(String title, String label, String content, String type, Integer classificationId){
		blogs.setTitle(title);
		blogs.setLabel(label);
		blogsContent.setContent(content);
		blogs.setContentId(blogsContent);
		blogsContent.setBlogsId(blogs);
		blogsType.setName(type);
		blogs.setTypeId(blogsType);
		blogsType.setBlogsId(blogs);
		BlogsClassification classification= (BlogsClassification) getSession().get(BlogsClassification.class, classificationId);
		classification.getBlogs().add(blogs);
		blogs.getClassification().add(classification);
		blogs.setCreateTime(new Date());
		blogs.setLastModified(new Date());
		getSession().save(blogs);
		getSession().save(blogsContent);
		getSession().save(blogsType);

	}
	
}
