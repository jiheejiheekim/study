package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hi")
public class Nana extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		String cnt_=request.getParameter("cnt");

		int cnt=100;	//일단 기본값을 가짐
		
		if(cnt_ != null && !cnt_.equals("")) {
			cnt=Integer.parseInt(cnt_);
		}//cnt_의 값이 null이 아니고 빈문자열이 아니라면 cnt에 cnt_ 값을 대입
		
		for(int i=0; i<cnt; i++) {
			out.println((i+1)+":안녕 Servlet!!<br>");
		}
	}

}
