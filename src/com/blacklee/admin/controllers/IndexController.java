package com.blacklee.admin.controllers;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blacklee.admin.entity.Todo;
import com.blacklee.admin.service.BlogsService;
import com.blacklee.admin.service.BlogsTypeService;
import com.blacklee.admin.service.ClassificationService;
import com.blacklee.admin.service.IndexImage;
import com.blacklee.admin.service.TodoService;

@Controller
public class IndexController {
	
	@Autowired
	private IndexImage indexImage;
	@Autowired
	private BlogsService blogsService;
	@Autowired
	private BlogsTypeService blogsTypeService;
	@Autowired
	private TodoService todoService;
	@Autowired
	private ClassificationService classificationService;
	
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
		//获取所有未完成的任务
		Boolean state = false;
		List<Todo> unfinishedList = todoService.getTodoUnfinished(state);
		request.setAttribute("unfinishedList", unfinishedList);
		//获取所有已完成的任务
		state = true;
		List<Todo> finishedList = todoService.getTodoFinished(state);
		request.setAttribute("finishedList", finishedList);
		//获取所有分类
		List<Object> classifications = classificationService.getClassification();
		request.setAttribute("classifications", classifications);
		return "forward:/admin/jsp/index.jsp";
	}
}
