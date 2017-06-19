package com.blacklee.exceptions;

import org.springframework.stereotype.Component;

@Component
public class NoUserException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public NoUserException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoUserException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public NoUserException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public NoUserException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public NoUserException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

}
