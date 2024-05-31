<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*"%>
<%
Usuario user = new Usuario();
%>
<%
String usuario;
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null || (Integer) sesion.getAttribute("perfil") != 3) //3: si no es admin no se abre
{
	System.out.println("noUser");
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
} else {
usuario = (String) sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
int perfil = (Integer) sesion.getAttribute("perfil");
%>
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
		<h1>
			Customina<span> "Detalles que brillan"</span>
		</h1>
	</header>
	<section class="navega">
		<nav>
			<ul>
				<a href="index.jsp">Inicio</a>
				<a href="anadir.jsp">Añadir</a>
				<a href="login.jsp">Iniciar sesión</a>
			</ul>
		</nav>
	</section>
	<main>
		<form class="form_inicio" action="respuesta_vendedor.jsp"
			method="post">

			<h2>Nuevo Vendedor/Admin</h2>
			<div class="username">
				<label> Id: </label> <input type="number"
					placeholder="Ingrese el id" name="id_us" value="<%= user.id_cliente() %>" readonly>
			</div>
			<div class="username">
				<label>Nombre: </label> <input type="text"
					placeholder="Ingrese el nombre" name="nombre_us" required>
			</div>
			<div class="username">
				<label> Direccion de correo electrónico: </label> <input type="text"
					placeholder="Ingrese el e-mail" name="direccion_us" required>
			</div>
			<div class="username">
				<label> Perfil: </label> 
				<%= user.mostrarPerfil() %>
			</div>
			<div>
				<input class="boton_enviar" type="submit" value="Enviar">
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
<%
}
%>
