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
			if(questions == null){
				throw new NoUserException("查无此用户");
			}
			map.put("message", "查找成功!");
			map.put("questions", questions);
			System.out.println(questions);
		}catch(NoUserException e){
			e.printStackTrace();
			map.put("error", "查无此用户");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("error", e.getMessage());
		}
		return map;
	}
}
