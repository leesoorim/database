package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DeptTotal {

	public static void main(String[] args) {


		String url = "jdbc:oracle:thin:@//localhost:1522/orcl7";
		String username = "c##java";
		String userpass = "1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con = DriverManager.getConnection(url,username,userpass);
			
			Statement stmt = con.createStatement(); 
			
			String sql = "select count(*)total from dept";
			ResultSet rs = stmt.executeQuery(sql);
			
				
			if(rs.next()) {
				
				int total = rs.getInt("total");
				
				System.out.println("총 개수 : "+ total+"개");
				
			}else {
				System.out.println("** 출력내용이 없습니다. **");
			}
				
			
		} catch (Exception e) {} 
		
		
		
	}

}
