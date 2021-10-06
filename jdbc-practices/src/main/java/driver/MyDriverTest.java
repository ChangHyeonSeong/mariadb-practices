package driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDriverTest {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			//1. JDBC Driver 로딩
			Class.forName("driver.MyDriver");
			
			//2. 연결
			String url = "jdbc:mydb:127.0.0.1:2204/webdb";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			//3. 연결 성공
			System.out.println("ok: " + conn);
		} catch (ClassNotFoundException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// clean up
			try {
//				if(stmt != null) {
//					stmt.close();
//				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
