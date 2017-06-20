package com.blacklee.admin.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.service.FindPasswordService;
import com.blacklee.exceptions.NoUserException;

@Controller
public class FindPasswordController {
	@Autowired
	private FindPasswordService findPasswordService;
	
	@ResponseBody
	@RequestMapping("/getSecurityQuestions")
	public Map<String, Object> getSecurityQuestion(@RequestParam("username") String username){
		Map<String, Object> map = new HashMap<>();
		try{
			List<Object> questions = findPasswordService.getQuestionsByAdminId(username);
			map.put("message", "查找成功!");
			map.put("questions", questions);
			System.out.println(questions);
		}catch(NullPointerException e){
			e.printStackTrace();
			map.put("error", "查无此用户");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("error", e.getMessage());
		}
		return map;
	}
	
	//对比用户填写的答案与密保问题答案是否一致，2/3正确即视为答对
	@ResponseBody
	@RequestMapping("/findPasswordOrNot")
	public Map<String, Object> findPasswordOrNot(@RequestParam("argument1")String argument1, @RequestParam("argument2")String argument2, @RequestParam("argument3")String argument3){
		Map<String, Object> map = new HashMap<>();
		String[][] arguments = {argument1.split(","), argument2.split(","), argument3.split(",")};
		Integer[] ids = new Integer[3];  
		String[] answers = new String[3];
		for(int i = 0; i < arguments.length; i++){
			ids[i] = Integer.parseInt(arguments[i][0]);
			answers[i] = arguments[i][1];
		}
		try{
			
			Boolean flag = findPasswordService.findPasswordOrNot(ids[0], answers[0], ids[1], answers[1], ids[2], answers[2]);
			map.put("message", flag);
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	
	//重置密码
	@ResponseBody
	@RequestMapping("/resetPassword")
	public Map<String, Object> resetPassword(@RequestParam("username")String username, @RequestParam("password")String password){
		Map<String, Object> map = new HashMap<>();
		try{
			findPasswordService.resetPassword(username, password);
			map.put("message", "重置密码成功");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
}
