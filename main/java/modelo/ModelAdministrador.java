package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entidad.Administrador;
import utils.MySQLDBConexion;

public class ModelAdministrador {
public Administrador iniciarSesion(String usuario, String clave ) {
	Administrador admin = null;
	String sql = "Select * from Administradores where login_administrador=? AND contraseña_administrador=?";
	try (
		Connection con = MySQLDBConexion.getConexion();
		PreparedStatement pstm = con.prepareStatement(sql);
	){
		pstm.setString(1, usuario);
		pstm.setString(2, clave);	
		try(ResultSet rs = pstm.executeQuery()){
			if (rs.next()) {
				admin = new Administrador();
				admin.setId_administrador(rs.getInt("id_administradores"));
				admin.setNombre_administrador(rs.getString("nombre_administrador"));
		}
		}
	} catch (Exception e) {
	e.printStackTrace();
	System.out.println("error en el inicio conector");
	}return admin;
}
}
