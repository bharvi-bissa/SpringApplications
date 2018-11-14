package com.tadigital.aspects;

import java.lang.reflect.Method;
import java.util.Arrays;

import org.apache.log4j.Logger;
import org.springframework.aop.MethodBeforeAdvice;

public class LoggingAspectBefore implements MethodBeforeAdvice {
	private final static Logger LOGGER = Logger.getLogger(LoggingAspectBefore.class);
	
	@Override
	public void before(Method method, Object[] args, Object target) throws Throwable {
		System.out.println("beforeadvice");
		
		LOGGER.info(method.getName() + " execution started with arguments " + Arrays.toString(args) + " from class " + target.getClass().getName());
	}
}