package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConn;

public class EmpList {

	public static void main(String[] args) throws Exception{

		
	
			
			Statement stmt = DbConn.OracleConn(); 
			
			String sql1 = "select count(*)total from emp";
			ResultSet rs1 = stmt.executeQuery(sql1);
			rs1.next();
			
			int total = rs1.getInt("total");
			System.out.println("총 사원수 : "+ total);
			System.out.println("------------------------------");
			
			String sql = "select empno,ename,job,hiredate,deptno from emp order by hiredate desc";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) { 
				
				String eno = rs.getString("empno");
				String enm = rs.getString("ename");
				String job = rs.getString("job");
				String hdt = rs.getString("hiredate").substring(0,10);
				String dno = rs.getString("deptno");
				
				System.out.println(eno+" "+enm+" "+job+" "+dno+" "+hdt);
			}
		
	}

}
