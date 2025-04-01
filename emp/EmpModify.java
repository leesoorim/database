package emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConn;

public class EmpModify {

	public static void main(String[] args) throws Exception{

		Scanner scn = new Scanner(System.in);
		// 작업공간{메모리} 발생
		Statement stmt = DbConn.OracleConn();
		
		System.out.println("[사원정보수정]");
		System.out.println("{사원번호/사원명/업무/매니저/입사일/급여/부서번호}");
		System.out.print("입력 >>");
		
		String datas = scn.next();
		String[] array = datas.split("/");
		
		String eno = array[0];
		String enm = array[1];
		String job = array[2];
		String mgr = array[3];
		String hdt = array[4];
		String sal = array[5];
		String dno = array[6];
		
		String sql = "update emp set "
							+ "ename = '"+enm+"',"
							+ "job='"+job+"',"
							+ "mgr='"+mgr+"',"
							+ "hiredate='"+hdt+"',"
							+ "sal='"+sal+"',"
							+ "deptno='"+dno+"'"
							+ "where empno= '"+eno+"'";
		int cnt = stmt.executeUpdate(sql); //executeUpdate=> INSERT UPDATE DELETE
		if(cnt==1) {
			System.out.println("수정완료");
		}else {
			System.out.println("수정실패");
		}
		
	}

}
