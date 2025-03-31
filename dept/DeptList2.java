package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DeptList2 {

	public static void main(String[] args) {

	//자바,데이터베이스커넥트:jdbc
	// 불변 --> jdbc:oracle:thin:@//        접속IP(또는 호스트이름)
	//--> 127.0.0.1(내부아이피)
		//String url = "jdbc:oracle:thin:@//127.0.0.1:1522/orcl7";
		String url = "jdbc:oracle:thin:@//localhost:1522/orcl7";
		String username = "c##java";
		String userpass = "1234";
		
		try {
			// 접속드라이버설정(드라이버관리클래스)
			Class.forName("oracle.jdbc.OracleDriver");
			
			// 접속 후 접속 내역을 con이라는 변수가 가지게 됨
			Connection con = DriverManager.getConnection(url,username,userpass);
			
			// stmt : 메모리의 공간위치를 얻게 됨
			Statement stmt = con.createStatement(); // 메모리에 작업 공간 확보
			
			String sql = "select deptno,dname,loc from dept";
			// executeQuery : 출력SQL(만) 실행하는 메소드
		// 참조클래스 참조변수= 객체실행
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) { // next() 출력 레코드의 존재 유무
				// getString : 컬럼 값을 가져오는 메소드
				System.out.println(rs.getString("deptno")+" "+rs.getString("dname")+" "+rs.getString("loc"));
			}
					
			
		} catch (Exception e) {} 
		
		
		
	}

}
