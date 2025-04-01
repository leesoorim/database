package emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConn;

public class EmpWrite2 {

	public static void main(String[] args) throws Exception{

		Scanner scn = new Scanner(System.in);
		// 작업공간{메모리} 발생
		Statement stmt = DbConn.OracleConn();
		
		System.out.println("{사원명/업무/매니저/입사일/급여/부서번호}");
		System.out.print("입력 >>");
		
		String datas = scn.next();
		String[] array = datas.split("/");
		
		String enm = array[0];
		String job = array[1];
		String mgr = array[2];
		String hdt = array[3];
		String sal = array[4];
		String dno = array[5];
		
		String sql = "insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)"
					+ "values((select max(empno)+1 eno from emp),'"+enm+"','"+job+"','"+mgr+"','"+hdt+"','"+sal+"','0','"+dno+"')";
		int cnt = stmt.executeUpdate(sql); //executeUpdate=> INSERT UPDATE DELETE
		if(cnt==1) {
			System.out.println("입력완료");
		}else {
			System.out.println("입력실패");
		}
		
	}

}
