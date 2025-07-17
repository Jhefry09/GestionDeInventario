<%@page import="entidadDto.AlmacenamientoDto"%>
<%@page import="java.util.List"%>
<%@page import="entidad.Almacenamiento"%>
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
<body>
<%
String nomTabla = (String) request.getAttribute("nomTa");
switch (nomTabla){
	case "Almacenamiento": {
		List<AlmacenamientoDto> datos = (List<AlmacenamientoDto>) request.getAttribute("datos");
		System.out.println("paso por aqui x2");
	 
		for (AlmacenamientoDto dat : datos) {
		%>
		
			<label >#<%=dat.getId_almace_dto()%></label>
				<label><%=dat.getDesc_almace_dto()%></label>
				<label><%=dat.getCapacidad_almace_dto()%></label>
				<label><%=dat.getUnidades_almace_dto()%></label>
				<label><%=dat.getTipo_almace_dto()%></label>
				<label>S/.<%=dat.getPrecio_almace_dto()%></label>
				<label><%=dat.getStock_almace_dto()%></label>
<%
	break;
	}}
};
%>
</body>
</html>