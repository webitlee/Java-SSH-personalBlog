package com.blacklee.admin.dao;


import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Administrator;
import com.blacklee.util.MD5Util;
import com.blacklee.util.SessionUtil;


@Repository
@Scope("prototype")
public class AdministratorDao {
	@Autowired
	private MD5Util mD5Util;
	@Autowired
	private SessionUtil sessionUtil;
	
	//根据用户名获取密码
	public String getPasswordByUsername(String username){
		String hql = "select a.password from Administrator a where a.username = ?";
		Session session = sessionUtil.getSession();
		Query query = session.createQuery(hql).setString(0, username);
		String password = (String) query.uniqueResult();
		return password;
	}
	
	//根据用户名获取id
	public Integer getIdByUsername(String username){
		String hql = "select a.id from Administrator a where a.username = ?";
		Session session = sessionUtil.getSession();
		Query query = session.createQuery(hql).setString(0, username);
		Integer id = (Integer) query.uniqueResult();
		return id;
	}
	
	//根据用户名获取头像
	public String getImageByUsername(String username){
		String hql="select a.image from Administrator a where a.username = ?";
		Session session = sessionUtil.getSession();
		Query query = session.createQuery(hql).setString(0, username);
		String imageUrl = (String) query.uniqueResult();
		return imageUrl;
	}
	
	//根据用户名获取用户信息
	public Administrator getUserInfo(String username){
		String hql = "from Administrator a where a. username = ?";
		Session session = sessionUtil.getSession();
		Query query = session.createQuery(hql).setString(0, username);
		Administrator administrator = (Administrator) query.uniqueResult();
		return administrator;
	}
	
	//修改头像
	public void updateImage(Integer id, String imageUrl){
		Session session = sessionUtil.getSession();
		Administrator administrator = (Administrator) session.get(Administrator.class, id);
		administrator.setImage(imageUrl);
	}
	
	//修改密码
	public void updatePassword(Integer id, String password){
		Administrator admin = (Administrator) sessionUtil.getSession().get(Administrator.class, id);
		admin.setPassword(mD5Util.getMD5(password));
		
	}
}
