package com.blacklee.admin.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blacklee.admin.dao.AdministratorDao;
import com.blacklee.admin.dao.FindPasswordDao;
import com.blacklee.admin.entity.Administrator;
import com.blacklee.util.MD5Util;

@Service
public class FindPasswordService {
	@Autowired
	private AdministratorDao administratorDao;
	@Autowired
	private FindPasswordDao findPasswordDao;
	@Autowired
	private MD5Util md5Util;
	
	//获取密保问题列表
	public List<Object> getQuestionsByAdminId(String username){
		Administrator admin = administratorDao.getUserInfo(username);
		List<Object> questions = findPasswordDao.getQuestionsByAdminId(admin.getId());
		return questions;
	}
	
	//对比用户填写的答案与密保问题答案是否一致，2/3正确即视为答对
	public boolean findPasswordOrNot(Integer id1, String answer1, Integer id2, String answer2, Integer id3, String answer3){
		Integer[] ids = {id1, id2, id3};
		String[] answers = {answer1, answer2, answer3};
		int num = 0;
		for(int i = 0; i < 3; i++){
			String answer = findPasswordDao.getAnswerById(ids[i]);
			if(answer.equals(md5Util.getMD5(answers[i]))){
				num++;
			}
		}
		if(num >= 2){
			return true;
		}
		return false;
	}
	
	//重置密码
	public void resetPassword(String username, String password){
		int adminId = administratorDao.getIdByUsername(username);
		administratorDao.updatePassword(adminId, password);
	}
}
