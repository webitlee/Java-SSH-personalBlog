package com.blacklee.admin.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.entity.Todo;
import com.blacklee.admin.service.TodoService;

@Controller
public class TodoController {

	@Autowired
	private TodoService todoService;
	
	//为todo表添加记录
	@ResponseBody
	@RequestMapping("/addTodo")
	public Map<String, Object> insert(@RequestParam("content") String content){
		Map<String, Object> map = new HashMap<>();
		try{
			todoService.insert(content);
			map.put("message", "添加任务成功!");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	
	//根据id设置任务状态为完成(0表示未完成,1表示完成);
	@ResponseBody
	@RequestMapping("/completeTodo")
	public Map<String, Object> setCompleteById(@RequestParam("id")Integer id){
		Map<String, Object> map = new HashMap<>();
		try{
			todoService.setCompleteById(id);
			map.put("message", "该任务已完成!");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
}
