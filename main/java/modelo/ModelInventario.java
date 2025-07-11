package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidadDto.AlmacenamientoDto;
import entidadDto.AmdGraficaDto;
import entidadDto.AmdProcesadorDto;
import entidadDto.DisipadorDto;
import entidadDto.FuenteDto;
import entidadDto.IntelProcesadorDto;
import entidadDto.NvidiaGraficaDto;
import entidadDto.PerifericosDto;
import entidadDto.PlacaBaseDto;
import entidadDto.RamDto;
import utils.MySQLDBConexion;

public class ModelInventario {
public List<AlmacenamientoDto> tAlmacenamiento() {
	List<AlmacenamientoDto> info = new ArrayList<AlmacenamientoDto>();
	String sql = "SELECT a.id_almac AS ID, "
			+ "a.descrip_almace As Descripcion, "
			+ "ac.desc_capac_almac AS Capacidad, "
			+ "au.nombre_unid As Unidades, "
			+ "at.desc_tipo_almac As Tipo, "
			+ "a.precio_almac As Precio, "
			+ "a.stock_almace As stock "
			+ "FROM Almacenamiento As a "
			+ "LEFT Join Almacenamiento_capacidad As ac "
			+ "on a.capac_almac_id = ac.id_capaci_almac "
			+ "LEFT Join Almacenamiento_tipo As at "
			+ "on a.tipo_almac_id = at.id_almacenamiento_tipo "
			+ "LEFT Join Almacenamiento_unidades As au "
			+ "on ac.uni_almac_id = au.id_unid "
			+ "order By ID";
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
			+ "FROM Disipador As d "
			+ "LEFT Join Disipador_tipo As dt "
			+ "on d.tipo_disip_id = dt.id_disip_tipo "
			+ "order By ID";
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
			+ "FROM GestionDeInventario.Fuente_de_Energia As f "
			+ "LEFT Join GestionDeInventario.Fuente_capacidad As fc "
			+ "on f.capacidad_fuente_id = fc.id_capacidad_fuente "
			+ "LEFT Join GestionDeInventario.Fuente_certificacion As fcc "
			+ "on f.certificado_fuente_id = fcc.id_fuente_certificacion "
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
			+ "LEFT Join GestionDeInventario.Gama_intel as gi "
			+ "on pi.gama_intel_id = gi.id_gama_intel "
			+ "LEFT Join GestionDeInventario.Generacion_procs_intel as gpi "
			+ "on pi.gener_proce_intel_id = gpi.id_gene_proc_intel "
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

public List<AmdProcesadorDto> tAmdProcesador() {
	List<AmdProcesadorDto> info = new ArrayList<AmdProcesadorDto>();
	String sql = "SELECT pa.id_proce_AMD AS ID, "
			+ "gp.nom_gama_proc_amd  As Gama, "
			+ "gpa.nom_gene_proce_amd As Generacion, "
			+ "gpa.nom_clave_gene_amd  As Nombre_clave, "
			+ "pa.precio_proce_AMD  As Precio, "
			+ "pa.stock_proce_amd  As stock "
			+ "FROM GestionDeInventario.ProcesadorAMD as pa "
			+ "LEFT Join GestionDeInventario.Gama_proce_amd as gp "
			+ "on pa.gama_AMD_id = gp.id_gama_proce_amd "
			+ "LEFT Join GestionDeInventario.Generacion_proces_amd as gpa "
			+ "on pa.gener_proce_AMD_id = gpa.id_generacion_proce_amd "
			+ "order By ID";
	try (Connection con = MySQLDBConexion.getConexion();
		 PreparedStatement pstm = con.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			AmdProcesadorDto apd = new AmdProcesadorDto();
			apd.setId_amd_procesador(rs.getInt(1));
			apd.setGama_amd_procesador(rs.getString(2));
			apd.setGeneracion_amd_procesador(rs.getString(3));
			apd.setNombre_clave_amd_procesador(rs.getString(4));
			apd.setPrecio_amd_procesador(rs.getInt(5));
			apd.setStock_amd_procesador(rs.getInt(6));
			info.add(apd);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}

public List<AmdGraficaDto> tAmdGrafica(){
	List<AmdGraficaDto> info = new ArrayList<AmdGraficaDto>();
	String sql = "SELECT ga.id_grafica_amd AS ID, "
			+ "ga.descripcion_grafi_amd As Descripcion, "
			+ "gg.gama_descrip As Gama,"
			+ "gag.descrip_gene_grafi_amd As Generacion, "
			+ "ga.precio_grafi_amd As Precio, "
			+ "ga.stock_grafi_amd As stock "
			+ "FROM GestionDeInventario.Grafica_amd as ga "
			+ "LEFT Join GestionDeInventario.Grafica_amd_gama as gg "
			+ "on ga.gama_grafi_amd_id = gg.id_gama_amd_grafica "
			+ "LEFT Join GestionDeInventario.Grafica_amd_generacion as gag "
			+ "on ga.generacion_grafi_amd_id = gag.id_gene_grafi_amd "
			+ "order By ID";
	try (Connection con = MySQLDBConexion.getConexion();
		 PreparedStatement pstm = con.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			AmdGraficaDto agd = new AmdGraficaDto();
			agd.setId_amd_grafica(rs.getInt(1));
			agd.setDescripcion_amd_grafica(rs.getString(2));
			agd.setGama_amd_grafica(rs.getInt(3));
			agd.setGeneracion_amd_grafica(rs.getString(4));
			agd.setPrecio_amd_grafica(rs.getInt(5));
			agd.setStock_amd_grafica(rs.getInt(6));
			info.add(agd);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}

public List<NvidiaGraficaDto> tNvidiaGrafica() {
	List<NvidiaGraficaDto> info = new ArrayList<NvidiaGraficaDto>();
	String sql = "SELECT gn.id_grafica_nvidia AS ID, "
			+ "gn.descripcion_grafi_nvidia As Descripcion, "
			+ "gg.descrip_gene_grafi_nvidia As Generacion, "
			+ "gng.gama_descrip_nvidia As Gama, "
			+ "gn.precio_grafi_nvidia As Precio, "
			+ "gn.stock_grafi_nvidia As stock "
			+ "FROM GestionDeInventario.Grafica_nvidia as gn "
			+ "LEFT Join GestionDeInventario.Grafica_nvidia_gama as gng "
			+ "on gn.gama_grafi_nvidia_id = gng.id_gama_nvidia_grafica "
			+ "LEFT Join GestionDeInventario.Grafica_nvidia_generacion as gg "
			+ "on gn.generacion_grafi_nvidia_id = gg.id_gene_grafi_nvidia "
			+ "order By ID";
	try (Connection con = MySQLDBConexion.getConexion();
		 PreparedStatement pstm = con.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			NvidiaGraficaDto ngd = new NvidiaGraficaDto();
			ngd.setId_nvidia_grafica(rs.getInt(1));
			ngd.setDescripcion_nvidia_grafica(rs.getString(2));
			ngd.setGeneracion_nvidia_grafica(rs.getInt(3));
			ngd.setGama_nvidia_grafica(rs.getInt(4));
			ngd.setPrecio_nvidia_grafica(rs.getInt(5));
			ngd.setStock_nvidia_grafica(rs.getInt(6));
			info.add(ngd);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}
public List<PerifericosDto> tPerifericos() {
	List<PerifericosDto> info = new ArrayList<PerifericosDto>();
	String sql = "SELECT p.id_perifericos AS ID, "
			+ "p.descripc_perifericos As Descripcion, "
			+ "pt.descrip_tipo_perifericos As Tipo, "
			+ "p.precio_perifericos As Precio, "
			+ "p.stock_perifericos As stock "
			+ "FROM GestionDeInventario.Perifericos as p "
			+ "LEFT Join GestionDeInventario.Perifericos_tipo as pt "
			+ "on p.tipo_perifericos_id = pt.id_tipo_perifericos "
			+ "order By ID";
	try (Connection con = MySQLDBConexion.getConexion();
		 PreparedStatement pstm = con.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			PerifericosDto pd = new PerifericosDto();
			pd.setId_perifericos(rs.getInt(1));
			pd.setDescripcion_perifericos(rs.getString(2));
			pd.setTipo_perifericos(rs.getString(3));
			pd.setPrecio_perifericos(rs.getInt(4));
			pd.setStock_perifericos(rs.getInt(5));
			info.add(pd);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}

public List<PlacaBaseDto> tPlacaBase() {
	List<PlacaBaseDto> info = new ArrayList<PlacaBaseDto>();
	String sql = "SELECT pb.id_placa_base AS ID, "
			+ "pb.descri_placa_base As Descripcion, "
			+ "rg.gener_ram_nom AS \"Ram Generacion\", "
			+ "pb.precio_placa_base As Precio, "
			+ "pb.stock_placa_base As stock "
			+ "FROM GestionDeInventario.PlacaBase as pb "
			+ "LEFT Join GestionDeInventario.Ram_generacion as rg "
			+ "on pb.gene_ram_id = rg.id_gener_ram_nom "
			+ "order By ID";
	try (Connection con = MySQLDBConexion.getConexion();
		 PreparedStatement pstm = con.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			PlacaBaseDto pbd = new PlacaBaseDto();
			pbd.setId_placa_base(rs.getInt(1));
			pbd.setDescripcion_placa_base(rs.getString(2));
			pbd.setRam_generacion_placa_base(rs.getString(3));
			pbd.setPrecio_placa_base(rs.getInt(4));
			pbd.setStock_placa_base(rs.getInt(5));
			info.add(pbd);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}

public List<RamDto> tRam() {
	List<RamDto> info = new ArrayList<RamDto>();
	String sql = "SELECT r.id_ram AS ID, "
			+ "r.descrip_ram As Descripcion, "
			+ "rc.capacidad_gb AS Capacidad_GB, "
			+ "rg.gener_ram_nom AS Ram_Generacion, "
			+ "r.precio_ram As Precio,"
			+ "r.stock_ram As stock "
			+ "FROM GestionDeInventario.Ram as r "
			+ "LEFT Join GestionDeInventario.Ram_generacion as rg "
			+ "on r.genera_ram_id = rg.id_gener_ram_nom "
			+ "LEFT Join GestionDeInventario.Ram_capacidad as rc "
			+ "on r.capaci_ram_id = rc.id_ram_capac "
			+ "order By ID";
	try (Connection con = MySQLDBConexion.getConexion();
		 PreparedStatement pstm = con.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
		) {
		while (rs.next()) {
			RamDto rd = new RamDto();
			rd.setId_ram(rs.getInt(1));
			rd.setDescripcion_ram(rs.getString(2));
			rd.setCapacidad_ram(rs.getInt(3));
			rd.setRam_generacion_ram(rs.getString(4));
			rd.setPrecio_ram(rs.getInt(5));
			rd.setStock_ram(rs.getInt(6));
			info.add(rd);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}return info;
}
}