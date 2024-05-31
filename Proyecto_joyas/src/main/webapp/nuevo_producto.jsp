<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.negocio.*"%>
<%
Categoria categoria = new Categoria();
String combo = categoria.mostrarCategoria();
%>
<%
String usuario;
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null || (Integer) sesion.getAttribute("perfil") != 1) //Se verifica si existe la variable
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
				<a href="menu.jsp">Menú</a>
				<a href="nuevo_producto.jsp">Nuevo producto</a>
				<a href="consulta.jsp">Editar productos</a>
				<a href="cerrarSesion.jsp">Cerrar Sesión</a>
			</ul>
		</nav>
	</section>
	<main>
		<form class="form_inicio" action="respuesta_producto.jsp"
			method="post">

			<h2>Nuevo Producto</h2>
			<div class="username">
				<label> Id: </label> <input type="number"
					placeholder="Ingrese el id" name="Id" required>
			</div>
			<div class="username">
				<label> Categoria: </label>
				<%=combo%>
			</div>
			<div class="username">
				<label>Nombre: </label> <input type="text"
					placeholder="Ingrese el nombre" name="Nombre" required>
			</div>
			<div class="username">
				<label> Cantidad: </label> <input type="number"
					placeholder="Ingrese la cantidad" name="Cantidad" min="5" required>
			</div>
			<div class="username">
				<label> Precio: </label> <input type="number" step="0.01"
					placeholder="Ingrese el precio" name="Precio" required>
			</div>
			<div class="username">
				<label> Foto: </label> <input type="File" name="Foto"
					accept=".jpg, .png, .jpeg" required>
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