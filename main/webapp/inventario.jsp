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
<title>Insert title here</title>
</head>
<body class="bg-dark">
<div class="table table-responsive">
	<%
	String seleccion = (String) request.getAttribute("selec");
	String nom = (String) request.getAttribute("nombre");
	String tipoSelec = (String) request.getAttribute("tipoSelec");
	String nombreSelec = (String) request.getAttribute("nombreSelec");
	%>
	<div class="row d-flex align-items-center justify-content-center mx-2">
			<div class="col">
				<form action="ServletInventario" id="selector"
					class=" d-flex align-items-center">
					<input type="hidden" name="seleccion" value="Listar"> <select
						name="inventario" id="formulario"
						class="form-select form-select-lg text-center fs-4 fw-bolder bg-dark text-light border-3"
						onchange="document.getElementById('selector').submit();">
						<option value="<%=seleccion%>"><%=nom%></option>
						<option value="ALMACENAMIENTO">ALMACENAMIENTO</option>
						<option value="DISIPADORES">DISIPADORES</option>
						<option value="FUENTES">FUENTES DE ENERGIA</option>
						<option value="Intel">PROCESADORES INTEL</option>
						<option value="AmdPro">PROCESADORES AMD</option>
						<option value="AmdGra">GRAFICAS AMD</option>
						<option value="Nvidia">GRAFICAS NVIDIA</option>
						<option value="PERIFERICOS">PERIFERICOS</option>
						<option value="PlacaBase">PLACAS BASE</option>
						<option value="RAM">RAM</option>
					</select>
				</form>
			</div>
			<div class="col">
				<form action="ServletInventario" class=" d-flex gap-2 align-items-center">
					<input type="hidden" name="seleccion" value="Buscar">
					<input type="hidden" name="inventario" value="<%=seleccion%>"> <select
						name="tipoBuscar" class="form-select text-center fw-bolder bg-dark text-light border-3">
						<option value="<%=tipoSelec %>"><%= nombreSelec%></option>
						<option value="nom">DESCRIPCION</option>
						<option value="id">ID</option>
						<option value="pre">PRECIO</option>
					</select> <input type="text" name="txtBuscar" placeholder="DATOS A BUSCAR"
						class="form-control form-sm  text-center bg-dark text-light border-3">
					<button type="submit"
						class="btn btn-outline-light btn-sm fw-bolder border-4 d-flex align-items-center"><i class="bi bi-search"></i> BUSCAR</button>
				</form>
			</div>
		</div>
		<table class="table table-dark table-striped table-hover table-responsive table-bordered text-center animate__animated animate__fadeInDown animate__delay-0.5s table-responsive">
				<%
				switch (seleccion){
				case "ALMACENAMIENTO":{
				List<AlmacenamientoDto> datos = (List<AlmacenamientoDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">CAPACIDAD</th>
			<th scope="col">TB/GB</th>
			<th scope="col">TIPO</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (AlmacenamientoDto dat : datos) {
				%>
				<td scope="row">#<%=dat.getId_almace_dto()%></td>
				<td><%=dat.getDesc_almace_dto()%></td>
				<td><%=dat.getCapacidad_almace_dto()%></td>
				<td><%=dat.getUnidades_almace_dto()%></td>
				<td><%=dat.getTipo_almace_dto()%></td>
				<td>S/.<%=dat.getPrecio_almace_dto()%></td>
				<td><%=dat.getStock_almace_dto()%></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="idEditar" value="<%=dat.getId_almace_dto()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Almacenamiento">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="codigo"value="<%=dat.getId_almace_dto()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Almacenamiento">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "DISIPADORES":{
				List<DisipadorDto> datos = (List<DisipadorDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">TIPO</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDI</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (DisipadorDto dat : datos) {
				%>
				<td scope="row">#<%=dat.getId_disipador_tdo() %></td>
				<td><%=dat.getDes_disipador_tdo() %></td>
				<td><%=dat.getTipo_disipador_tdo() %></td>
				<td>S/.<%=dat.getPrecio_disipador_tdo() %></td>
				<td><%=dat.getStock_disipador_tdo() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="idEditar" value="<%=dat.getId_disipador_tdo()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Disipador">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="codigo"value="<%=dat.getId_disipador_tdo()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Disipador">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "FUENTES":{
				List<FuenteDto> datos = (List<FuenteDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">CAPACIDAD</th>
			<th scope="col">CERTIFICACION</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (FuenteDto dat : datos) {
				%>
				<td>#<%=dat.getId_fuente() %></td>
				<td><%=dat.getDescripcion_fuente() %></td>
				<td><%=dat.getWatts_fuente()%>W</td>
				<td><%=dat.getCertificacion_fuente() %></td>
				<td>S/.<%=dat.getPrecio_fuente() %></td>
				<td><%=dat.getStock_fuente() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="idEditar" value="<%=dat.getId_fuente()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Fuente_de_Energia">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Fuente_de_Energia">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "Intel":{
				List<IntelProcesadorDto> datos = (List<IntelProcesadorDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">GAMA</th>
			<th scope="col">GENERACION</th>
			<th scope="col">NOMBRE CLAVE</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (IntelProcesadorDto dat : datos) {
				%>
				<td>#<%=dat.getId_intel() %></td>
				<td><%=dat.getGama_intel() %></td>
				<td><%=dat.getGeneracion_intel()%></td>
				<td><%=dat.getNombre_clave_intel() %></td>
				<td>S/.<%=dat.getPrecio_intel() %></td>
				<td><%=dat.getStock_intel() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="idEditar" value="<%=dat.getId_intel()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.ProcesadorIntel">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="codigo"value="<%=dat.getId_intel()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.ProcesadorIntel">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "AmdPro":{
				List<AmdProcesadorDto> datos = (List<AmdProcesadorDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">GAMA</th>
			<th scope="col">GENERACION</th>
			<th scope="col">NOMBRE CLAVE</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (AmdProcesadorDto dat : datos) {
				%>
				<td>#<%=dat.getId_amd_procesador() %></td>
				<td><%=dat.getGama_amd_procesador() %></td>
				<td><%=dat.getGeneracion_amd_procesador()%></td>
				<td><%=dat.getNombre_clave_amd_procesador() %></td>
				<td>S/.<%=dat.getPrecio_amd_procesador() %></td>
				<td><%=dat.getStock_amd_procesador() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="idEditar" value="<%=dat.getId_amd_procesador()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.ProcesadorAMD">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="codigo"value="<%=dat.getId_amd_procesador()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.ProcesadorAMD">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "AmdGra":{
				List<AmdGraficaDto> datos = (List<AmdGraficaDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">GENERACION</th>
			<th scope="col">GAMA</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (AmdGraficaDto dat : datos) {
				%>
				<td>#<%=dat.getId_amd_grafica() %></td>
				<td><%=dat.getDescripcion_amd_grafica() %></td>
				<td><%=dat.getGeneracion_amd_grafica()%></td>
				<td><%=dat.getGama_amd_grafica() %></td>
				<td>S/.<%=dat.getPrecio_amd_grafica() %></td>
				<td><%=dat.getStock_amd_grafica() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="idEditar" value="<%=dat.getId_amd_grafica()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Grafica_amd">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="codigo"value="<%=dat.getId_amd_grafica()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Grafica_amd">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "Nvidia":{
				List<NvidiaGraficaDto> datos = (List<NvidiaGraficaDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">GENERACION</th>
			<th scope="col">GAMA</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (NvidiaGraficaDto dat : datos) {
				%>
				<td>#<%=dat.getId_nvidia_grafica() %></td>
				<td><%=dat.getDescripcion_nvidia_grafica() %></td>
				<td><%=dat.getGeneracion_nvidia_grafica()%></td>
				<td><%=dat.getGama_nvidia_grafica() %></td>
				<td>S/.<%=dat.getPrecio_nvidia_grafica() %></td>
				<td><%=dat.getStock_nvidia_grafica() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Grafica_nvidia">
				<input type="hidden" name="idEditar" value="<%=dat.getId_nvidia_grafica()%>">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="codigo"value="<%=dat.getId_nvidia_grafica()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Grafica_nvidia">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "PERIFERICOS":{
				List<PerifericosDto> datos = (List<PerifericosDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">TIPO</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (PerifericosDto dat : datos) {
				%>
				<td>#<%=dat.getId_perifericos() %></td>
				<td><%=dat.getDescripcion_perifericos() %></td>
				<td><%=dat.getTipo_perifericos() %></td>
				<td>S/.<%=dat.getPrecio_perifericos() %></td>
				<td><%=dat.getStock_perifericos() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Perifericos">
				<input type="hidden" name="idEditar" value="<%=dat.getId_perifericos()%>">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Perifericos">
				<input type="hidden" name="codigo"value="<%=dat.getId_perifericos()%>">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "PlacaBase":{
				List<PlacaBaseDto> datos = (List<PlacaBaseDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">DDR4/DDR5</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (PlacaBaseDto dat : datos) {
				%>
				<td>#<%=dat.getId_placa_base() %></td>
				<td><%=dat.getDescripcion_placa_base() %></td>
				<td><%=dat.getRam_generacion_placa_base() %></td>
				<td>S/.<%=dat.getPrecio_placa_base() %></td>
				<td><%=dat.getStock_placa_base() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="idEditar" value="<%=dat.getId_placa_base()%>">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.PlacaBase">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.PlacaBase">
				<input type="hidden" name="codigo"value="<%=dat.getId_placa_base()%>">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
			<%
			}
				}
			break;
				}
				case "RAM":{
				List<RamDto> datos = (List<RamDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
		<thead>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">CAPACIDAD</th>
			<th scope="col">DDR4/DDR5</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
			<th scope="col">EDITAR</th>
			</tr>
		</thead>
		<tbody class="text-center align-middle align-items-center table-bordered">		
			<tr>
				<% 
					for (RamDto dat : datos) {
				%>
				<td>#<%=dat.getId_ram() %></td>
				<td><%=dat.getDescripcion_ram() %></td>
				<td><%=dat.getCapacidad_ram() %></td>
				<td><%=dat.getRam_generacion_ram() %></td>
				<td>S/.<%=dat.getPrecio_ram() %></td>
				<td><%=dat.getStock_ram() %></td>
				<td class="gap-2 d-flex align-items-center justify-content-center" >
				<form action="ServletInventario">
				<input type="hidden" name="seleccion" value="BtnEditar">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Ram">
				<input type="hidden" name="idEditar" value="<%=dat.getId_ram()%>">
				<button class="btn btn-outline-light btn-lg"><i class="bi bi-pencil-square"></i></button>
				</form>
				<form action="ServletEmpleado">
				<input type="hidden" name="seleccion" value="BtnBorrar">
				<input type="hidden" name="NomTabla" value="GestionDeInventario.Ram">
				<input type="hidden" name="codigo" value="<%=dat.getId_ram()%>">
				<button class="btn btn-outline-light btn-lg" ><i class="bi bi-trash-fill"></i></button>
				</form>
				</td>
			</tr>
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