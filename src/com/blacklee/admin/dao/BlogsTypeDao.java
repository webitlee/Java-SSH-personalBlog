package com.blacklee.admin.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsType;
import com.blacklee.util.SessionUtil;

@Repository
@Scope("prototype")
public class BlogsTypeDao {
	@Resource
	private BlogsType blogsType;
	@Autowired
	private SessionUtil sessionUtil;
	//根据博客对象获取博客类型
	public BlogsType getTypeByBlog(Blogs blog){
		String hql = "from BlogsType b where b.blogsId = ?";
		Query query = sessionUtil.getSession().createQuery(hql);
		return (BlogsType) query.setEntity(0, blog).uniqueResult();
	}
	
	//按类型名称获取博客总数
	public Integer getTypeSum(String typeName){
		String hql = "select count(*) from BlogsType t where t.name = ?";
		Query query = sessionUtil.getSession().createQuery(hql);
		Long originalSum = (Long) query.setString(0, typeName).uniqueResult();
		return originalSum.intValue();
	}
}
