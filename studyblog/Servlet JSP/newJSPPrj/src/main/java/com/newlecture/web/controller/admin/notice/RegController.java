package com.newlecture.web.controller.admin.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.service.NoticeService;

@WebServlet("/admin/board/notice/reg")
public class RegController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/view/admin/board/notice/reg.jsp")
		.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String isOpen=request.getParameter("open");
		boolean pub=false; //기본값 할당
		if(isOpen!=null) {
			pub=true;
		}
		
		Notice notice=new Notice();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setPub(pub);
		notice.setWriterId("newlec"); //임의로 사용자 아이디 등록
		
		NoticeService service=new NoticeService();
		service.insertNotice(notice);
				
		response.sendRedirect("list");
		//경로를 입력하지 않으면 현재 매핑 "/admin/board/notice/reg" 끝부분 reg를 지우고
		//list를 입력하여 서비스로 이동 
	}
}
