package com.blacklee.admin.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blacklee.admin.service.ClassificationService;

@Controller
public class ClassificationController {
	
	@Autowired
	private ClassificationService classificationService;
	
	@RequestMapping("/getClassification")
	public String getClassification(HttpServletRequest request){
		request.setAttribute("classificationName", classificationService.getClassificationName());
		return "forward:/admin/jsp/blogs.classification.edit.jsp";
	}
}
