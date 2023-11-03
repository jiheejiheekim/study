package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Program4 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		int id=7;
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String sql = "DELETE NOTICE WHERE ID=?";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, "newlec", "newlec");
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, id);
		
		int result=st.executeUpdate();
		
		System.out.println("result : "+result);
		
		st.close();
		con.close();

	}

}
