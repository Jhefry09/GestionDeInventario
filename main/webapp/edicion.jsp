<%@page import="entidadDto.RamDto"%>
<%@page import="entidadDto.PlacaBaseDto"%>
<%@page import="entidadDto.PerifericosDto"%>
<%@page import="entidadDto.NvidiaGraficaDto"%>
<%@page import="entidadDto.AmdGraficaDto"%>
<%@page import="entidadDto.AmdProcesadorDto"%>
<%@page import="entidadDto.IntelProcesadorDto"%>
<%@page import="entidadDto.FuenteDto"%>
<%@page import="entidadDto.DisipadorDto"%>
<%@page import="entidadDto.AlmacenamientoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>EDICION DE PRODUCTO</title>
</head>
<body class="bg-dark">
<%
String nomTabla = (String) request.getAttribute("nomTa");
String titulo = (String) request.getAttribute("titulo");
%>
		<div class="row d-flex mx-3 my-2 align-items-center align-middle text-center">
		<form action="ServletInventario" class="col">
		<input type="hidden" name="seleccion" value="Listar">
		<input type="hidden" name="inventario" value="<%= nomTabla%>">
		<button type="submit" class="btn btn-outline-light btn-sm fw-bolder border-4 align-items-center"><i class="bi bi-caret-left-fill"></i> REGRESAR</button>
		</form>
		<div class="col">
		<label class="text-center fs-2 fw-bolder text-light align-items-center align-middle"><%= titulo %></label>
		</div>
		<div class="col">
		</div>
		</div>
<div class="table-responsive mx-5">
		<%
		switch (nomTabla){
		case "GestionDeInventario.Almacenamiento":{
		List<AlmacenamientoDto> datos = (List<AlmacenamientoDto>) request.getAttribute("datos");
		if (datos != null) {
			for (AlmacenamientoDto dat : datos) {
		%>
		<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
		<thead>
			<tr>
			<th scope="col" class="fs-4">DATOS</th>
			<th scope="col" class="fs-4">
			<i class="bi bi-sliders"> </i>  ID  
			<%=dat.getId_almace_dto()%> 
			<input type="hidden" name="IdAlma" value="<%=dat.getId_almace_dto()%>">
			</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionAlma" value="<%=dat.getDesc_almace_dto()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">CAPACIDAD TB/GB</td>
				<td>
				<div class=" input-group">
				<div class="col-11">
				<select name="CapacidadAlma" class=" text-center form-select  fw-bolder bg-dark text-light border-3">
				<option value=" <%=dat.getCapacidad_almace_dto()%>"><%=dat.getCapacidad_almace_dto()%></option>
				<option value = "1">128</option>
				<option value = "2">250</option>
				<option value = "3">500</option>
				<option value = "4">1</option>
				<option value = "5">2</option>				
				<option value = "6">4</option>				
				<option value = "7">64</option>				
				<option value = "8">320</option>				
				<option value = "9">1000</option>				
				<option value = "10">2000</option>				
				<option value = "11">6</option>				
				<option value = "12">8</option>				
				<option value = "13">10</option>				
				<option value = "14">12</option>				
				</select>
				</div>
				<div class="col-1">
				<select name="UnidadesAlma" class="input-group-text form-select text-center text-dark fw-bolder border-3 btn-outline-light">
				<option><%=dat.getUnidades_almace_dto()%></option>
				<option>GB</option>
				<option>TB</option>
				</select>
				</div>
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">TIPO</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-hdd-fill"></i></span>
				<select name="TipoAlma" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getTipo_almace_dto()%>"> <%=dat.getTipo_almace_dto()%></option>
				<option value="1">HDD</option>
				<option value="2">SSD</option>
				<option value="3">M.2</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioAlma" value="<%=dat.getPrecio_almace_dto()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockAlma" value="<%=dat.getStock_almace_dto()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.Disipador":{
				List<DisipadorDto> datos = (List<DisipadorDto>) request.getAttribute("datos");
				if (datos != null) {
					for (DisipadorDto dat : datos) {
				%>
			<form action="ServletInventario">
			<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
			<thead>
				<tr>
					<th scope="col" class="fs-4">DATOS</th>
					<th scope="col" class="fs-4"><i class="bi bi-sliders"> </i> ID
						<%=dat.getId_disipador_tdo()%> <input type="hidden" name="IdDisi"
						value="<%=dat.getId_disipador_tdo()%>"></th>
				</tr>
			</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">
				<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionDisi" value="<%=dat.getDes_disipador_tdo()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">TIPO</td>
				<td>
				<div class=" input-group">
				<span class="input-group-text"><i class="bi bi-fan"></i></span>				
				<select name="TipoDisi" class=" text-center form-select  fw-bolder bg-dark text-light border-3">
				<option value=" <%=dat.getTipo_disipador_tdo()%>"><%=dat.getTipo_disipador_tdo()%></option>
				<option value = "1">REFRIGERACION LIQUIDA</option>
				<option value = "2">REFRIGERACION POR VIENTO</option>
				</select>
				</div>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioDisi" value="<%=dat.getPrecio_disipador_tdo()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockDisi" value="<%=dat.getStock_disipador_tdo()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit"
					value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.Fuente_de_Energia":{
				List<FuenteDto> datos = (List<FuenteDto>) request.getAttribute("datos");
				if (datos != null) {
					for (FuenteDto dat : datos) {
				%>
			<form action="ServletInventario">
			<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
			<thead>
				<tr>
					<th scope="col" class="fs-4">DATOS</th>
					<th scope="col" class="fs-4"><i class="bi bi-sliders"> </i> ID
						<%=dat.getId_fuente()%> <input type="hidden" name="IdFuen"
						value="<%=dat.getId_fuente()%>"></th>
				</tr>
			</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
				<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionFuen" value="<%=dat.getDescripcion_fuente()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">CAPACIDAD W</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-lightning-charge-fill"></i></span>
				<select name="CapacidadFuen" class=" text-center form-select  fw-bolder bg-dark text-light border-3">
				<option value=" <%=dat.getWatts_fuente()%>"><%=dat.getWatts_fuente()%> W</option>
				<option value = "1">500 W</option>
				<option value = "2">550 W</option>
				<option value = "3">600 W</option>
				<option value = "4">650 W</option>
				<option value = "5">700 W</option>				
				<option value = "6">750 W</option>				
				<option value = "7">800 W</option>				
				<option value = "8">850 W</option>				
				<option value = "9">900 W</option>				
				<option value = "10">950 W</option>				
				<option value = "11">1000 W</option>				
				</select>
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">CERTIFICACION</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-patch-check-fill"></i></span>
				<select name="CertificadoFuen" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getCertificacion_fuente()%>"> <%=dat.getCertificacion_fuente()%></option>
				<option value="1">80 PLUS</option>
				<option value="2">80 PLUS BRONZE</option>
				<option value="3">80 PLUS SILVER</option>
				<option value="4">80 PLUS GOLD</option>
				<option value="5">80 PLUS PLATINIUM</option>
				<option value="6">80 PLUS TITANIUM</option>
				<option value="null">NO TIENE</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioFuen" value="<%=dat.getPrecio_fuente()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockFuen" value="<%=dat.getStock_fuente()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.ProcesadorIntel":{
				List<IntelProcesadorDto> datos = (List<IntelProcesadorDto>) request.getAttribute("datos");
				if (datos != null) { 
					for (IntelProcesadorDto dat : datos) {
				%>
			<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
		
			<thead>
				<tr>
					<th scope="col" class="fs-4">DATOS</th>
					<th scope="col" class="fs-4"><i class="bi bi-sliders"> </i> ID
						<%=dat.getId_intel()%> <input type="hidden" name="IdIntel"
						value="<%=dat.getId_intel()%>"></th>
				</tr>
			</thead>
			<tbody class="text-center align-middle align-items-center table-bordered">	
			<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class=" input-group">
				<span class="input-group-text"><i class="bi bi-cpu-fill"></i></span>
				<select name="DescripcionIntel" class=" text-center form-select  fw-bolder bg-dark text-light border-3">
				<option value=" <%=dat.getGama_intel()%>"><%=dat.getGama_intel()%></option>
				<option value = "1">I3</option>
				<option value = "2">I5</option>
				<option value = "3">I7</option>
				<option value = "4">I9</option>
				</select>
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">GENERACION</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-info-circle-fill"></i></span>
				<select name="GeneracionIntel" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getGeneracion_intel()%>"> <%=dat.getGeneracion_intel()%></option>
				<option value="1">DECIMO PRIMERA</option>
				<option value="2">DECIMO SEGUNDA</option>
				<option value="3">DECIMO TERCERA</option>
				<option value="4">DECIMO CUARTA</option>
				<option value="5">DECIMO QUINTA</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioIntel" value="<%=dat.getPrecio_intel()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockIntel" value="<%=dat.getStock_intel()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.ProcesadorAMD":{
				List<AmdProcesadorDto> datos = (List<AmdProcesadorDto>) request.getAttribute("datos");
				if (datos != null) {
					for (AmdProcesadorDto dat : datos) {
				%>
				<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
		
			<thead>
				<tr>
					<th scope="col" class="fs-4">DATOS</th>
					<th scope="col" class="fs-4"><i class="bi bi-sliders"> </i> ID
						<%=dat.getId_amd_procesador()%> <input type="hidden" name="IdAmd"
						value="<%=dat.getId_amd_procesador()%>"></th>
				</tr>
			</thead>
			<tbody class="text-center align-middle align-items-center table-bordered">	
			<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class=" input-group">
				<span class="input-group-text"><i class="bi bi-cpu-fill"></i></span>
				<select name="DescripcionAmd" class=" text-center form-select  fw-bolder bg-dark text-light border-3">
				<option value=" <%=dat.getGama_amd_procesador()%>"><%=dat.getGama_amd_procesador()%></option>
				<option value = "1">RYZEN 3</option>
				<option value = "2">RYZEN 5</option>
				<option value = "3">RYZEN 7</option>
				<option value = "4">RYZEN 9</option>
				</select>
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">GENERACION</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-amd"></i></span>
				<select name="GeneracionAmd" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getGeneracion_amd_procesador()%>"> <%=dat.getGeneracion_amd_procesador()%></option>
				<option value="1">SEGUNDA</option>
				<option value="2">TERCERA</option>
				<option value="3">CUARTA</option>
				<option value="4">QUINTA</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioAmd" value="<%=dat.getPrecio_amd_procesador()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockAmd" value="<%=dat.getStock_amd_procesador()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.Grafica_amd":{
				List<AmdGraficaDto> datos = (List<AmdGraficaDto>) request.getAttribute("datos");
				if (datos != null) {
					for (AmdGraficaDto dat : datos) {
				%>
			<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
			<thead>
			<tr>
			<th scope="col" class="fs-4">DATOS</th>
			<th scope="col" class="fs-4">
			<i class="bi bi-sliders"> </i>  ID  
			<%=dat.getId_amd_grafica()%> 
			<input type="hidden" name="IdGraAmd" value="<%=dat.getId_amd_grafica()%>">
			</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">	
				<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionGraAmd" value="<%=dat.getDescripcion_amd_grafica()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">GENERACION</td>
				<td>
				<div class=" input-group">
				<span class="input-group-text"><i class="bi bi-amd"></i></span>
				<select name="GeneracionGraAmd" class=" text-center form-select  fw-bolder bg-dark text-light border-3">
				<option value=" <%=dat.getGeneracion_amd_grafica()%>"><%=dat.getGeneracion_amd_grafica()%></option>
				<option value = "1">RDNA 1</option>
				<option value = "2">RDNA 2</option>
				<option value = "3">RDNA 3</option>
				</select>
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">GAMA</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-gpu-card"></i></span>
				<select name="GamaGraAmd" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getGama_amd_grafica()%>"> <%=dat.getGama_amd_grafica()%></option>
				<option value="1">500</option>
				<option value="2">600</option>
				<option value="3">700</option>
				<option value="4">800</option>
				<option value="5">900</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioGraAmd" value="<%=dat.getPrecio_amd_grafica()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockGraAmd" value="<%=dat.getStock_amd_grafica()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.Grafica_nvidia":{
				List<NvidiaGraficaDto> datos = (List<NvidiaGraficaDto>) request.getAttribute("datos");
				if (datos != null) {
					for (NvidiaGraficaDto dat : datos) {
				%>
			<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
			<thead>
			<tr>
			<th scope="col" class="fs-4">DATOS</th>
			<th scope="col" class="fs-4">
			<i class="bi bi-sliders"> </i>  ID  
			<%=dat.getId_nvidia_grafica()%> 
			<input type="hidden" name="IdGraNvi" value="<%=dat.getId_nvidia_grafica()%>">
			</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">	
				<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionGraNvi" value="<%=dat.getDescripcion_nvidia_grafica()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">GENERACION</td>
				<td>
				<div class=" input-group">
				<span class="input-group-text"><i class="bi bi-nvidia"></i></span>
				<select name="GeneracionGraNvi" class=" text-center form-select  fw-bolder bg-dark text-light border-3">
				<option value=" <%=dat.getGeneracion_nvidia_grafica()%>"><%=dat.getGeneracion_nvidia_grafica()%></option>
				<option value = "1">3000</option>
				<option value = "2">4000</option>
				<option value = "3">5000</option>
				</select>
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">GAMA</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-gpu-card"></i></span>
				<select name="GamaGraNvi" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getGama_nvidia_grafica()%>"> <%=dat.getGama_nvidia_grafica()%></option>
				<option value="1">50</option>
				<option value="2">60</option>
				<option value="3">70</option>
				<option value="4">80</option>
				<option value="5">90</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioGraNvi" value="<%=dat.getPrecio_nvidia_grafica()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockGraNvi" value="<%=dat.getStock_nvidia_grafica()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.Perifericos":{
				List<PerifericosDto> datos = (List<PerifericosDto>) request.getAttribute("datos");
				if (datos != null) {
					for (PerifericosDto dat : datos) {
				%>
				<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
		
				<thead>
				<tr>
					<th scope="col" class="fs-4">DATOS</th>
					<th scope="col" class="fs-4"><i class="bi bi-sliders"> </i> ID
						<%=dat.getId_perifericos()%> <input type="hidden" name="IdPeri"
						value="<%=dat.getId_perifericos()%>"></th>
				</tr>
			</thead>
			<tbody class="text-center align-middle align-items-center table-bordered">	
			<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionPeri" value="<%=dat.getDescripcion_perifericos()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">TIPO</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-info-circle-fill"></i></span>
				<select name="TipoPeri" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getTipo_perifericos()%>"> <%=dat.getTipo_perifericos()%></option>
				<option value="1">AUDIFONOS</option>
				<option value="2">MAUS</option>
				<option value="3">TECLADO</option>
				<option value="4">MANDO</option>
				<option value="5">PARLANTES</option>
				<option value="6">CAMARAS</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioPeri" value="<%=dat.getPrecio_perifericos()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockPeri" value="<%=dat.getStock_perifericos()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<% 
			}
				}
			break;
				}
				case "GestionDeInventario.PlacaBase":{
				List<PlacaBaseDto> datos = (List<PlacaBaseDto>) request.getAttribute("datos");
				if (datos != null) {
					for (PlacaBaseDto dat : datos) {
				%>
				<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
		
			<thead>
				<tr>
					<th scope="col" class="fs-4">DATOS</th>
					<th scope="col" class="fs-4"><i class="bi bi-sliders"> </i> ID
						<%=dat.getId_placa_base()%> <input type="hidden" name="IdPla"
						value="<%=dat.getId_placa_base()%>"></th>
				</tr>
			</thead>
			<tbody class="text-center align-middle align-items-center table-bordered">	
			<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionPla" value="<%=dat.getDescripcion_placa_base()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">GENERACION DE RAM</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-memory"></i></span>
				<select name="GeneracionRamPla" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getRam_generacion_placa_base()%>"> <%=dat.getRam_generacion_placa_base()%></option>
				<option value="1">DDR4</option>
				<option value="2">DDR5</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioPla" value="<%=dat.getPrecio_placa_base()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockPla" value="<%=dat.getStock_placa_base()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				case "GestionDeInventario.Ram":{
				List<RamDto> datos = (List<RamDto>) request.getAttribute("datos");
				if (datos != null) {
					for (RamDto dat : datos) {
				%>
				<form action="ServletInventario">
		<table class="table table-responsive table-dark table-striped table-hover  table-bordered text-center  table-responsive ">
		
				<thead>
				<tr>
					<th scope="col" class="fs-4">DATOS</th>
					<th scope="col" class="fs-4"><i class="bi bi-sliders"> </i> ID
						<%=dat.getId_ram()%> <input type="hidden" name="IdRam"
						value="<%=dat.getId_ram()%>"></th>
				</tr>
			</thead>
			<tbody class="text-center align-middle align-items-center table-bordered">	
			<tr>
				<td scope="row" class="fw-bolder">DESCRIPCION</td>
				<td>
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-pencil-square"></i></span>
				<input type="text" name="DescripcionRam" value="<%=dat.getDescripcion_ram()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				 </td>
			</tr>
			<tr >
				<td scope="row" class="fw-bolder">GENERACION DE RAM</td>
				<td> 
				<div class="input-group">
				<span class="input-group-text"><i class="bi bi-memory"></i></span>
				<select name="GeneracionRam" class="form-select text-center fw-bolder bg-dark text-light border-3">
				<option value="<%=dat.getRam_generacion_ram()%>"> <%=dat.getRam_generacion_ram()%></option>
				<option value="1">DDR4</option>
				<option value="2">DDR5</option>
				</select>
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">PRECIO</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-coin"></i></span>
				<input type="text" name="PrecioRam" value="<%=dat.getPrecio_ram()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
				<td scope="row" class="fw-bolder">STOCK</td>
				<td>
				<div class="input-group flex-nowrap">
				<span class="input-group-text"><i class="bi bi-clipboard2-check-fill"></i></span>
				<input type="text" name="StockRam" value="<%=dat.getStock_ram()%>" class="form-control form-sm  text-center bg-dark text-light border-3">
				</div>
				</td>
			</tr>
			<tr>
					<td colspan="2" align="right"><input type="submit"
						value="GUARDAR" class="btn btn-secondary btn-outline-light fw-bolder border-4 align-items-center btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</tbody>
			</table>
		</form>
			<%
			}
				}
			break;
				}
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>