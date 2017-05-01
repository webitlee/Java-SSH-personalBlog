package com.blacklee.admin.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.entity.Administrator;
import com.blacklee.admin.service.Login;

@Controller
public class LoginController {
	@Autowired
	private Login login;
	
	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> loginController(Administrator administrator, HttpServletRequest request){
		Map<String, Object> map = new HashedMap<>();
		if(login.loginCheck(administrator.getUsername(), administrator.getPassword())){
			map.put("success", true);
			map.put("username", administrator.getUsername());
			HttpSession session = request.getSession();
			session.setAttribute("administrator", administrator);
		}else{
			map.put("success", false);
		}
		return map;
	}
}
