package com.newlecture.web.controller.admin.notice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.service.NoticeService;

@WebServlet("/admin/board/notice/detail")
public class DetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));

		NoticeService service=new NoticeService();
		Notice notice=service.getNotice(id);
		request.setAttribute("n", notice);
		
		//서블릿에서 서블릿으로 전이 - 2가지
		//1. redirect : 다른페이지로 가는 것
		//2. forward : 페이지를 이어 받는 것 - 채택
		request.getRequestDispatcher("/WEB-INF/view/admin/board/notice/detail.jsp")
			.forward(request, response);
		/* "/" : home 디렉토리 - 여기서는 webapp를 의미 */
		
	}
}
