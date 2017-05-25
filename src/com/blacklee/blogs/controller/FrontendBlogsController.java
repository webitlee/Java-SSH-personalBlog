package com.blacklee.blogs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blacklee.admin.entity.Administrator;
import com.blacklee.admin.entity.Blogs;
import com.blacklee.blogs.service.FrontendAdministratorService;
import com.blacklee.blogs.service.FrontendBlogsService;
import com.blacklee.blogs.service.FrontendClassificationService;
import com.blacklee.blogs.service.FrontendTypeService;

@Controller
public class FrontendBlogsController {
	@Autowired
	private FrontendBlogsService frontendBlogsService;
	@Autowired
	private FrontendAdministratorService frontendAdministratorService;
	@Autowired
	private FrontendTypeService frontendTypeService;
	@Autowired
	private FrontendClassificationService frontendClassificationService;
	
	//博文列表、排名、管理员信息页面
	@RequestMapping(value="/getAll/{id}", method=RequestMethod.GET)
	public String getAllMsg(@PathVariable("id") Integer id,@RequestParam(value="classificationId", required=false) Integer classificationId, @RequestParam(value="keywork", required=false) String keyword, @RequestParam(value="pageIndex", required=false) Integer pageIndex, HttpServletRequest request){
		Integer maxResult = 20;
		List<Blogs> blogs = null;
		System.out.println(keyword);
		if((classificationId == null) && (keyword == null)){
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			request.setAttribute("pagingClassification", false);
			request.setAttribute("pagingKeyword", false);
			if(pageIndex == null){
				blogs = frontendBlogsService.getBlogs(maxResult, 0);
			}else{
				blogs = frontendBlogsService.getBlogs(maxResult, pageIndex);
			}
		}else if(keyword != null){
			System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
			request.setAttribute("pagingKeyword", true);
			request.setAttribute("pagingClassification", false);
			if(pageIndex == null){
				blogs = frontendBlogsService.getBlogsByKeyword(keyword, maxResult, 0);
			}else{
				blogs = frontendBlogsService.getBlogsByKeyword(keyword, maxResult, pageIndex);
			}
		}else{
			System.out.println("ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc");
			request.setAttribute("pagingClassification", true);
			if(pageIndex == null){
				blogs = new ArrayList<>(frontendBlogsService.getBlogsByClassificationId(classificationId, maxResult, 0));
			}else{
				blogs = new ArrayList<>(frontendBlogsService.getBlogsByClassificationId(classificationId, maxResult, pageIndex));
			}
		}
		request.setAttribute("blogs", blogs);
		Administrator admin = frontendAdministratorService.getUserInfo(id);
		request.setAttribute("admin", admin);
		Long typeOriginalSum = frontendTypeService.getOriginal();
		request.setAttribute("typeOriginalSum", typeOriginalSum);
		Long typeCopySum = frontendTypeService.getCopy();
		request.setAttribute("typeCopySum", typeCopySum);
		Long visitSum = frontendBlogsService.getVistSum();
		request.setAttribute("visitSum", visitSum);
		Long supportSum = frontendBlogsService.getSupportSum();
		request.setAttribute("supportSum", supportSum);
		Integer pagesCount = (int) Math.ceil((float)frontendBlogsService.getBlogsCount() / maxResult);
		request.setAttribute("pagesCount", pagesCount);
		List<String> classificationName = frontendClassificationService.getClassificationName();
		request.setAttribute("classificationName", classificationName);
		List<Object> titleByVisit = frontendBlogsService.getTitleByVisit();
		request.setAttribute("titleByVisit", titleByVisit);
		List<Object> titleBySupport = frontendBlogsService.getTitleBySupport();
		request.setAttribute("titleBySupport", titleBySupport);
		List<Object> titleById = frontendBlogsService.getTitleById();
		request.setAttribute("titleById", titleById);
		return "frontend.blogs.list";
	}
	
	//博客详情页
	@RequestMapping(value="/getBlog/{id}", method=RequestMethod.GET)
	public String getBlogsById(@PathVariable("id") Integer id, HttpServletRequest request){
		//访问量加一
		frontendBlogsService.addVist(id);
		
		Blogs blog = frontendBlogsService.getBlogById(id);
		request.setAttribute("blog", blog);
		Administrator admin = frontendAdministratorService.getUserInfo(id);
		request.setAttribute("admin", admin);
		Long typeOriginalSum = frontendTypeService.getOriginal();
		request.setAttribute("typeOriginalSum", typeOriginalSum);
		Long typeCopySum = frontendTypeService.getCopy();
		request.setAttribute("typeCopySum", typeCopySum);
		Long visitSum = frontendBlogsService.getVistSum();
		request.setAttribute("visitSum", visitSum);
		Long supportSum = frontendBlogsService.getSupportSum();
		request.setAttribute("supportSum", supportSum);
		List<String> classificationName = frontendClassificationService.getClassificationName();
		request.setAttribute("classificationName", classificationName);
		List<Object> titleByVisit = frontendBlogsService.getTitleByVisit();
		request.setAttribute("titleByVisit", titleByVisit);
		List<Object> titleBySupport = frontendBlogsService.getTitleBySupport();
		request.setAttribute("titleBySupport", titleBySupport);
		List<Object> titleById = frontendBlogsService.getTitleById();
		request.setAttribute("titleById", titleById);
		return "frontend.blogs.detail";
	}
	
	//点赞数加一
	@ResponseBody
	@RequestMapping("/addSupport")
	public Map<String, Object> addSupport(@RequestParam("id")Integer id){
		Map<String, Object> map = new HashMap<>();
		try{
			frontendBlogsService.addSupport(id);
			map.put("message", "点赞成功");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	
}
