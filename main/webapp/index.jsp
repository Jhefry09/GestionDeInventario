<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
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
<title>LOGIN DE ADMINISTRADORES</title>
</head>
<body class="bg-dark animate__animated animate__lightSpeedInRight">
	<%
	String msj_error = (String) request.getAttribute("error");
	String sin_error = "";
	if (msj_error != null) {
		sin_error = msj_error;
	}
	%>
	<form action="ServletAdministrador">
			<p class="text-white text-center fs-1 fw-bolder">LOGIN DE ADMINISTRADORES</p>
			<table border="1" class="table table-dark table-striped table-responsive">
				<tr>
					<td><input type="text" class="form-control animate__delay-1s bg-dark text-white border-4" placeholder="INGRESE EL USUARIO" name="txtUsuario" required></td>
				</tr>
				<tr>
					<td><input type="password" class="form-control bg-dark text-white border-4" placeholder="INGRESE LA CONTRASEÑA" name="txtClave" required></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit"
						value="Enviar" class="btn btn-outline-light btn-lg d-grid mx-auto col-6"></td>
				</tr>
			</table>
			<p class="text-danger text-center fs-3 fw-bold" ><%=sin_error %></p>
	</form>
</body>
</html>

