package com.blacklee.controlleradvice;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import org.hibernate.TransactionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.portlet.ModelAndView;

import com.blacklee.util.Log;

@ControllerAdvice
public class Exceptions {
	@Autowired
	private Log log;
	
	@ExceptionHandler({FileNotFoundException.class, NullPointerException.class, ClassCastException.class,ArrayIndexOutOfBoundsException.class, NoSuchMethodError.class, ArithmeticException.class, IndexOutOfBoundsException.class})
	public ModelAndView codeException(Exception e){
		ModelAndView view = new ModelAndView("/admin/html/exceptions.html");
		view.addObject("cause", "代码书写错误");
		view.addObject("detail", e.getStackTrace());
		//错误日志
		log.getLogger(e);
		return view;
	}
	
	@ExceptionHandler({SQLException.class})
	public ModelAndView sqlsExcetion(Exception e){
		ModelAndView view = new ModelAndView("/admin/html/exceptions.html");
		view.addObject("cause", "操作数据库异常");
		view.addObject("detail", e.getStackTrace());
		//错误日志
		log.getLogger(e);
		return view;
	}
	
	@ExceptionHandler({IOException.class})
	public ModelAndView IOExceptions(Exception e){
		ModelAndView view = new ModelAndView("/admin/html/exceptions.html");
		view.addObject("cause", "输入输出异常");
		view.addObject("detail", e.getStackTrace());
		//错误日志
		log.getLogger(e);
		return view;
	}
	
	@ExceptionHandler({ThreadDeath.class, IllegalThreadStateException.class})
	public ModelAndView threadExceptions(Exception e){
		ModelAndView view = new ModelAndView("/admin/html/exceptions.html");
		view.addObject("cause", "线程异常");
		view.addObject("detail", e.getStackTrace());
		//错误日志
		log.getLogger(e);
		return view;
	}
	
	@ExceptionHandler({TransactionException.class})
	public ModelAndView transactionExceptions(Exception e){
		ModelAndView view = new ModelAndView("/admin/html/exceptions.html");
		view.addObject("cause", "事务异常");
		view.addObject("detail", e.getStackTrace());
		//错误日志
		log.getLogger(e);
		return view;
	}
}
