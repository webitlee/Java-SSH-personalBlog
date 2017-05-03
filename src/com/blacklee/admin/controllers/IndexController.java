package com.blacklee.admin.controllers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
	public String toIndex(@RequestParam("username") String username, HttpServletRequest request){
		ServletContext servletContext = request.getServletContext();
		String imageUrl = indexImage.getImageUrl(username);
		servletContext.setAttribute("username", username);
		servletContext.setAttribute("imageUrl", imageUrl);
		return "forward:/admin/jsp/index.jsp";
	}
}
