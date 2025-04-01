package dept2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConn;

public class DeptModify {

	public static void main(String[] args)throws Exception{
		
		Scanner scn = new Scanner(System.in);
		Statement stmt = DbConn.OracleConn();
		
		System.out.print("1.부서번호 >>");
		String deptno = scn.next();
		
		System.out.print("2.부서이름 >>");
		String dname = scn.next();
		
		System.out.print("3.부서위치 >>");
		String loc = scn.next();
		
		String sql = "update dept2 set dname='"+dname+"',loc='"+loc+"'"+"where deptno='"+deptno+"'";

		int insertCnt = stmt.executeUpdate(sql); // insert,update,delete
		if(insertCnt==1) {
			System.out.println("** 저장완료 !!! **");
		}else {
			System.out.println("** 저장실패 !!! **");
		}
		
	}

}
