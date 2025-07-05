package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLDBConexion {
public static Connection getConexion() {
	Connection cn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GestionDeInventario", "root", "030609");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return cn;
}
}
