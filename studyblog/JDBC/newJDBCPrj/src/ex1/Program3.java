package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Program3 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String title="TEST3";
		String content="공부중";
		String files="";
		int id=6;
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String sql = "UPDATE NOTICE SET"
				+ "    TITLE =?,"
				+ "    CONTENT = ?,"
				+ "    FILES = ?"
				+ " WHERE ID=?";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, "newlec", "newlec");
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, content);
		st.setString(3, files);
		st.setInt(4, id);
		
		int result=st.executeUpdate();
		
		System.out.println("result : "+result);
		
		st.close();
		con.close();

	}

}
