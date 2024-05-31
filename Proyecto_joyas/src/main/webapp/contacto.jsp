<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customina</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<header class="titulo">
		<h1>Customina</h1>
	</header>
	<section class="navega">
		<nav>
			<ul>
				<a href="index.jsp">Inicio</a>
				<a href="contacto.jsp">Contacto</a>
				<a href="verProductos.jsp">Consulta productos</a>
				<a href="categorias.jsp">Consulta categorias</a>
				<a href="login.jsp">Iniciar sesión</a>
			</ul>
		</nav>
	</section>
	<main>
		<form class="form_inicio" action="respuesta.jsp" method="post">
			<h2>Contacto</h2>
			<div class="username">
				<label> Nombre: </label> <input type="text"
					placeholder="Ingrese su nombre" name="Nombre" required>
			</div>
			<div class="username">
				<label> Cedula: </label> <input type="number"
					placeholder="Ingrese su cedula" name="Cedula" maxlength="10"
					minlength="10" required>
			</div>
			<div class="username">
				<label for: estado>Estado Civil: </label> <select id="estado"
					name="estado">
					<option value="Soltero">Soltero</option>
					<option value="Casado">Casado</option>
					<option value="Divorciado">Divorciado</option>
					<option value="Viud@">Viudo</option>
				</select>
			</div>
			<div class="username">
				<label> Sexo: </label> <input type="radio" value="Masculino"
					name="Sexo">Masculino <input type="radio" value="Femenino"
					name="Sexo">Femenino
			</div>
			<div class="username">
				<label> Foto: </label> <input type="File" name="fileFoto"
					accept=".jpg, .png, .jpeg" required>
			</div>
			<div class="username">
				<label> Nacimiento: </label> <input type="date" name="Nacimiento"
					required>
			</div>
			<div class="username">
				<label> Color: </label> <input type="color" name="Color">
			</div>
			<input class="boton_enviar" type="submit">
		</form>
	</main>
	<footer class="footer">
		<ul>
			<a href="#">Facebook</a>
			<a href="#">Instagram</a>
			<a href="#">X</a>
		</ul>
	</footer>
</body>
</html>