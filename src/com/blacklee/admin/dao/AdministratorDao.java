package com.blacklee.admin.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;


@Repository
public class AdministratorDao {

	@Resource
	private SessionFactory sessionFactory;
	
	//根据用户名获取密码
	public String getPasswordByUsername(String username){
		String hql = "select a.password from Administrator a where a.username = ?";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql).setString(0, username);
		String password = (String) query.uniqueResult();
		session.close();
		return password;
	}
	
	//根据用户名获取id
	public Integer getIdByUsername(String username){
		String hql = "select a.id from Administrator a where a.username = ?";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql).setString(0, username);
		Integer id = (Integer) query.uniqueResult();
		session.close();
		return id;
	}
	
	//根据用户名获取头像
	public String getImageByUsername(String username){
		String hql="select a.image from Administrator a where a.username = ?";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql).setString(0, username);
		String imageUrl = (String) query.uniqueResult();
		return imageUrl;
	}
}
