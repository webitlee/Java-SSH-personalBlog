package com.blacklee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.AdministratorDao;

@Service
public class UpdatePasswordService {

	@Autowired
	private AdministratorDao administratorDao;
	
	//修改密码
	public boolean updatePassword(String name, String originPwd, String newPwd){
		Integer id = administratorDao.getIdByUsername(name);
		String origin = administratorDao.getPasswordByUsername(name);
		if(origin.equals(originPwd)){
			administratorDao.updatePassword(id, newPwd);
			return true;
		}else{
			return false;
		}
	}
}
