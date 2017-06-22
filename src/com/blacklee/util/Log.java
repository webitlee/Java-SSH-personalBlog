package com.blacklee.util;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class Log {
	public Logger getLogger(Exception e){
		Logger logger = Logger.getLogger(e.getClass());  
		for(int i = 0; i < e.getStackTrace().length; i++){
			logger.error("");
			logger.error(e.getStackTrace()[i]);
		}
		return logger;
	}
}
