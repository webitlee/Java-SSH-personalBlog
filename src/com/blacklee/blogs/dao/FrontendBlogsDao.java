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
		int count = (int) query.uniqueResult();
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
	
	//获取博客阅读总数量
	public Long getVisitSum(){
		String hql = "select sum(b.visit) from Blogs b";
		Query query = getSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}
	
	//获取博客点赞总数量
	public Long getSupportSum(){
		String hql = "select sum(b.support) from Blogs b";
		Query query = getSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}
}
