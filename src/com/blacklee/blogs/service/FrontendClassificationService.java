package com.blacklee.blogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.blogs.dao.FrontendClassificationDao;

@Service
public class FrontendClassificationService {

	@Autowired
	private FrontendClassificationDao frontendClassificationDao;
	
	//获取所有分类名称
	public List<String> getClassificationName(){
		return frontendClassificationDao.getClassificationName();
	}
}
