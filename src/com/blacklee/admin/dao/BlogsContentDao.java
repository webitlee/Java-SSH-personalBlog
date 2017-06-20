package com.blacklee.admin.dao;


import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsContent;
import com.blacklee.util.SessionUtil;

@Repository
@Scope("prototype")
public class BlogsContentDao {
	@Autowired
	private SessionUtil sessionUtil;
	@Autowired
	private BlogsContent blogsContent;
	
	//根据对应的blog获取记录
	public BlogsContent getContentByBlog(Blogs blog){
		String hql = "from BlogsContent b where b.blogsId = ?";
		Query query = sessionUtil.getSession().createQuery(hql);
		return (BlogsContent) query.setEntity(0, blog).uniqueResult();
	}
	
}
