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
		<form class="form_inicio" action="verificarLogin.jsp" method="post">
			<h2>Inicio de sesión</h2>
			<div class="username">
				<label for="email">Ingrese su usuario:</label> <input id="usuario"
					type="text" placeholder="usuario" name="usuario" required>
			</div>
			<div class="username">
				<label for="clave">Ingrese su contraseña:</label> <input
					id="clave" type="password" placeholder="Contraseña"
					name="clave" required>
			</div>

			<input class="boton_enviar" type="submit" value="Iniciar">
		<div class="registrarse">
			<label>¿No tienes cuenta?</label> <a href="registrar.jsp">Registrarse</a>
		</div>
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