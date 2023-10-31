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
	
	public List<Notice> getList() throws SQLException, ClassNotFoundException{

	
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String sql = "SELECT * FROM NOTICE";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, "newlec", "newlec");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
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
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, "newlec", "newlec");
		//Statement st = con.createStatement();
		//st.ex....(sql)
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, writer_id);
		st.setString(3, content);
		st.setString(4, files);
		
		int result=st.executeUpdate();
		
		System.out.println("result : "+result);
		
		st.close();
		con.close();
		
		return result;
	}
	
	public int update(Notice notice) {
		return 0;
	}
	
	public int delete(int id) {
		return 0;
	}
}
