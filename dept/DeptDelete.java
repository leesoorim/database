package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DeptDelete {

	public static void main(String[] args) {
		
		// 접속 변수 설정
		String url = "jdbc:oracle:thin:@//localhost:1522/orcl7";
		String username = "c##java";
		String userpass = "1234";
		
		// 예외처리 : 자바의 흐름과 무관한 오류가 발생했을 때의 설정
		try {
		// 접속 드라이버 클래스 설정
		Class.forName("oracle.jdbc.OracleDriver");
		
		// 접속정보(성공/실패)
		Connection con = DriverManager.getConnection(url,username,userpass);
		
		// 객체 생성 === 작업공간발생(메모리)
		Statement stmt = con.createStatement();
		
		String sql = "delete from dept where deptno=100";
		// insertCnt : 저장실행 결과 저장(1) 실패(0)
		// DB : insert/update/delete -> 실행 개수를 던져줌
		int insertCnt = stmt.executeUpdate(sql); // insert,update,delete
		if(insertCnt==1) {
			System.out.println("** 삭제완료 !!! **");
		}else {
			System.out.println("** 삭제실패 !!! **");
		}
		
		}catch(Exception e) {
			System.out.println("** 접속 오류 관리자에게 연락주세요. **");
		}
		
	}

}
