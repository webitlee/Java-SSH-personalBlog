package com.blacklee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.BlogsDao;
import com.blacklee.admin.entity.Blogs;

@Service
@Scope("prototype")
public class BlogsService {

	@Autowired
	private BlogsDao blogsDao;
	
	//为博文表添加数据
	public void saveBlogs(String title, String label, String content, String type, List<Integer> classificationIds){
		blogsDao.insert(title, label, content, type, classificationIds);
	}
	//查询记录的总条数
	public Integer getBlogsCount(){
		return blogsDao.getBlogsCount();
	}
	
	//获取指定条数的博文数据
	public List<Blogs> getBlogs(int maxResult, int pageIndex){
		Integer count = blogsDao.getBlogsCount();
		return blogsDao.getBlogs(maxResult, pageIndex);
	}
	
	//根据id获取指定记录
	public Blogs getBlogById(Integer id){
		return blogsDao.getBlogById(id);
	}
	
	//更新博文数据
	public void update(Integer id, String title, String label, String content, String type, List<Integer> classificationIds){
		Blogs blog = blogsDao.getBlogById(id);
		blogsDao.update(blog, title, label, content, type, classificationIds);
	}
	
	//根据id删除博客
	public void removeBlog(Integer id){
		blogsDao.removeBlog(id);
	}
	
	//获取博客阅读总数量、点赞总数量
		public List<Object> getVisitSupportSum(){
			return blogsDao.getVisitSupportSum();
		}
		
}
