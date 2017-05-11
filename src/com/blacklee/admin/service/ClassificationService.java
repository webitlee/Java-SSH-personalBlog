package com.blacklee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.ClassificationDao;

@Service
public class ClassificationService {
	
	@Autowired
	private ClassificationDao classificationDao;
	
	//获取分类名
	public List<Object> getClassification(){
		return classificationDao.getClassification();
	}
	
	//添加分类
	public void save(String name){
		classificationDao.save(name);
	}
	
	//修改分类名称
	public void update(Integer id, String name){
		classificationDao.update(id, name);
	}
}
