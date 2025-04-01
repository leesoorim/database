package emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConn;

public class EmpDelete {

	public static void main(String[] args) throws Exception {

		Statement stmt = DbConn.OracleConn();
		Scanner scn = new Scanner(System.in);
		System.out.println("[사원정보 삭제]");
		System.out.println("----------------");
		System.out.print("*사원번호>>");
		String sno = scn.next();
		
		String sql_cnt= "select count(*) from emp where empno='"+sno+"'";
		ResultSet rsCnt = stmt.executeQuery(sql_cnt);
		rsCnt.next();
		int result = rsCnt.getInt(1); // 출력변호
		
		if(result==0) {
			System.out.println("없는 사원번호입니다.");
			return; // 메소드 실행 종료
		}
		
		String sql = "DELETE FROM emp WHERE empno='"+sno+"'";
		int cnt = stmt.executeUpdate(sql);
		
		if(cnt>0) {
			
			System.out.println(cnt+"개의 사원정보 삭제완료!");
		}else {
			System.out.println("삭제실패!");
		}
		
	}

}
