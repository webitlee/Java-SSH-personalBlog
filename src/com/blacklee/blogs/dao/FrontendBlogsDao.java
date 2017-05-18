package com.blacklee.blogs.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;

@Repository
public class FrontendBlogsDao {

	@Resource
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//查询记录的总条数
	public Integer getBlogsCount(){
		String hql = "select count(*) from Blogs";
		Query query = getSession().createQuery(hql);
		Integer count = query.list().size();
		return count;
	}
	//获取指定条数的博文数据
	public List<Blogs> getBlogs(int maxResult, int pageIndex){
		String hql="from Blogs b order by b.id desc";
		Query query = getSession().createQuery(hql);
		List<Blogs> list =  query.setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		System.out.println(list);
		return list;
	}
}
