package com.blacklee.admin.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
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
	@Resource
	private BlogsClassification blogsClassification;
	//为博文表添加数据
	public Boolean insert(String title, String label, String content, String type, String classification){
		blogs.setTitle(title);
		blogs.setLabel(label);
		blogsContent.setContent(content);
		blogs.setContentId(blogsContent);
		blogsContent.setBlogsId(blogs);
		
		return false;
	}
}
