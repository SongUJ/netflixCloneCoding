package board;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection conn = null;
	public static Connection getConnection() {   
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "user0616";		
		String dbPw = "pass1234";		
		
		try {
			Class.forName(driver);  
			conn = DriverManager.getConnection(url, dbId, dbPw);  
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
