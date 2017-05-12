package com.blacklee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.BlogsDao;
import com.blacklee.admin.dao.ClassificationDao;
import com.blacklee.admin.entity.Blogs;

@Service
public class BlogsService {

	@Autowired
	private BlogsDao blogsDao;
	
	//为博文表添加数据
	public void saveBlogs(String title, String label, String content, String type, List<Integer> classificationIds){
		blogsDao.insert(title, label, content, type, classificationIds);
	}
	
	//获取指定条数的博文数据
	public List<Blogs> getBlogs(int firstResult, int maxResult){
		return blogsDao.getBlogs(firstResult, maxResult);
	}

}
