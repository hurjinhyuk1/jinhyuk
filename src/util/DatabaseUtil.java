package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
//db와 연동...

	public static Connection getConnection() {
		try {
			//String dbURL = "jdbc:mysql://localhost/jspdb?useSSL=false&serverTimezone=UTC";
			String dbURL="jdbc:mysql://localhost:3306/lectureevaluation?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
			String dbID = "jspbook";
			String dbPassword = "passwd";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
