package com.blacklee.admin.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.AdministratorDao;
import com.blacklee.admin.dao.FindPasswordDao;
import com.blacklee.admin.entity.Administrator;
import com.blacklee.util.MD5Util;

@Service
public class FindPasswordService {
	@Autowired
	private AdministratorDao administratorDao;
	@Autowired
	private FindPasswordDao findPasswordDao;
	@Autowired
	private MD5Util md5Util;
	
	//获取密保问题列表
	public List<Object> findPassword(String username){
		Administrator admin = administratorDao.getUserInfo(username);
		List<Object> questions = findPasswordDao.getQuestionsByAdminId(admin.getId());
		return questions;
	}
}
