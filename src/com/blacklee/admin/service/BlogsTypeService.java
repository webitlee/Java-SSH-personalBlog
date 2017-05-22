package com.blacklee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.BlogsTypeDao;

@Service
public class BlogsTypeService {
	@Autowired
	BlogsTypeDao blogsTypeDao;
	
	//按类型名称获取博客总数
	public Integer getTypeSum(String typeName){
		return blogsTypeDao.getTypeSum(typeName);
	}
}
