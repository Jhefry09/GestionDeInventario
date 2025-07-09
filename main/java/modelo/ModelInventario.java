package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidad.Almacenamiento;
import entidadDto.AlmacenamientoDto;
import entidadDto.AmdGraficaDto;
import entidadDto.DisipadorDto;
import entidadDto.FuenteDto;
import entidadDto.IntelProcesadorDto;
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
		ResultSet rs = pstm.executeQuery();
		){
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
public List<FuenteDto> tFuente(){
	List<FuenteDto> info = new ArrayList<FuenteDto>();
	String sql = "SELECT f.id_fuente AS ID, "
			+ "f.descripcion_fuente As Descripcion, "
			+ "fc.watts As watts, "
			+ "fcc.certificacion As Certificacion, "
			+ "f.precio_fuente As Precio, "
			+ "f.Stock_fuente As stock "
			+ "FROM GestionDeInventario.Fuente_de_Energia f "
			+ "LEFT Join GestionDeInventario.Fuente_capacidad fc on f.capacidad_fuente_id = fc.id_capacidad_fuente "
			+ "LEFT Join GestionDeInventario.Fuente_certificacion fcc on f.certificado_fuente_id = fcc.id_fuente_certificacion "
			+ "order By ID";
	try(Connection con = MySQLDBConexion.getConexion();
		PreparedStatement pstm = con.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			FuenteDto fetd = new FuenteDto();
			fetd.setId_fuente(rs.getInt(1));
			fetd.setDescripcion_fuente(rs.getString(2));
			fetd.setWatts_fuente(rs.getInt(3));
			fetd.setCertificacion_fuente(rs.getString(4));
			fetd.setPrecio_fuente(rs.getInt(5));
			fetd.setStock_fuente(rs.getInt(6));
			info.add(fetd);
		}		
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
	
}

public List<IntelProcesadorDto> tIntelProcesador() {
	List<IntelProcesadorDto> info = new ArrayList<IntelProcesadorDto>();
	String sql = "SELECT pi.id_proce_intel AS ID, "
			+ "gi.nom_gama_intel As Gama, "
			+ "gpi.nombre_gene_intel As Generacion, "
			+ "gpi.nombre_clave_gene_intel As Nombre_clave, "
			+ "pi.precio_proce_intel As Precio, "
			+ "pi.stock_proc_intel As stock "
			+ "FROM GestionDeInventario.ProcesadorIntel as pi "
			+ "LEFT Join GestionDeInventario.Gama_intel as gi  on pi.gama_intel_id = gi.id_gama_intel "
			+ "LEFT Join GestionDeInventario.Generacion_procs_intel as gpi on pi.gener_proce_intel_id = gpi.id_gene_proc_intel "
			+ "order By ID";
	try (Connection con = MySQLDBConexion.getConexion();
		 PreparedStatement pstm = con.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			IntelProcesadorDto ipd = new IntelProcesadorDto();
			ipd.setId_intel(rs.getInt(1));
			ipd.setGama_intel(rs.getString(2));
			ipd.setGeneracion_intel(rs.getString(3));
			ipd.setNombre_clave_intel(rs.getString(4));
			ipd.setPrecio_intel(rs.getInt(5));
			ipd.setStock_intel(rs.getInt(6));
			info.add(ipd);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}


public List<AmdGraficaDto> tAmdGrafica(){
	List<AmdGraficaDto> info = new ArrayList<AmdGraficaDto>();
	sql
}

}



