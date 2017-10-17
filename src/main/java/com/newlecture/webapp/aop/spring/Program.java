package com.newlecture.webapp.aop.spring;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//aop�� �������� ���α׷����̴�. ����ڰ� �ƴ� ���α׷����� ���忡���� ������(��Ÿ����) ����ϴ� ���α׷����̴�.(����,Ʈ������,�α�)
//�����ϱ� ���ؼ��� ���Ͻø� ������ִ� ���̺귯���� ����Ͽ����Ѵ�.
//�ٵ� �츮�� ���������� ����ؼ� ������ �����ϴ�.

public class Program {

	public static void main(String argsp[]) {
		
		//1 appllicationcontext�� ���������� �о ioc �����̳ʷ� �ű��.
		ApplicationContext context= new ClassPathXmlApplicationContext("com/newlecture/webapp/aop/spring/aop-context.xml");
		Calculator cal = (Calculator) context.getBean("cal");
		
		int data = cal.add(3, 4);
		data = cal.div(3, 0);
		//int data = proxy.add(3, 4);
		
		System.out.println(data);
	}
}
