package com.blacklee.admin.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Administrator;
import com.blacklee.admin.entity.SecurityQuestions;

@Scope("prototype")
@Repository
public class FindPasswordDao {
	@Resource
	private SecurityQuestions securityQuestions;
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private Administrator administrator;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//根据管理员id，获取问题信息
	public List<Object> getQuestionsByAdminId(Integer adminId){
		administrator.setId(adminId);
		String hql = "from SecurityQuestions s where s.administrator = ?";
		Session session = getSession();
		Query query = session.createQuery(hql).setEntity(0, administrator);
		List<Object> questions = query.list();
		return questions;
	}
}
