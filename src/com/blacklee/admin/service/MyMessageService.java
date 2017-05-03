package com.blacklee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.AdministratorDao;
import com.blacklee.admin.entity.Administrator;

@Service
public class MyMessageService { 

	@Autowired
	private AdministratorDao administratorDao;

	public Administrator getUserInfo(String username){
		Administrator administrator = administratorDao.getUserInfo(username);
		return administrator;
	}
	
	public void updateImage(String username, String imageUrl){
		Integer id = administratorDao.getIdByUsername(username);
		administratorDao.updateImage(id, imageUrl);
	}
	
	
}
