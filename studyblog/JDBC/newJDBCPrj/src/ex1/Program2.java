package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Program2 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String title="TEST2";
		String writer_id="newlec2";
		String content="hahaha";
		String files="";
		
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

	}

}
