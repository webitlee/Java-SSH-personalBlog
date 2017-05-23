package com.blacklee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.TodoDao;
import com.blacklee.admin.entity.Todo;

@Service
public class TodoService {

	@Autowired
	private TodoDao todoDao;
	
	//为todo表添加记录
	public void insert(String content){
		todoDao.insert(content);
	}
	
	//获取所有未完成的任务
	public List<Todo> getTodoUnfinished(boolean state){
		return todoDao.getTodoUnfinished(state);
	}
	
	//获取所有已完成的任务
	public List<Todo> getTodoFinished(boolean state){
		return todoDao.getTodoFinished(state);
	}
	
	//根据id设置任务状态为完成(0表示未完成,1表示完成);
	public void setCompleteById(Integer id){
		todoDao.setCompleteById(id);
	}
}
