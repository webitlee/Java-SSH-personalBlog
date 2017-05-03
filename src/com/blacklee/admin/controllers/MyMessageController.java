package com.blacklee.admin.controllers;



import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blacklee.admin.entity.Administrator;
import com.blacklee.admin.service.MyMessageService;

@Controller
public class MyMessageController {
	
	@Autowired
	private MyMessageService myMessageService;
	
	@RequestMapping("/myMessage")
	public String myMessage(HttpServletRequest request, Map<String, Object> map){
		ServletContext context = request.getServletContext();
		String username = (String) context.getAttribute("username");
		Administrator administrator = myMessageService.getUserInfo(username);
		map.put("information", administrator);
		return "forward:/admin/jsp/administrator.info.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/uploadImage")
	public Map<String, Object> updateImageUrl(@RequestParam("image") MultipartFile imageUrl, HttpServletRequest request){
		ServletContext context = request.getServletContext();
		String username = (String) context.getAttribute("username");
		String imageName = imageUrl.getOriginalFilename();
		Map<String, Object> map = new HashedMap<>();
		try{
			String newImageName = System.currentTimeMillis() + imageName.substring(imageName.indexOf("."));
			String newImageUrl = request.getServletContext().getRealPath("/image") + File.separator + newImageName;
			File newImage = new File(newImageUrl);
			imageUrl.transferTo(newImage);
			String contextUrl = request.getContextPath() + "/image/" + newImageName;
			myMessageService.updateImage(username, contextUrl);
			map.put("message", "文件上传成功");
		}catch(Exception ex){
			map.put("error", ex.getMessage());
		}
		return map;
	}
}
