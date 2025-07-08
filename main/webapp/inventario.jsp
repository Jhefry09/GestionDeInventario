<%@page import="entidadDto.AlmacenamientoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<AlmacenamientoDto> datos = (List<AlmacenamientoDto>) request.getAttribute("datos");
%>
<%
if(datos != null){
	for (AlmacenamientoDto dat : datos){
%>
<table border="1">
<tr>
<td><%=dat.getId_almace_dto()%></td>
<td><%=dat.getDesc_almace_dto() %></td>
<td><%=dat.getCapacidad_almace_dto() %></td>
<td><%=dat.getUnidades_almace_dto() %></td>
<td><%=dat.getTipo_almace_dto() %></td>
<td><%=dat.getPrecio_almace_dto() %></td>
<td><%=dat.getStock_almace_dto() %></td>
<%
	}}
%>
</table>
</body>
</html>