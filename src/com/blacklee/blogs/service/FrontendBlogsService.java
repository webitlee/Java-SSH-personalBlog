package com.blacklee.blogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.blogs.dao.FrontendBlogsDao;

@Service
public class FrontendBlogsService {
	@Autowired
	private FrontendBlogsDao frontendBlogsDao;
	
	//获取指定条数的博文数据
	public List<Blogs> getBlogs(int maxResult, int pageIndex){
		Integer count = frontendBlogsDao.getBlogsCount().intValue();
		if(count < maxResult * (pageIndex + 1)){
			return frontendBlogsDao.getBlogs(maxResult * pageIndex, count - maxResult * pageIndex);
		}else{
			return frontendBlogsDao.getBlogs(maxResult * pageIndex, maxResult);
		}
	}
	
	//查询记录的总条数
	public Integer getBlogsCount(){
		return frontendBlogsDao.getBlogsCount();
	}
	
	
	//获取博客阅读总数量
	public Long getVistSum(){
		return frontendBlogsDao.getVisitSum();
	}
	
	//获取阅读数前10的标题
	public List<Object> getTitleByVisit(){
		return frontendBlogsDao.getTitleByVisit();
	}
	
	//获取博客点在总数量
	public Long getSupportSum(){
		return frontendBlogsDao.getSupportSum();
	}
	
	//获取点在前10的标题
	public List<Object> getTitleBySupport(){
		return frontendBlogsDao.getTitleBySupport();
	}
	
	//获取按id倒序前10个标题
	public List<Object> getTitleById(){
		return frontendBlogsDao.getTitleById();
	}
	
	//根据id获取博文数据
	public Blogs getBlogById(Integer id){
		return frontendBlogsDao.getBlogById(id);
	}
	
	//点赞数加一
	public void addVist(Integer id){
		frontendBlogsDao.addVisit(id);
	}
	
	//点赞数加一
	public void addSupport(Integer id){
		frontendBlogsDao.addSupport(id);
	}
}
