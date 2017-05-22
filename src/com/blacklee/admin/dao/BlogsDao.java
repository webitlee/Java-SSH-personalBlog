package com.blacklee.admin.dao;

import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsClassification;
import com.blacklee.admin.entity.BlogsContent;
import com.blacklee.admin.entity.BlogsType;

@Repository
@Scope("prototype")
public class BlogsDao {

	@Resource
	private SessionFactory sessionFactory;
	@Autowired
	private Blogs blogs;
	@Autowired
	private BlogsContent blogsContent;
	@Autowired
	private BlogsType blogsType;
	@Autowired
	private BlogsClassification blogsClassification;
	@Autowired
	private BlogsContentDao blogsContentDao;
	@Autowired
	private BlogsTypeDao blogsTypeDao;
	@Autowired
	private ClassificationDao classificationDao;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//为博文表添加数据
	public void insert(String title, String label, String content, String type, List<Integer> classificationIds){
		blogs.setTitle(title);
		blogs.setLabel(label);
		blogsContent.setContent(content);
		blogs.setContentId(blogsContent);
		blogsContent.setBlogsId(blogs);
		blogsType.setName(type);
		blogs.setTypeId(blogsType);
		blogsType.setBlogsId(blogs);
		for(int i = 0; i < classificationIds.size(); i++){
			BlogsClassification classification= (BlogsClassification) getSession().get(BlogsClassification.class, classificationIds.get(i));
			classification.getBlogs().add(blogs);
			blogs.getClassification().add(classification);
		}
		blogs.setSupport(0);
		blogs.setVisit(0);
		blogs.setCreateTime(new Date());
		blogs.setLastModified(new Date());
		getSession().save(blogs);
		getSession().save(blogsContent);
		getSession().save(blogsType);
	}
	//查询记录的总条数
	public Integer getBlogsCount(){
		String hql = "select count(*) from Blogs";
		Query query = getSession().createQuery(hql);
		Integer count = query.list().size();
		return count;
	}
	//获取前20条博文数据
	public List<Blogs> getBlogs(int maxResult, int pageIndex){
		String hql="from Blogs b order by b.id desc";
		Query query = getSession().createQuery(hql);
		List<Blogs> list =  query.setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		System.out.println(list);
		return list;
	}
	
	//根据id获取指定记录
	public Blogs getBlogById(Integer id){
		Blogs blog = (Blogs) getSession().get(Blogs.class, id);
		return blog;
	}
	
	//更新博文信息
	public void update(Blogs blog, String title, String label, String content, String type, List<Integer> classificationIds){
		blog.setTitle(title);
		blog.setLabel(label);
		BlogsContent blogContent = blogsContentDao.getContentByBlog(blog);
		blogContent.setContent(content);
		blog.setContentId(blogContent);
		blogContent.setBlogsId(blog);
		BlogsType blogType = blogsTypeDao.getTypeByBlog(blog);
		blogType.setName(type);
		blog.setTypeId(blogType);
		blogType.setBlogsId(blog);
		blog.setClassification(new HashSet<>());
		classificationDao.removeBlogs(blog);
		for(int i = 0; i < classificationIds.size(); i++){
			BlogsClassification classification= (BlogsClassification) getSession().get(BlogsClassification.class, classificationIds.get(i));
			classification.getBlogs().add(blog);
			blog.getClassification().add(classification);
		}
		blog.setLastModified(new Date());
	}
	
	//获取博客阅读总数量、点赞总数量
	public List<Object> getVisitSupportSum(){
		String hql = "select sum(b.visit), sum(b.support) from Blogs b";
		Query query = getSession().createQuery(hql);
		List<Object> sum = query.list();
		return sum;
	}

}
