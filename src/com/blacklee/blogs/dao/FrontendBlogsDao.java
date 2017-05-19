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
		Long count = (Long) (query.uniqueResult());
		return count.intValue();
	}
	//获取指定条数的博文数据
	public List<Blogs> getBlogs(int maxResult, int pageIndex){
		String hql="from Blogs b order by b.id desc";
		Query query = getSession().createQuery(hql);
		List<Blogs> list =  query.setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		return list;
	}
	
	//获取博客阅读总数量
	public Long getVisitSum(){
		String hql = "select sum(b.visit) from Blogs b";
		Query query = getSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}
	
	//获取阅读数前10的标题
	public List<Object> getTitleByVisit(){
			String hql = "select b.title, b.visit from Blogs b order by b.visit desc limit 10";
			Query query = getSession().createQuery(hql);
			List<Object> titleByVisit = query.list();
			return titleByVisit;
	}
	
	//获取点赞前10的标题
	public List<Object> getTitleBySupport(){
		String hql = "select b.title, b.support from Blogs b order by b.support desc limit 10";
		Query query = getSession().createQuery(hql);
		List<Object> titleBySupport = query.list();
		return titleBySupport;
	}
	
	//获取按id倒序前10个标题
	public List<Object> getTitleById(){
		String hql = "select b.title,b.visit from Blogs b order by b.id desc limint 10";
		Query query = getSession().createQuery(hql);
		List<Object> titleById = query.list();
		return titleById;
	}
	
	//获取博客点赞总数量
	public Long getSupportSum(){
		String hql = "select sum(b.support) from Blogs b";
		Query query = getSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}
}
