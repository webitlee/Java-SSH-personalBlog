package com.blacklee.admin.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.service.BlogsService;
import com.blacklee.admin.service.ClassificationService;

@Controller
public class BlogsController {

	@Autowired
	private BlogsService blogsService; 
	@Autowired
	private ClassificationService classificationService;
	
	@RequestMapping("/createBlogs")
	public String showClassification(HttpServletRequest request){
		request.setAttribute("classificationName", classificationService.getClassificationName());
		return "forward:/admin/jsp/blogs.create.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/saveBlogs")
	public Map<String, Object> insertBlogs(@RequestParam("title") String title,
			@RequestParam("label") String label,
			@RequestParam("content") String content, 
			@RequestParam("type") String type, 
			@RequestParam("classification") String classification,
			HttpServletRequest request){
		Map<String, Object> map = new HashedMap<>();
		try {
			blogsService.saveBlogs(title, label, content, type, classification);
			map.put("message", "添加成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("error", e.getMessage());
		}
		map.put("message", "添加成功");
		return map;
	}
}
