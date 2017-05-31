package com.blacklee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.AdministratorDao;
import com.blacklee.util.MD5Util;

@Service
public class UpdatePasswordService {

	@Autowired
	private AdministratorDao administratorDao;
	@Autowired
	private MD5Util mD5Util;
	
	//修改密码
	public boolean updatePassword(String name, String originPwd, String newPwd){
		Integer id = administratorDao.getIdByUsername(name);
		String origin = administratorDao.getPasswordByUsername(name);
		if(origin.equals(mD5Util.getMD5(originPwd))){
			administratorDao.updatePassword(id, newPwd);
			return true;
		}else{
			return false;
		}
	}
}
