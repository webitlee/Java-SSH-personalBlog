package com.blacklee.admin.entity;

import java.util.HashSet;
import java.util.Set;

public class BlogsClassification {

	private Integer id;
	private String name;
	private Set<Blogs> blogs = new HashSet<>();
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
	public Set<Blogs> getBlogs() {
		return blogs;
	}
	public void setBlogs(Set<Blogs> blogs) {
		this.blogs = blogs;
	}
	
}
