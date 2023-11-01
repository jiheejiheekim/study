package com.newlecture.app.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.newlecture.app.entity.Notice;

public class NoticeService {
	
	private String url = "jdbc:oracle:thin:@localhost:1521/xe";
	private String uid = "newlec";
	private String pwd = "newlec";
	private String driver="oracle.jdbc.driver.OracleDriver";
	
	public List<Notice> getList(int page) throws SQLException, ClassNotFoundException{
		
		int start = 1 + (page-1)*10;	//1,11,21,31...
		int end = 10*page;				//10,20,30,40..
		
		String sql = "select * from notice_view where num between ? and ?";

		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, start);
		st.setInt(2, end);
		
		ResultSet rs = st.executeQuery();
		
		List<Notice> list=new ArrayList<Notice>();
		
		while (rs.next()) {
			int id = rs.getInt("id");
			String title = rs.getString("TITLE");
			String writerId = rs.getString("WRITER_ID");
			Date regDate = rs.getDate("REGDATE");
			String content = rs.getString("CONTENT");
			int hit = rs.getInt("hit");
			String files = rs.getString("FILES");
			
			Notice notice=new Notice(	//객체생성 후 생성자를 통해 값을 담음 : 순서 맞게
					id,
					title,
					writerId,
					regDate,
					content,
					hit,
					files
					);	
			
			//위에서 만든 녀석을 목록에 하나씩 담을 예정
			list.add(notice);
			
		}

		rs.close();
		st.close();
		con.close();
		
		return list; //리스트 반환
	}

	public int insert(Notice notice) throws ClassNotFoundException, SQLException  {
		String title=notice.getTitle();
		String writer_id=notice.getWriterId();
		String content=notice.getContent();
		String files=notice.getFiles();
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String sql = "INSERT INTO NOTICE (title, writer_id,content,files)"
				+ " VALUES (?,?,?,?)";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		//Statement st = con.createStatement();
		//st.ex....(sql)
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, writer_id);
		st.setString(3, content);
		st.setString(4, files);
		
		int result=st.executeUpdate();
	
		
		st.close();
		con.close();
		
		return result;
	}
	
	public int update(Notice notice) throws SQLException, ClassNotFoundException {
		String title=notice.getTitle();
		String content=notice.getTitle();
		String files=notice.getFiles();
		int id=notice.getId();
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String sql = "UPDATE NOTICE SET"
				+ "    TITLE =?,"
				+ "    CONTENT = ?,"
				+ "    FILES = ?"
				+ " WHERE ID=?";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, content);
		st.setString(3, files);
		st.setInt(4, id);
		
		int result=st.executeUpdate();
		
		
		st.close();
		con.close();
		
		return result;
	}
	
	public int delete(int id) throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String sql = "DELETE NOTICE WHERE ID=?";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, id);
		
		int result=st.executeUpdate();
		
		
		st.close();
		con.close();
		
		return result;
	}

	//단일값을 얻어옴 (Scalar)
	public int getCount() throws ClassNotFoundException, SQLException {
		int count=0;	//기본값을 0으로 둠
		
		String sql = "select count(id) count from notice";

		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		Statement st = con.createStatement();
				
		ResultSet rs = st.executeQuery(sql);
		
		List<Notice> list=new ArrayList<Notice>();
		
		if(rs.next()) {
			count = rs.getInt("count");
		}

		rs.close();
		st.close();
		con.close();
		
		return count;
	}
}
