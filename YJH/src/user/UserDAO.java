package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	// dao:데이터베이스 접근 객체의 약자
	// 실질적으로 db에서 회원정보를 불러오거나 db에 회원정보를 넣을 때
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@localhost:1521:yjh";
			String dbID = "yjh";
			String dbPassword = "6906";

			Class.forName(driverName);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

			System.out.println("DB 연결 \n");
		} catch (ClassNotFoundException e) {
			System.out.println("DB 드라이버 로딩 실패:" + e.toString());
		} catch (SQLException sqle) {
			// TODO: handle exception
		} catch (Exception e) {
			System.out.println("Unknown error");
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return conn;
	}

	public void close() {
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
		}
	}

	public int join(user user) {
		String SQL="INSERT INTO YJH_USER VALUES(?,?,?,?,?,'N')";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserNickname());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	public int login(String userID, String userPassword) {
		String SQL = "SELECT USER_PASS FROM YJH_USER WHERE USER_ID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1;// 로긴성공
				} else
					return 0;// 비번 불일치
			}
			return -1;// 아이디 없음

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터베이스 오류를 의미
	}

	public int calendarinsert(String calYear, String calMonth, String calDay, String calSubject, String calContents) {
		String SQL = "INSERT INTO YJH_CALENDAR VALUES (seq_diary_id.nextval, ?, ?, ?, ?, ?, sysdate)";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, calYear);
			pstmt.setString(2, calMonth);
			pstmt.setString(3, calDay);
			pstmt.setString(4, calSubject);
			pstmt.setString(5, calContents);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;// 성공
			}
			return -1;// 실패
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터베이스 오류를 의미
	}
}