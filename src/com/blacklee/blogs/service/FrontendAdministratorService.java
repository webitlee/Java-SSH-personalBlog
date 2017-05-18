package com.blacklee.blogs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.entity.Administrator;
import com.blacklee.blogs.dao.FrontendAdministratorDao;

@Service
public class FrontendAdministratorService {

	@Autowired
	private FrontendAdministratorDao frontendAdministratorDao;
	
	//获取管理员信息
	public Administrator getUserInfo(Integer id){
		return frontendAdministratorDao.getUserInfo(id);
	}
}
