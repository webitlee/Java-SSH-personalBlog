package com.blacklee.blogs.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Administrator;

@Repository
public class FrontendAdministratorDao {
	@Resource
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	//获取管理员信息
	public Administrator getUserInfo(Integer id){
		return (Administrator) getSession().get(Administrator.class, id);
	}
}
