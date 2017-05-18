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
		Integer count = frontendBlogsDao.getBlogsCount();
		if(count < maxResult * (pageIndex + 1)){
			return frontendBlogsDao.getBlogs(maxResult * pageIndex, count - maxResult * pageIndex);
		}else{
			return frontendBlogsDao.getBlogs(maxResult * pageIndex, maxResult);
		}
	}
}
