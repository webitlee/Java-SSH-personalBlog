package com.blacklee.blogs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Administrator;
import com.blacklee.util.SessionUtil;

@Repository
public class FrontendAdministratorDao {
	@Autowired
	private SessionUtil sessionUtil;
	//获取管理员信息
	public Administrator getUserInfo(Integer id){
		return (Administrator) sessionUtil.getSession().get(Administrator.class, id);
	}
}
