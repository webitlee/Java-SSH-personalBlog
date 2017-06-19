package com.blacklee.admin.entity;

import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

@Scope("prototype")
@Repository
public class Administrator {
	private Integer id;
	private String username;
	private String password;
	private String image;
	private Set<SecurityQuestions> securityQuestions;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Set<SecurityQuestions> getSecurityQuestions() {
		return securityQuestions;
	}
	public void setSecurityQuestions(Set<SecurityQuestions> securityQuestions) {
		this.securityQuestions = securityQuestions;
	}
	@Override
	public String toString() {
		return "Administrator [id=" + id + ", username=" + username + ", password=" + password + ", image=" + image
				+ "]";
	}
	
}
