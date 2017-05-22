package com.blacklee.admin.controllers;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blacklee.admin.service.BlogsService;
import com.blacklee.admin.service.BlogsTypeService;
import com.blacklee.admin.service.IndexImage;

@Controller
public class IndexController {
	
	@Autowired
	IndexImage indexImage;
	@Autowired
	BlogsService blogsService;
	@Autowired
	BlogsTypeService blogsTypeService;
	
	@RequestMapping("/index")
	public String toIndex(@RequestParam("username") String username, HttpServletRequest request){
		ServletContext servletContext = request.getServletContext();
		String imageUrl = indexImage.getImageUrl(username);
		//用户名、头像放入servlet中
		servletContext.setAttribute("username", username);
		servletContext.setAttribute("imageUrl", imageUrl);
		//阅读、点赞总数放入request中
		List<Object> visitSupportSum = blogsService.getVisitSupportSum();
		request.setAttribute("visitSupportSum", visitSupportSum);
		//原创、转载总数放入request中
		Integer originalSum = blogsTypeService.getTypeSum("原创");
		request.setAttribute("originalSum", originalSum);
		Integer copySum = blogsTypeService.getTypeSum("转载");
		request.setAttribute("copySum", copySum);
		return "forward:/admin/jsp/index.jsp";
	}
}
