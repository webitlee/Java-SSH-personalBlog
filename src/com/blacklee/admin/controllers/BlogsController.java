package com.blacklee.admin.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.entity.Blogs;
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
		request.setAttribute("classification", classificationService.getClassification());
		return "forward:/admin/jsp/blogs.create.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/saveBlogs")
	public Map<String, Object> insertBlogs(@RequestParam("title") String title,
			@RequestParam("label") String label,
			@RequestParam("content") String content, 
			@RequestParam("type") String type, 
			@RequestParam("classification") List<Integer> classificationIds,
			HttpServletRequest request){
		Map<String, Object> map = new HashedMap<>();
		try {
			blogsService.saveBlogs(title, label, content, type, classificationIds);
			map.put("message", "添加成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("error", e.getMessage());
		}
		map.put("message", "添加成功");
		return map;
	}
	
	@RequestMapping("/getBlogs")
	public String getBlogs(HttpServletRequest request){
		String firstResult = request.getParameter("firstResult");
		String maxResult = request.getParameter("maxResult");
		List<Blogs> list = null;
		if(firstResult == null || maxResult == null){
			list = blogsService.getBlogs(20, 0);
		}else{
			list = blogsService.getBlogs(Integer.parseInt(firstResult), Integer.parseInt(maxResult));
		}
		request.setAttribute("blogs", list);
		return "blogs.list";
	}
}
