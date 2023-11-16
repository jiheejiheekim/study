package com.newlecture.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;

public class NoticeService {
	
	public int removeNoticeAll(int[] ids){
		
		return 0;
	}
	
	public int pubNoticeAll(int[] ids){
		
		return 0;
	}
	
	public int insertNotice(Notice notice){
		
		return 0;
	}
		
	public int deleteNotice(int id){
		
		return 0;
	}
	
	public int updateNotice(Notice notice){
		
		return 0;
	}
	
	List<Notice> getNoticeNewestList(){
		
		return null;
	}
	
	
	public List<NoticeView> getNoticeViewList() {
	
		return getNoticeList("title", "", 1);
	}//--------------------------------
	
	public List<NoticeView> getNoticeList(int page) {
		
		return getNoticeList("title", "", page);
	}//--------------------------------
	
	public List<NoticeView> getNoticeList(String field, String query, int page) {
		List<NoticeView> list=new ArrayList<>();
		
		String sql="SELECT * FROM ("
				+ "    SELECT ROWNUM NUM, N.* "
				+ "    FROM (SELECT * FROM NOTICE_VIEW WHERE "+field+" LIKE ? ORDER BY ID DESC) N"
				+ " )"
				+ " WHERE NUM BETWEEN ? AND ?";
		
		// 1, 11, 21, 31 -> start=1+(page-1)*10
		// 10, 20, 30, 40 -> page*10
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "newlec", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, "%"+query+"%");
			st.setInt(2, 1+(page-1)*10);
			st.setInt(3, page*10);
			
			ResultSet rs = st.executeQuery();

			while(rs.next()) { 
				int id=rs.getInt("id");
				String title=rs.getString("TITLE");
				String writerId=rs.getString("WRITER_ID");
				Date regdate=rs.getDate("REGDATE");
				String hit=rs.getString("HIT");
				String files=rs.getString("FILES");
				//String content=rs.getString("CONTENT");
				int cmtCount=rs.getInt("CMT_COUNT");
				
				NoticeView notice= new NoticeView(
						id,
						title,
						writerId,
						regdate,
						hit,
						files,
						//content
						cmtCount
					);
				list.add(notice);	//객체 생성 시 마다 목록 생성
			 }
			 
			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return list;
	}//--------------------------------
	
	public int getNoticeCount() {
		
		
		return getNoticeCount("title", "");
	}//--------------------------------
	
	public int getNoticeCount(String field, String query) {
		int count=0;
		
		String sql="SELECT COUNT(ID) COUNT FROM ("
				+ "    SELECT ROWNUM NUM, N.* "
				+ "    FROM (SELECT * FROM NOTICE WHERE "+field+" LIKE ? ORDER BY REGDATE DESC) N"
				+ ")";
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "newlec", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, "%"+query+"%");
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count");
			}
			 
			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}//--------------------------------
	
	public Notice getNotice(int id) {
		Notice notice=null;
		
		String sql="SELECT * FROM NOTICE WHERE ID=?";
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "newlec", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1, id);
			
			ResultSet rs = st.executeQuery();
	
			if(rs.next()) {		//가져올 게 있다면 
				int nid=rs.getInt("id");
				String title=rs.getString("TITLE");
				String writerId=rs.getString("WRITER_ID");
				Date regdate=rs.getDate("REGDATE");
				String hit=rs.getString("HIT");
				String files=rs.getString("FILES");
				String content=rs.getString("CONTENT");
				
				notice= new Notice(
					nid,
					title,
					writerId,
					regdate,
					hit,
					files,
					content
					);
				
			 }
			 
			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return notice;
	}//--------------------------------
	
	public Notice getNextNotice(int id) {
		Notice notice=null;
		
		String sql= "SELECT ID FROM NOTICE "
				+ "WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID=?) "
				+ "AND ROWNUM=1";
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "newlec", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1, id);
			
			ResultSet rs = st.executeQuery();
	
			if(rs.next()) {		//가져올 게 있다면 
				int nid=rs.getInt("id");
				String title=rs.getString("TITLE");
				String writerId=rs.getString("WRITER_ID");
				Date regdate=rs.getDate("REGDATE");
				String hit=rs.getString("HIT");
				String files=rs.getString("FILES");
				String content=rs.getString("CONTENT");
				
				notice= new Notice(
					nid,
					title,
					writerId,
					regdate,
					hit,
					files,
					content
					);
				
			 }
			 
			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return notice;
	}//--------------------------------
	
	public Notice getPrevNotice(int id) {
		Notice notice=null;
		
		String sql= "SELECT ID FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) "
				+ "WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID=?) "
				+ "AND ROWNUM=1";
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "newlec", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1, id);
			
			ResultSet rs = st.executeQuery();
	
			if(rs.next()) {		//가져올 게 있다면 
				int nid=rs.getInt("id");
				String title=rs.getString("TITLE");
				String writerId=rs.getString("WRITER_ID");
				Date regdate=rs.getDate("REGDATE");
				String hit=rs.getString("HIT");
				String files=rs.getString("FILES");
				String content=rs.getString("CONTENT");
				
				notice= new Notice(
					nid,
					title,
					writerId,
					regdate,
					hit,
					files,
					content
					);
				
			 }
			 
			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return notice;
	}//--------------------------------
	
}
