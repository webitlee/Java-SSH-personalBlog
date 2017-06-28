package com.blacklee.admin.controllers;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUpload {
	
	//froala富文本编辑器用
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
	
	private Map<String, Object> getError(Map<String,Object> map, String message) {
		map.put("error", 1);
		map.put("message", message);
		return map;
	}
	
	//kindeditor富文本编辑器用
	@ResponseBody
	@RequestMapping("/uploadFile")
	public Map<String, Object> Upload(@RequestParam("dir")String dir, HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<>();
		try{
			//文件保存目录路径
			String savePath = request.getServletContext().getRealPath("/image") + File.separator;

			//文件保存目录URL
			String saveUrl  = request.getContextPath() + "/image/";

			//定义允许上传的文件扩展名
			HashMap<String, String> extMap = new HashMap<String, String>();
			extMap.put("image", "gif,jpg,jpeg,png,bmp");
			extMap.put("flash", "swf,flv");
			extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
			extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
			
			//最大文件大
			long maxSize = 1000000;

			response.setContentType("text/html; charset=UTF-8");

			if(!ServletFileUpload.isMultipartContent(request)){
				return getError(map, "请选择文件");
			}
			//检查目录
			File uploadDir = new File(savePath);
			if(!uploadDir.isDirectory()){
				return getError(map, "上传目录不存在");
			}
			//检查目录写权限
			if(!uploadDir.canWrite()){
				return getError(map, "上传目录没有写权限");
			}

			//创建文件夹
			File saveDirFile = new File(savePath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			saveUrl += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}

			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				String fileName = item.getName();
				if (!item.isFormField()) {
					//检查文件大小
					if(item.getSize() > maxSize){
						return getError(map, "上传文件大小超限制");
					}
					//检查扩展名
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					if(!Arrays.<String>asList(extMap.get("image").split(",")).contains(fileExt)){
						return getError(map, "上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get("image") + "格式。");
					}

					SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
					String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
					File uploadedFile = new File(savePath, newFileName);
					item.write(uploadedFile);

					map.put("error", 0);
					map.put("url", saveUrl + newFileName);
				}
			}
			
		}catch(Exception e){
			e.getStackTrace();
		}
		return map;
	}
}
