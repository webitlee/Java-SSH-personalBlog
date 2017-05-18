package com.blacklee.blogs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.blogs.dao.FrontendTypeDao;

@Service
public class FrontendTypeService {
	@Autowired
	private FrontendTypeDao frontendTypeDao;
	
	//获取原创的博客篇数
	public Long getOriginal(){
		return frontendTypeDao.getOriginal();
	}
	
	//获取转载的博客篇数
	public Long getCopy(){
		return frontendTypeDao.getCoyp();
	}
}
