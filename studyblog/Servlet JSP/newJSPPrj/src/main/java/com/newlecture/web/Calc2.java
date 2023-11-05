package com.newlecture.web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/calc2")
public class Calc2 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getServletContext : 받은 값을 저장하는 메서드
		ServletContext application=request.getServletContext();

		//세션객체
		HttpSession session=request.getSession();
		
		//쿠키객체
		Cookie[] cookies=request.getCookies();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String v_=request.getParameter("v");
		String op =request.getParameter("operator");	//+버튼 누를 시 덧셈버튼이 op에 저장됨
		
		int v=0;	//값을 입력하지 않은 경우
		if(!v_.equals("")) v=Integer.parseInt(v_);
		
		if(op.equals("=")) {
			//int x=(Integer)application.getAttribute("value"); //앞에 else에서 저장한 application값을 꺼내 x에 저장
			//int x=(Integer)session.getAttribute("value");
			
			int x=0;
			
			for(Cookie c : cookies) {
				if(c.getName().equals("value")) {
					x=Integer.parseInt(c.getValue());
					break;
				}
			}
			
			int y=v;
			
			//String operator=(String)application.getAttribute("op");
			//String operator=(String)session.getAttribute("op");
			
			String operator="";
			for(Cookie c : cookies) {
				if(c.getName().equals("op")) {
					operator=c.getValue();
					break;
				}
			}
			
			int result=0;	//기본값
			
			//계산
			if (operator.equals("+")) {	//input의 value +
				result = x+y;
			} else {	//-
				result = x-y;
			}
			response.getWriter().printf("result is %d\n", result);
			
		} else {	//=버튼이아닌 + or = 버튼을 누른경우 : 값을 저장
			//application.setAttribute("value", v);	//value(key)에 v(value)값을 저장 : map
			//application.setAttribute("op", op);
			
			//session.setAttribute("value", v);	//value(key)에 v(value)값을 저장 : map
			//session.setAttribute("op", op);
			
			Cookie valueCookie=new Cookie("value", String.valueOf(v));
			Cookie opCookie=new Cookie("op", op);
			
			valueCookie.setPath("/Calc2");	//Calc2에서만 사용하도록 함
			opCookie.setPath("/");			//전체에서 가질 수 있도록 함
			
			response.addCookie(valueCookie);	//클라이언트에게 보내기
			response.addCookie(opCookie);
		}
	}
}
