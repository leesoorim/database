package emp;
/**
 *  데이터 일괄 등록처리
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;

import comm.DbConn;

public class EmpWrite3 {

	public static void main(String[] args) throws Exception{

		Statement stmt = DbConn.OracleConn();
		
		String filePath = "C:\\mytemp/emp_data.txt";
		
		FileReader fr = new FileReader(filePath);
		BufferedReader br = new BufferedReader(fr);
		
		long ct1 = System.currentTimeMillis(); // 유닉스시간(1000 -> 1초)
		long nt1 = System.nanoTime();	// 나노시간
		
		int cnt =0;
		while(true) {
			String str=br.readLine();
			if(str==null) break;
			//System.out.println(str);
			
			String[] array = str.split("/");
			String enm = array[0];
			String job = array[1];
			String mgr = array[2];
			String hdt = array[3];
			String sal = array[4];
			String dno = array[5];
			
			
			String sql =  "insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)"
					+ "values((select max(empno)+1 eno from emp),'"+enm+"','"+job+"','"+mgr+"','"+hdt+"','"+sal+"','0','"+dno+"')";
			
			stmt.executeUpdate(sql);
			cnt++;
		}
		long ct2 = System.currentTimeMillis(); // 유닉스시간(1000 -> 1초)
		long nt2 = System.nanoTime();	// 나노시간
		
		System.out.println("----------------------------");
		System.out.println("유닉스 : "+(ct2-ct1));
		System.out.println("나노시간 : "+(nt2-nt1));
		System.out.println("----------------------------");
		System.out.println("입력 데이터"+cnt+"건 저장완료!!");
	}

}
