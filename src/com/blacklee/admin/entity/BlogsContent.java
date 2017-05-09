package com.blacklee.admin.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

@Repository
@Scope("prototype")
public class BlogsContent {
	
	private Integer id;
	private String content;
	private Blogs blogsId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Blogs getBlogsId() {
		return blogsId;
	}
	public void setBlogsId(Blogs blogsId) {
		this.blogsId = blogsId;
	}
	
}
