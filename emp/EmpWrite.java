package emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConn;

public class EmpWrite {

	public static void main(String[] args) throws Exception{

		Scanner scn = new Scanner(System.in);
		// 작업공간{메모리} 발생
		Statement stmt = DbConn.OracleConn();
		
		String sql2 = "select max(empno) eno from emp";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int eno = rs2.getInt("eno");
		eno++;
		
		System.out.print("1. 사원명 >>");
		String enm = scn.next();
		
		System.out.print("2. 업무 >>");
		String job = scn.next();
		
		System.out.print("3. 매니저 >>");
		String mgr = scn.next();
		
		System.out.print("4. 입사일(0000-00-00) >>");
		String hdt = scn.next();
		
		System.out.print("5. 급여 >>");
		String sal = scn.next();
		
		System.out.print("6. 부서번호 >>");
		String dno = scn.next();
		
		String sql = "insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)"
						+ "values('"+eno+"','"+enm+"','"+job+"','"+mgr+"','"+hdt+"','"+sal+"','0','"+dno+"')";
		int cnt = stmt.executeUpdate(sql); //executeUpdate=> INSERT UPDATE DELETE
		if(cnt==1) {
			System.out.println("입력완료");
		}else {
			System.out.println("입력실패");
		}
		
	}

}
