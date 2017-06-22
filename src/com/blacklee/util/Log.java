package com.blacklee.util;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class Log {
	public Logger getLogger(Class<?> className){
		Logger logger = Logger.getLogger(className);  
		return logger;
	}
}
