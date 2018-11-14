package com.tadigital.aspects;



import java.lang.reflect.Method;
import java.util.Arrays;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;

public class LoggingAspectAfter implements AfterReturningAdvice {
	private final static Logger LOGGER = Logger.getLogger(LoggingAspectAfter.class);
	
	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		System.out.println("afterreturningadvice");
		
		LOGGER.info(method.getName() + " execution ended with arguments " + Arrays.toString(args) + " with return value " + returnValue + " from class " + target.getClass().getName());
	}	
}