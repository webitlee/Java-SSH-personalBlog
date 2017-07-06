package com.blacklee.blogs.dao;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;


import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsClassification;
import com.blacklee.util.SessionUtil;

@Repository
public class FrontendBlogsDao {
	@Autowired
	private SessionUtil sessionUtil;
	
	//查询记录的总条数
	public Integer getBlogsCount(){
		String hql = "select count(*) from Blogs";
		Query query = sessionUtil.getSession().createQuery(hql);
		Long count = (Long) (query.uniqueResult());
		return count.intValue();
	}
	//根据分类查询记录总条数
	public Integer getBlogsCountByClassification(Integer id){
		BlogsClassification classification = (BlogsClassification) sessionUtil.getSession().get(BlogsClassification.class, id); 
		Set<Blogs> blogs = classification.getBlogs();
		return blogs.size();
	}
	//根据关键字查询记录总条数
	public Integer getBlogsCountByKeyword(String keyword){
		String hql = "select count(*) from Blogs b where b.title like ?";
		Query query = sessionUtil.getSession().createQuery(hql);
		Long count = (Long) query.setString(0, "%" + keyword + "%").uniqueResult();
		return count.intValue();
	}
	//获取指定条数的博文数据
	public List<Blogs> getBlogs(int maxResult, int pageIndex){
		String hql="select distinct b from Blogs b order by b.id desc left join fetch b.typeId left join fetch b.classification left join fetch b.contentId";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<Blogs> list =  query.setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		return list;
	}
	
	//根据分类id获取指定条数的博文数据
	public Set<Blogs> getBlogsByClassificationId(Integer classificationId, Integer maxResult, Integer pageIndex){
		BlogsClassification classification = (BlogsClassification) sessionUtil.getSession().get(BlogsClassification.class, classificationId); 
		Set<Blogs> blogs = classification.getBlogs();
		Set<Blogs> pagingBlogs = new HashSet<>();
		int i = 0;
		Iterator<Blogs> it = blogs.iterator();
		while(it.hasNext()){
			i++;
			Blogs blog = it.next();
			if(i >= maxResult * pageIndex && i <= maxResult * pageIndex + maxResult){
				pagingBlogs.add(blog);
			}
		}
		return pagingBlogs;
	}
	
	//获取博客阅读总数量
	public Long getVisitSum(){
		String hql = "select sum(b.visit) from Blogs b";
		Query query = sessionUtil.getSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}
	
	//获取阅读数前10的标题
	public List<Object> getTitleByVisit(){
			int sum = 10;
			String hql = "select b.title, b.visit, b.id from Blogs b order by b.visit desc";
			Query query = sessionUtil.getSession().createQuery(hql);
			List<Object> titleByVisit = query.setFirstResult(0).setMaxResults(sum).list();
			return titleByVisit;
	}
	
	//获取点赞前10的标题
	public List<Object> getTitleBySupport(){
		int sum = 10;
		String hql = "select b.title, b.support, b.id from Blogs b order by b.support desc";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<Object> titleBySupport = query.setFirstResult(0).setMaxResults(sum).list();
		return titleBySupport;
	}
	
	//获取按id倒序前10个标题
	public List<Object> getTitleById(){
		int sum = 10;
		String hql = "select b.title,b.visit, b.id from Blogs b order by b.id desc";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<Object> titleById = query.setFirstResult(0).setMaxResults(sum).list();
		return titleById;
	}
	
	//获取博客点赞总数量
	public Long getSupportSum(){
		String hql = "select sum(b.support) from Blogs b";
		Query query = sessionUtil.getSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}
	
	//根据id获取博文数据
	public Blogs getBlogById(Integer id){
		return (Blogs) sessionUtil.getSession().get(Blogs.class, id);
	}
	
	//访问量加一
	public void addVisit(Integer id){
		Blogs blog = (Blogs) sessionUtil.getSession().get(Blogs.class, id);
		Integer visit = blog.getVisit();
		blog.setVisit(visit + 1);
	}
	
	//点赞数加一
	public void addSupport(Integer id){
		Blogs blog = (Blogs) sessionUtil.getSession().get(Blogs.class, id);
		Integer support = blog.getSupport();
		blog.setSupport(support + 1);
	}
	
	//根据关键字模糊查询博客
	public List<Blogs> getBlogsByKeyword(String keyword, Integer maxResult, Integer pageIndex){
		String hql = "from Blogs b where b.title like ?";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<Blogs> blogs = query.setString(0, "%" + keyword + "%").setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		return blogs;
	}
	
}
