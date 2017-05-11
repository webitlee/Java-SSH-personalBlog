package com.blacklee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.BlogsDao;
import com.blacklee.admin.dao.ClassificationDao;

@Service
public class BlogsService {

	@Autowired
	private BlogsDao blogsDao;
	
	public void saveBlogs(String title, String label, String content, String type, Integer classificationId){
		blogsDao.insert(title, label, content, type, classificationId);
	}

}
