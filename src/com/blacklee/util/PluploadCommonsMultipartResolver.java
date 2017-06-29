package com.blacklee.util;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.springframework.core.io.Resource;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

//重写原有spring MVC上传组件的方法，用于对特定请求做判断
public class PluploadCommonsMultipartResolver extends CommonsMultipartResolver {

	@Override
	public void cleanupMultipart(MultipartHttpServletRequest arg0) {
		// TODO Auto-generated method stub
		super.cleanupMultipart(arg0);
	}

	@Override
	protected String determineEncoding(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return super.determineEncoding(request);
	}

	@Override
	public boolean isMultipart(HttpServletRequest request) {
		// TODO Auto-generated method stub
		//判断上传url是否包含"/uploadImage"，如包含表示需要使用multipartResolver，否则不使用
		boolean isPluploadPlugs  =request.getRequestURI().contains("/uploadImage");
		if(isPluploadPlugs){
			return super.isMultipart(request);
		}
		return false;
	}

	@Override
	protected FileUpload newFileUpload(FileItemFactory fileItemFactory) {
		// TODO Auto-generated method stub
		return super.newFileUpload(fileItemFactory);
	}

	@Override
	protected MultipartParsingResult parseRequest(HttpServletRequest arg0) throws MultipartException {
		// TODO Auto-generated method stub
		return super.parseRequest(arg0);
	}

	@Override
	public MultipartHttpServletRequest resolveMultipart(HttpServletRequest arg0) throws MultipartException {
		// TODO Auto-generated method stub
		return super.resolveMultipart(arg0);
	}

	@Override
	public void setResolveLazily(boolean resolveLazily) {
		// TODO Auto-generated method stub
		super.setResolveLazily(resolveLazily);
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		super.setServletContext(servletContext);
	}

	@Override
	protected void cleanupFileItems(MultiValueMap<String, MultipartFile> arg0) {
		// TODO Auto-generated method stub
		super.cleanupFileItems(arg0);
	}

	@Override
	protected String getDefaultEncoding() {
		// TODO Auto-generated method stub
		return super.getDefaultEncoding();
	}

	@Override
	public DiskFileItemFactory getFileItemFactory() {
		// TODO Auto-generated method stub
		return super.getFileItemFactory();
	}

	@Override
	public FileUpload getFileUpload() {
		// TODO Auto-generated method stub
		return super.getFileUpload();
	}

	@Override
	protected boolean isUploadTempDirSpecified() {
		// TODO Auto-generated method stub
		return super.isUploadTempDirSpecified();
	}

	@Override
	protected DiskFileItemFactory newFileItemFactory() {
		// TODO Auto-generated method stub
		return super.newFileItemFactory();
	}

	@Override
	protected MultipartParsingResult parseFileItems(List<FileItem> arg0, String arg1) {
		// TODO Auto-generated method stub
		return super.parseFileItems(arg0, arg1);
	}

	@Override
	protected FileUpload prepareFileUpload(String encoding) {
		// TODO Auto-generated method stub
		return super.prepareFileUpload(encoding);
	}

	@Override
	public void setDefaultEncoding(String defaultEncoding) {
		// TODO Auto-generated method stub
		super.setDefaultEncoding(defaultEncoding);
	}

	@Override
	public void setMaxInMemorySize(int maxInMemorySize) {
		// TODO Auto-generated method stub
		super.setMaxInMemorySize(maxInMemorySize);
	}

	@Override
	public void setMaxUploadSize(long maxUploadSize) {
		// TODO Auto-generated method stub
		super.setMaxUploadSize(maxUploadSize);
	}

	@Override
	public void setUploadTempDir(Resource uploadTempDir) throws IOException {
		// TODO Auto-generated method stub
		super.setUploadTempDir(uploadTempDir);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	

}
