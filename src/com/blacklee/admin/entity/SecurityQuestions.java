package com.blacklee.admin.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

@Scope("prototype")
@Repository
public class SecurityQuestions {
	private Integer id;
	private String question;
	private String answer;
	private Administrator administrator;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Administrator getAdministrator() {
		return administrator;
	}
	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}
	@Override
	public String toString() {
		return "SecurityQuestions [id=" + id + ", question=" + question + ", answer=" + answer ;
	}
	
}
