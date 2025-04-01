package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConn {
	
	public static Statement OracleConn() throws Exception {
		
		String url = "jdbc:oracle:thin:@//localhost:1522/orcl7";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");		
		Connection con = DriverManager.getConnection(url,username,userpass);
		Statement stmt = con.createStatement(); 
		
		return stmt;
		
	}

}
