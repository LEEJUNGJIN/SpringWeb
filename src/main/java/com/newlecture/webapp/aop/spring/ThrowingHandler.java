package com.newlecture.webapp.aop.spring;

import org.springframework.aop.ThrowsAdvice;

public class ThrowingHandler implements ThrowsAdvice{
	public void afterThrowing(ArithmeticException e) throws Throwable{
		// �� �������� ����ó���� �Ͼ�� �ʾ��� ��쿡 ����Ѵ�.
		System.out.println("���ܰ� �߻��Ͽ����ϴ�:" +e.getMessage());
		
	}
}
