package user;

import java.sql.DriverManager; 
import java.sql.SQLException;
public class OracleEx {
	public static void main(String[] args) {
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:yjh";
    String user = "yjh"; String password = "6906";
    
    try { 
    	Class.forName(driver);
    	System.out.println("jdbc driver 연결성공");
    	DriverManager.getConnection(url, user, password);
    	System.out.println("오라클 연결 성공"); 
    } catch (ClassNotFoundException e) {
      	System.out.println("jdbc driver 연결 실패"); 
    } catch (SQLException e) {
    	System.out.println("오라클 연결 성공");
    }
  } 
}