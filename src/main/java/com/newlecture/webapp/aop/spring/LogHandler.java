package com.newlecture.webapp.aop.spring;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.util.StopWatch;

public class LogHandler implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation method) throws Throwable {

		System.out.println("������ ���� ��������");
		
		
		//���α׷� ���� �ð� �纸��
		StopWatch watch = new StopWatch();
		watch.start();
		Object result = method.proceed();	//������ �־���Ѵ�.
		watch.stop();
		
		long du = watch.getTotalTimeMillis();
		
		System.out.println("duration : "+du);
				
				
		return result;
	}

}
