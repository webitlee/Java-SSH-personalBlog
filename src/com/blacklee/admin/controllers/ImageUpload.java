package com.blacklee.admin.controllers;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUpload {

	@RequestMapping("/upload")
	public void imageUpload(@RequestParam("picture") MultipartFile imageUrl, HttpServletRequest request){
		try {
			String imageName = imageUrl.getOriginalFilename();
			String newImageName = System.currentTimeMillis() + imageName.substring(imageName.indexOf("."));
			String newImageUrl = request.getServletContext().getRealPath("/image") + File.separator + newImageName;
			File newImage = new File(newImageUrl);
			imageUrl.transferTo(newImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
