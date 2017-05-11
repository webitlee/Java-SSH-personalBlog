package com.blacklee.admin.controllers;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.service.ClassificationService;

@Controller
public class ClassificationController {
	
	@Autowired
	private ClassificationService classificationService;
	
	@RequestMapping("/getClassification")
	public String getClassification(HttpServletRequest request){
		request.setAttribute("classification", classificationService.getClassificationName());
		return "forward:/admin/jsp/blogs.classification.edit.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/addClassification")
	public Map<String, Object> save(@RequestParam("name") String name){
		Map<String, Object> map = new HashMap<>();
		try{
			classificationService.save(name);
			map.put("message", "添加分类成功");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/uploadClassification")
	public Map<String, Object> update(@RequestParam("name") String name, @RequestParam("id") Integer id){
		Map<String, Object> map = new HashMap<>();
		try{
			classificationService.update(id, name);
			map.put("message", "修改分类成功");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
}
