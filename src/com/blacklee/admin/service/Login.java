package com.blacklee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.AdministratorDao;
import com.blacklee.util.MD5Util;

@Service
public class Login {
	@Autowired
	private AdministratorDao administratorDao;
	@Autowired
	private MD5Util md5Util;
	
	public boolean loginCheck(String username, String password){
		String passwordRepository = administratorDao.getPasswordByUsername(username);
//		System.out.println(username);
//		System.out.println(passwordRepository);
		if(md5Util.getMD5(password).equals(passwordRepository)){
			return true;
		}else{
			return false;
		} 
		
	}
	
}

