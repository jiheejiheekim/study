package com.newlecture.web.controller;

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

@WebServlet("/notice/detail")
public class NoticeDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));

		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String sql = "SELECT * FROM NOTICE WHERE ID=?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "newlec", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();

			rs.next();
			   
			String title=rs.getString("TITLE");
			String writerId=rs.getString("WRITER_ID");
			Date regdate=rs.getTimestamp("REGDATE");
			String hit=rs.getString("HIT");
			String files=rs.getString("FILES");
			String content=rs.getString("CONTENT");
			
			Notice notice= new Notice(
					id,
					title,
					writerId,
					regdate,
					hit,
					files,
					content
					);
			
			request.setAttribute("n", notice);

			/*
			//아래에서 forward로 전달할 request에 위에서 만든 모델들을 담기
			request.setAttribute("title", title);
			request.setAttribute("writerId", writerId);
			request.setAttribute("regdate", regdate);
			request.setAttribute("hit", hit);
			request.setAttribute("files", files);
			request.setAttribute("content", content);
			*/
			
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		//서블릿에서 서블릿으로 전이 - 2가지
		//1. redirect : 다른페이지로 가는 것
		//2. forward : 페이지를 이어 받는 것 - 채택
		request.getRequestDispatcher("/WEB-INF/notice/detail.jsp").forward(request, response);
		/* "/" : home 디렉토리 - 여기서는 webapp를 의미 */
		
	}
}
