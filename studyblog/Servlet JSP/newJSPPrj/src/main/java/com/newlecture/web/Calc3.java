package com.newlecture.web;

import java.io.IOException;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/calc3")
public class Calc3 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//쿠키객체
		Cookie[] cookies=request.getCookies();
		
		String value=request.getParameter("value");
		String operator =request.getParameter("operator");	//+버튼 누를 시 덧셈버튼이 op에 저장됨
		String dot =request.getParameter("dot");
		
		String exp="";
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("exp")) {
					exp=c.getValue();
					break;
				}
			}
		}
		
		if(operator != null && operator.equals("=")) {
			ScriptEngine engine=new ScriptEngineManager().getEngineByName("nashorn");
			try {
				exp = String.valueOf(engine.eval(exp));
			} catch (ScriptException e) {
				
				e.printStackTrace();
			}
		}else if(operator != null && operator.equals("C")) {
			//쿠키 지우기 : 1. 값을 비움
			exp= "";
		}else {
			exp+=(value==null)? "":value;	//null이라면 빈문자열 붙이고 아니라면 value 누적
			exp+=(operator==null)? "":operator;	
			exp+=(dot==null)? "":dot;
		}
		
		
		Cookie expCookie=new Cookie("exp", exp);
		
		//쿠키 지우기 : 2. 조건에 따라 기간을 없앰
		if(operator != null && operator.equals("C")) {
			expCookie.setMaxAge(0);	//쿠키가 남지 않고 없어짐
		}
		expCookie.setPath("/");
		response.addCookie(expCookie);
		response.sendRedirect("calcpage");
		
		
	}
}
