package com.blacklee.admin.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.blacklee.admin.entity.Blogs;
import com.blacklee.admin.entity.BlogsClassification;
import com.blacklee.util.SessionUtil;

@Repository
@Scope("prototype")
public class ClassificationDao {
	@Resource
	private BlogsClassification blogsClassification;
	@Autowired
	private SessionUtil sessionUtil;
	//获取博文所有分类
	@SuppressWarnings("unchecked")
	public List<Object> getClassification(){
		String hql = "from BlogsClassification b order by b.id asc";
		Query query = sessionUtil.getSession().createQuery(hql);
		return query.list();
	}
	//根据分类名称获取分类id
	public Integer getIdByClassificationName(String name){
		String hql = "select b.id from BlogsClassification b where b.name = ?";
		Query query = sessionUtil.getSession().createQuery(hql).setString(0, name);
		return (Integer) query.uniqueResult();
	}
	
	//添加新分类
	public void save(String name){
		blogsClassification.setName(name);
		sessionUtil.getSession().save(blogsClassification);
	}
	
	//根据id修改分类名
	public void update(Integer id, String name){
		BlogsClassification classification = (BlogsClassification) sessionUtil.getSession().get(BlogsClassification.class, id);
		classification.setName(name);
	}
	
	//根据id删除分类
	public void delete(Integer id){
		BlogsClassification classification = (BlogsClassification) sessionUtil.getSession().get(BlogsClassification.class, id);
		sessionUtil.getSession().delete(classification);
	}
	
	//移除分类对应的某个blogs对象
	public void removeBlogs(Blogs blogs){
		String hql = "from BlogsClassification";
		Query query = sessionUtil.getSession().createQuery(hql);
		List<BlogsClassification> list = query.list();
		for(int i = 0; i < list.size(); i++){
			Set<Blogs> set = list.get(i).getBlogs();
			Iterator<Blogs> iterator = set.iterator();
			while(iterator.hasNext()){
				if(iterator.next().getId() == blogs.getId()){
					iterator.remove();
				}
			}
		}
	}
}
