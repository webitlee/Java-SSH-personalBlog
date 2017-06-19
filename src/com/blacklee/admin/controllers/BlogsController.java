package com.blacklee.admin.controllers;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsClassification;
import com.blacklee.admin.service.BlogsService;
import com.blacklee.admin.service.ClassificationService;

@Controller
@Scope("prototype")
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
		return map;
	}
	
	//获取blogs表中前20条数据
	@RequestMapping("/getBlogs")
	public String getBlogs(@RequestParam(value="pageIndex", required = false)Integer pageIndex, HttpServletRequest request){
		//每页20条
		Integer maxResult = 20;
		List<Blogs> list = null;
		if(pageIndex == null){
			list = blogsService.getBlogs(20, 0);
		}else{
			list = blogsService.getBlogs(maxResult, pageIndex);
		}
		request.setAttribute("blogs", list);
		request.setAttribute("maxResult", maxResult);
		Integer pages = blogsService.getBlogsCount();
		request.setAttribute("pages", (int)Math.ceil((double)pages/maxResult));
		return "blogs.list";
	}
	
	//根据id获取指定记录,并把分类信息及选中情况放入request中
	@RequestMapping("/getBlogById")
	public String getBlogById(@RequestParam("id") Integer id, HttpServletRequest request){
		Blogs blog = blogsService.getBlogById(id);
		List<Object> allClassification = classificationService.getClassification();
		request.setAttribute("blog", blog);
		Set<BlogsClassification> checkedClassification = blog.getClassification();
		List<Object> list = new ArrayList<Object>();
		for(int i = 0; i < allClassification.size(); i++){
			Iterator<BlogsClassification> it = checkedClassification.iterator();
			Map<String, Object> map = new HashedMap<>();
			map.put("classification", allClassification.get(i));
			Boolean flag = false;
			while(it.hasNext()){
				if(it.next().getName().equals(((BlogsClassification) allClassification.get(i)).getName())){
					map.put("flag", true);
					flag = true;
					break;
				}else{
					flag = false;
				}
			}
			if(!flag){
				map.put("flag", false);
			}
			list.add(map);
		}
		request.setAttribute("classification", list);
		return "blogs.edit";
	}
	
	//更新博文数据
	@ResponseBody
	@RequestMapping("/updateBlogs")
	public Map<String, Object> update(@RequestParam("id")Integer id, @RequestParam("title")String title, @RequestParam("label")String label, @RequestParam("content")String content, @RequestParam("type")String type, @RequestParam("classification")List<Integer> classificationIds){
		Map<String, Object> map = new HashedMap<>();
		try{
			blogsService.update(id, title, label, content, type, classificationIds);
			map.put("message", "修改成功");
		}catch(Exception ex){
			map.put("error", ex.getMessage());
		}
		return map;
	}
}
