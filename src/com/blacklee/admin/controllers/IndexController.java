package com.blacklee.admin.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blacklee.admin.service.IndexImage;

@Controller
public class IndexController {
	
	@Autowired
	IndexImage indexImage;
	
	@RequestMapping("/index")
	public String toIndex(@RequestParam("username") String username, Map<String, Object> map){
		map.put("username", username);
		String imageUrl = indexImage.getImageUrl(username);
		map.put("imageUrl", imageUrl);
		return "forward:/admin/jsp/index.jsp";
	}
}
