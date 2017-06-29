package com.blacklee.admin.dao;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsClassification;
import com.blacklee.admin.entity.BlogsContent;
import com.blacklee.admin.entity.BlogsType;
import com.blacklee.util.SessionUtil;

@Repository
@Scope("prototype")
public class BlogsDao {
	@Autowired
	private SessionUtil sessionUtil;
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
			BlogsClassification classification= (BlogsClassification) sessionUtil.getSession().get(BlogsClassification.class, classificationIds.get(i));
			classification.getBlogs().add(blogs);
			blogs.getClassification().add(classification);
		}
		blogs.setSupport(0);
		blogs.setVisit(0);
		blogs.setCreateTime(new Date());
		blogs.setLastModified(new Date());
		sessionUtil.getSession().save(blogs);
		sessionUtil.getSession().save(blogsContent);
		sessionUtil.getSession().save(blogsType);
	}
	//查询记录的总条数
	public Integer getBlogsCount(){
		String hql = "select count(*) from Blogs";
		Query query = sessionUtil.getSession().createQuery(hql);
		Integer count = query.list().size();
		return count;
	}
	//获取前20条博文数据
	public List<Blogs> getBlogs(int maxResult, int pageIndex){
		String hql="select distinct b from Blogs b order by b.id desc left join fetch b.typeId left join fetch b.classification left join fetch b.contentId";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<Blogs> list =  query.setFirstResult(maxResult * pageIndex).setMaxResults(maxResult).list();
		System.out.println(list);
		return list;
	}
	
	//根据id获取指定记录
	public Blogs getBlogById(Integer id){
		Blogs blog = (Blogs) sessionUtil.getSession().get(Blogs.class, id);
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
			BlogsClassification classification= (BlogsClassification) sessionUtil.getSession().get(BlogsClassification.class, classificationIds.get(i));
			classification.getBlogs().add(blog);
			blog.getClassification().add(classification);
		}
		blog.setLastModified(new Date());
	}
	
	//根据id删除博客
	public void removeBlog(Integer id){
		Blogs blog = (Blogs) sessionUtil.getSession().get(Blogs.class, id);
		BlogsContent blogContent = blog.getContentId();
		BlogsType blogType = blog.getTypeId();
		
		sessionUtil.getSession().delete(blogType);
		sessionUtil.getSession().delete(blogContent);
		sessionUtil.getSession().delete(blog);
	}
	
	//获取博客阅读总数量、点赞总数量
	public List<Object> getVisitSupportSum(){
		String hql = "select sum(b.visit), sum(b.support) from Blogs b";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<Object> sum = query.list();
		return sum;
	}

}
