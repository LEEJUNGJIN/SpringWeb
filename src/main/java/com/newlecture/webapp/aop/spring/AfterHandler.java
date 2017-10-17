package com.newlecture.webapp.aop.spring;

import java.lang.reflect.Method;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;



public class AfterHandler implements AfterReturningAdvice {
	//�α׷ν� ���
	private Log log = LogFactory.getLog(this.getClass());

	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {

		/* System.out.println("after"); */
		System.out.println(method.getName() + "() ȣ�� �� ��ȯ �� �� :" + returnValue);
		
	}

}
