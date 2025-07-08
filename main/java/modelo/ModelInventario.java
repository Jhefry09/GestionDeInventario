package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidad.Almacenamiento;
import entidadDto.AlmacenamientoDto;
import utils.MySQLDBConexion;

public class ModelInventario {
public List<AlmacenamientoDto> Talmacenamiento() {
	List<AlmacenamientoDto> info = new ArrayList<AlmacenamientoDto>();
	String sql = "SELECT a.id_almac AS ID, a.descrip_almace As Descripcion, "
			+ "ac.desc_capac_almac AS Capacidad, au.nombre_unid As Unidades, "
			+ "at.desc_tipo_almac As Tipo,a.precio_almac As Precio, a.stock_almace As stock "
			+ "FROM Almacenamiento a "
			+ "LEFT Join Almacenamiento_capacidad ac on a.capac_almac_id = ac.id_capaci_almac "
			+ "LEFT Join Almacenamiento_tipo at on a.tipo_almac_id = at.id_almacenamiento_tipo "
			+ "LEFT Join Almacenamiento_unidades au on ac.uni_almac_id = au.id_unid order By a.id_almac";
	try (Connection con = MySQLDBConexion.getConexion();
		PreparedStatement pstm = con.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery()){
		while (rs.next()) {
			AlmacenamientoDto alm = new AlmacenamientoDto();
			alm.setId_almace_dto(rs.getInt(1));
			alm.setDesc_almace_dto(rs.getString(2));
			alm.setCapacidad_almace_dto(rs.getInt(3));
			alm.setUnidades_almace_dto(rs.getString(4));
			alm.setTipo_almace_dto(rs.getString(5));
			alm.setPrecio_almace_dto(rs.getInt(6));
			alm.setStock_almace_dto(rs.getInt(7));
			info.add(alm);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}
}
