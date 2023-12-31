package com.newlecture.web.controller.admin.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.NoticeView;
import com.newlecture.web.service.NoticeService;

@WebServlet("/admin/board/notice/list")
public class ListController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String[] openIds=request.getParameterValues("open-id");//3,5,8
		String[] delIds=request.getParameterValues("del-id");
		String cmd=request.getParameter("cmd");
		String ids_=request.getParameter("ids"); //현재 페이지의 모든 아이디
		String[] ids=ids_.trim().split(" "); //1,2,3,4,5,6,7,8,9,10
		
		NoticeService service=new NoticeService();
		
		switch(cmd) {
		case "일괄공개":
			for(String openId:openIds)
				System.out.printf("openId id : %s\n", openId);
			
			List<String> oids=Arrays.asList(openIds);	//asList():배열->List 변환하는 메서드
			//1,2,3,4,5,6,7,8,9,10 - //3,5,8
			//1,2,4,6,7,9,10
			
			List<String> cids=new ArrayList(Arrays.asList(ids)); //일단 새로운 객체에 담기(그냥 remove하면 에러남)
			cids.removeAll(oids);	//1,2,4,6,7,9,10
			System.out.println(cids);
			
			//Transaction 처리 : 한 번에 이루어질 수 있도록 처리
			service.pubNoticeAll(oids,cids);	//UPDATE NOTICE SET PUB=1 .. WHERE ID IN(...)
			//service.closeNoticeList(clsIds);
			
			break;
		case "일괄삭제":
			int[] ids1=new int[delIds.length];
			for(int i=0; i<delIds.length; i++) {
				ids1[i]=Integer.parseInt(delIds[i]);
			}
			int result=service.deleteNoticeAll(ids1);
			break;
		}
		response.sendRedirect("list");	//get요청
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
		request.getRequestDispatcher("/WEB-INF/view/admin/board/notice/list.jsp").forward(request, response);
	}
}
