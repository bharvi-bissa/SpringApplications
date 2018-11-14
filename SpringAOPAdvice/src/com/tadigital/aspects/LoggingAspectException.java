package com.tadigital.aspects;



import java.lang.reflect.Method;
import java.util.Arrays;

import org.apache.log4j.Logger;
import org.springframework.aop.ThrowsAdvice;

public class LoggingAspectException implements ThrowsAdvice {
	private final static Logger LOGGER = Logger.getLogger(LoggingAspectException.class);
	
	public void afterThrowing(Method method, Object[] args, Object target, NumberFormatException nfex) {
		System.out.println("throwsadvice");
		
		LOGGER.info(method.getName() + " with arguments " + Arrays.toString(args) + " from class " + target.getClass().getName() + " has thrown " + nfex);
	}
}