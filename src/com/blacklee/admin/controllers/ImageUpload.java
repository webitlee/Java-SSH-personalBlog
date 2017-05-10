package com.blacklee.admin.controllers;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUpload {

	@ResponseBody
	@RequestMapping("/upload")
	public Map<String, String> imageUpload(@RequestParam("file") MultipartFile imageUrl, HttpServletRequest request){
		Map<String, String> map = new HashedMap<>();
		try {
			String imageName = imageUrl.getOriginalFilename();
			String newImageName = System.currentTimeMillis() + imageName.substring(imageName.indexOf("."));
			String newImageUrl = request.getServletContext().getRealPath("/image") + File.separator + newImageName;
			File newImage = new File(newImageUrl);
			imageUrl.transferTo(newImage);
			String contextUrl = request.getContextPath() + "/image/" + newImageName;
			map.put("link", contextUrl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
