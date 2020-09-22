package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	// dao:�����ͺ��̽� ���� ��ü�� ����
	// ���������� db���� ȸ�������� �ҷ����ų� db�� ȸ�������� ���� ��
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

			System.out.println("DB ���� \n");
		} catch (ClassNotFoundException e) {
			System.out.println("DB ����̹� �ε� ����:" + e.toString());
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
					return 1;// �α伺��
				} else
					return 0;// ��� ����ġ
			}
			return -1;// ���̵� ����

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// �����ͺ��̽� ������ �ǹ�
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
				return 1;// ����
			}
			return -1;// ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// �����ͺ��̽� ������ �ǹ�
	}
}