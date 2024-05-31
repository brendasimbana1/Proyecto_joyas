<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.negocio.Producto"%>
<%
Producto producto = new Producto();
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
<script type="text/javascript">
	function confirmarEliminacion(event) {
		var confirmacion = confirm("¿Estás seguro que quieres eliminar?");
		if (!confirmacion) {
			event.preventDefault(); // Cancela la acción del enlace
		}
	}
</script>
</head>
<body>
	<header class="titulo">
		<h1>Customina</h1>
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
		<%=producto.consultarTodo()%>
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