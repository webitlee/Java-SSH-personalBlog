package com.blacklee.blogs.dao;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.dao.ClassificationDao;
import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsClassification;

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
		String hql="select distinct b from Blogs b order by b.id desc left join fetch b.typeId left join fetch b.classification left join fetch b.contentId";
		Query query = getSession().createQuery(hql);
		List<Blogs> list =  query.setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		return list;
	}
	
	//根据分类id获取指定条数的博文数据
	public Set<Blogs> getBlogsByClassificationId(Integer classificationId, Integer maxResult, Integer pageIndex){
		BlogsClassification classification = (BlogsClassification) getSession().get(BlogsClassification.class, classificationId); 
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
		Query query = getSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}
	
	//获取阅读数前10的标题
	public List<Object> getTitleByVisit(){
			String hql = "select b.title, b.visit, b.id from Blogs b order by b.visit desc limit 10";
			Query query = getSession().createQuery(hql);
			List<Object> titleByVisit = query.list();
			return titleByVisit;
	}
	
	//获取点赞前10的标题
	public List<Object> getTitleBySupport(){
		String hql = "select b.title, b.support, b.id from Blogs b order by b.support desc limit 10";
		Query query = getSession().createQuery(hql);
		List<Object> titleBySupport = query.list();
		return titleBySupport;
	}
	
	//获取按id倒序前10个标题
	public List<Object> getTitleById(){
		String hql = "select b.title,b.visit, b.id from Blogs b order by b.id desc limint 10";
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
	
	//根据id获取博文数据
	public Blogs getBlogById(Integer id){
		return (Blogs) getSession().get(Blogs.class, id);
	}
	
	//访问量加一
	public void addVisit(Integer id){
		Blogs blog = (Blogs) getSession().get(Blogs.class, id);
		Integer visit = blog.getVisit();
		blog.setVisit(visit + 1);
	}
	
	//点赞数加一
	public void addSupport(Integer id){
		Blogs blog = (Blogs) getSession().get(Blogs.class, id);
		Integer support = blog.getSupport();
		blog.setSupport(support + 1);
	}
	
	//根据关键字模糊查询博客
	public List<Blogs> getBlogsByKeyword(String keyword, Integer maxResult, Integer pageIndex){
		String hql = "from Blogs b where b.title like ?";
		Query query = getSession().createQuery(hql);
		List<Blogs> blogs = query.setString(0, "%" + keyword + "%").setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		return blogs;
	}
	
}
