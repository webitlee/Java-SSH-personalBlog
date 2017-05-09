package com.blacklee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.ClassificationDao;

@Service
public class ClassificationService {
	
	@Autowired
	private ClassificationDao classificationDao;
	
	public List<Object> getClassificationName(){
		return classificationDao.getClassification();
	}
}
