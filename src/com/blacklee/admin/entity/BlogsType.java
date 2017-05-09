package com.blacklee.admin.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class BlogsType {

	private Integer id;
	private String name;
	private Blogs blogsId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Blogs getBlogsId() {
		return blogsId;
	}
	public void setBlogsId(Blogs blogsId) {
		this.blogsId = blogsId;
	}
}
