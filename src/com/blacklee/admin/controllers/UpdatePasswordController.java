package com.blacklee.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.service.UpdatePasswordService;

@Controller
public class UpdatePasswordController {

	@Autowired
	private UpdatePasswordService updatePasswordService;
	
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public Map<String, Object> updatePassword(@RequestParam("username")String username, @RequestParam("originPwd")String originPwd, @RequestParam("newPwd")String newPwd){
		Map<String, Object> map = new HashMap<>();
		try{
			boolean result = updatePasswordService.updatePassword(username, originPwd, newPwd);
			if(result){
				map.put("flag", true);
				map.put("message", "修改密码成功!");
			}else{
				map.put("flag", false);
				map.put("message", "原密码不正确!");
			}
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
}
