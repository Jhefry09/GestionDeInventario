package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidad.Almacenamiento;
import entidadDto.AlmacenamientoDto;
import entidadDto.DisipadorDto;
import utils.MySQLDBConexion;

public class ModelInventario {
public List<AlmacenamientoDto> tAlmacenamiento() {
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
public List<DisipadorDto> tDisipador() {
	List<DisipadorDto> info = new ArrayList<DisipadorDto>();
	String sql="SELECT d.id_disipador AS ID, "
			+ "d.descrip_disip As Descripcion, "
			+ "dt.tipo_disipador As Tipo, "
			+ "d.precio_disipador As Precio, "
			+ "d.stock_disipador As stock "
			+ "FROM Disipador d "
			+ "LEFT Join Disipador_tipo dt on d.tipo_disip_id = dt.id_disip_tipo "
			+ "order By d.id_disipador";
	try (Connection con = MySQLDBConexion.getConexion();
		PreparedStatement pstm = con.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
			){
		while (rs.next()) {
			DisipadorDto dspd = new DisipadorDto();
			dspd.setId_disipador_tdo(rs.getInt(1));
			dspd.setDes_disipador_tdo(rs.getString(2));
			dspd.setTipo_disipador_tdo(rs.getString(3));
			dspd.setPrecio_disipador_tdo(rs.getInt(4));
			dspd.setStock_disipador_tdo(rs.getInt(5));
			info.add(dspd);			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}
}
