package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class EmpList {

	public static void main(String[] args) {

		String url = "jdbc:oracle:thin:@//localhost:1522/orcl7";
		String username = "c##java";
		String userpass = "1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con = DriverManager.getConnection(url,username,userpass);
			
			Statement stmt = con.createStatement(); 
			
			String sql = "select empno,ename,job,sal,deptno from emp";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) { 
				
				String eno = rs.getString("empno");
				String enm = rs.getString("ename");
				String job = rs.getString("job");
				String dno = rs.getString("deptno");
				String sal = rs.getString("sal");
				
				System.out.println(eno+" "+enm+" "+job+" "+sal+" "+dno);
			}
					
			
		} catch (Exception e) {} 
		
	}

}
