package com.newlecture.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/spag")
public class Spag extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num=0;	//사용자가 숫자를 전달하지 않았을 때를 대비하여 초기값 부여
		String num_=request.getParameter("n");	 //n이라는 쿼리값으로 숫자를 받음
		if(num_ != null && !num_.equals(""))	//num_을 int로 형변환
		num=Integer.parseInt(num_);
		
		String result;
		if(num%2!=0)  
			result="홀수";
		else
			result="짝수";
		
		//pageContext : 페이지 내의 저장소 
		request.setAttribute("result", result);	//""안 내용이 꺼낼 때 쓰는 이름
		
		//배열
		String[] names= {"newlec", "dragon"};
		request.setAttribute("names", names);
		
		//Map
		Map<String, Object> notice=new HashMap<String, Object>();
		notice.put("id", 1);
		notice.put("title", "EL은 좋아요");
		request.setAttribute("notice", notice);
		
		//redirect : 현재 작업과 상관없이 새로운 요청
		//forward : 현재 작업한 내용을 이어감
		RequestDispatcher dispatcher=request.getRequestDispatcher("spag.jsp");
		dispatcher.forward(request, response);
	}
}
