package dept2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import comm.DbConn;

public class DeptDelete {

	public static void main(String[] args) throws Exception{
		


		
		Statement stmt = DbConn.OracleConn();
		
		String sql = "delete from dept where loc='부산'";
		// insertCnt : 저장실행 결과 저장(1) 실패(0)
		// DB : insert/update/delete -> 실행 개수를 던져줌
		int cnt = stmt.executeUpdate(sql); // insert,update,delete
		
		System.out.println("** 삭제 개수>> "+ cnt);
		if(cnt >0) {
			System.out.println("삭제완료");
		}else {
			System.out.println("삭제실패");
		}
		
	
		
	}

}
