package com.blacklee.admin.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Todo;
import com.blacklee.util.SessionUtil;

@Repository
public class TodoDao {
	@Autowired
	private SessionUtil sessionUtil;
	@Resource
	private Todo todo;
	
	//为todo表添加记录
	public void insert(String content){
		todo.setContent(content);
		sessionUtil.getSession().save(todo);
	}
	
	//获取所有未完成的任务
	public List<Todo> getTodoUnfinished(boolean state){
		String hql = "from Todo t where t.state = ? order by t.id desc";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<Todo> list = query.setBoolean(0, state).list();
		return list;
	}
	
	//获取后10条已完成的任务
	public List<Todo> getTodoFinished(boolean state){
		String hql = "from Todo t where t.state = ? order by t.id desc limit 10";
		Query query =sessionUtil.getSession().createQuery(hql);
		List<Todo> list = query.setBoolean(0, state).list();
		return list;
	}
	
	//根据id设置任务状态为完成(0表示未完成,1表示完成);
	public void setCompleteById(Integer id){
		Todo to = (Todo) sessionUtil.getSession().get(Todo.class, id);
		to.setState(true);
	}
}
