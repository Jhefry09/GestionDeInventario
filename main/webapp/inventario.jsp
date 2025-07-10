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
	%>
	<table  class="table table-dark table-responsive table-striped table-hover ">
		<thead>
			<tr class=" text-center fs2 align-middle align-items-center">
				<th>
				<select class="form-select form-select-lg text-center bg-dark text-light border-3">
				<option selected value="Almacenamiento">ALMACENAMIENTO</option>
				<option value="Disipador">DISIPADORES</option>
				<option value="Fuente">FUENTES</option>
				<option value="Intel">PROCESADORES INTEL</option>
				<option value="AmdPro">AMD PROCESADOR</option>
				<option value="AmdGra">AMD GRAFICAS</option>
				<option value="Nvidia">NVIDIA GRAFICAS</option>
				<option value="Perifericos">PERIFERICOS</option>
				<option value="PlacaBase">PLACA BASE</option>
				<option value="Ram">RAM</option>
				</select>
			<th>
			</tr>
		</thead>
		</table>
		<table class="table table-dark table-striped table-hover table-responsive table-bordered text-center animate__animated animate__fadeInDown animate__delay-1s table-responsive">
		<thead>
				<%
				switch (seleccion){
				case "Almacenamiento":
				List<AlmacenamientoDto> datos = (List<AlmacenamientoDto>) request.getAttribute("datos");
				if (datos != null) {
				%>
			<tr class="">
			<th scope="col">ID</th>
			<th scope="col">DESCRIPCION</th>
			<th scope="col">CAPACIDAD</th>
			<th scope="col">TB/GB</th>
			<th scope="col">TIPO</th>
			<th scope="col">PRECIO</th>
			<th scope="col">STOCK</th>
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
				<td><%=dat.getPrecio_almace_dto()%></td>
				<td><%=dat.getStock_almace_dto()%></td>
			</tr>
			<%
			}
				}
			break;			
			case "Disipador":
				List<DisipadorDto> datos = (List<DisipadorDto>) request.getAttribute("datos");
			}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>