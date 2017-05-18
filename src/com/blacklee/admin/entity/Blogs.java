package com.blacklee.admin.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

@Scope("prototype")
@Repository
public class Blogs {
	private Integer id;
	private String title;
	private String label;
	private BlogsType typeId;
	private Set<BlogsClassification> classification = new HashSet<>();
	private BlogsContent contentId;
	private Integer support;
	private Integer visit;
	private Date createTime;
	private Date lastModified;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	
	public BlogsType getTypeId() {
		return typeId;
	}
	public void setTypeId(BlogsType typeId) {
		this.typeId = typeId;
	}
	public Set<BlogsClassification> getClassification() {
		return classification;
	}
	public void setClassification(Set<BlogsClassification> classification) {
		this.classification = classification;
	}
	public BlogsContent getContentId() {
		return contentId;
	}
	public void setContentId(BlogsContent contentId) {
		this.contentId = contentId;
	}
	public Integer getSupport() {
		return support;
	}
	public void setSupport(Integer support) {
		this.support = support;
	}
	public Integer getVisit() {
		return visit;
	}
	public void setVisit(Integer visit) {
		this.visit = visit;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastModified() {
		return lastModified;
	}
	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}
	@Override
	public String toString() {
		return "Blogs [id=" + id + ", title=" + title + ", label=" + label + ", typeId=" + typeId + ", classification="
				+ classification + ", contentId=" + contentId + ", support=" + support + ", visit=" + visit
				+ ", createTime=" + createTime + ", lastModified=" + lastModified + "]";
	}
	
}
