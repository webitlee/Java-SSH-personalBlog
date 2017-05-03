package com.blacklee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.AdministratorDao;

@Service
public class IndexImage {
	
	@Autowired
	private AdministratorDao administratorDao;
	
	public String getImageUrl(String username){
		String imageUrl = administratorDao.getImageByUsername(username);
		return imageUrl;
	}
	
}
