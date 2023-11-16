package com.newlecture.web.controller.admin.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.NoticeView;
import com.newlecture.web.service.NoticeService;

@WebServlet("/admin/notice/list")
public class ListController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String[] openIds=request.getParameterValues("open-id");
		String[] delIds=request.getParameterValues("del-id");
		
		//서버쪽 콘솔에만 출력
		for(String openId:openIds)
			System.out.printf("openId id : %s\n", openId);
		for(String delId:delIds)
			System.out.printf("delId id : %s\n", delId);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//list?f=title&q=a
				
		String field_=request.getParameter("f"); //옵션의 key값
		String query_=request.getParameter("q"); //검색어의 key값
		String page_=request.getParameter("p");	 //page값
		
		//전달이 안되었을 경우를 대비하여
		String field="title";
		if(field_ != null && !field_.equals("")) {
			field=field_;
		}
		String query="";
		if(query_ != null && !query_.equals("")) {
			query=query_;
		}
		int page=1;
		if(page_ != null && !page_.equals("")) {
			page=Integer.parseInt(page_);
		}
		
		NoticeService service=new NoticeService();
		List<NoticeView> list=service.getNoticeList(field, query, page);
		int count=service.getNoticeCount(field, query);
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		//forward방식
		request.getRequestDispatcher("/WEB-INF/admin/board/notice/list.jsp").forward(request, response);
	}
}