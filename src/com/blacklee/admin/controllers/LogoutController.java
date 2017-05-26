package com.blacklee.admin.controllers;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LogoutController {

	@ResponseBody
	@RequestMapping(value="/logout/{id}", method=RequestMethod.GET)
	public Map<String, Object> logout(@PathVariable("id")Integer id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		try{
			HttpSession session = request.getSession();
			session.removeAttribute("administrator");
			map.put("message", "注销成功");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
}
