<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<%
	

	String id = request.getParameter("Id");
	String cat = request.getParameter("cmbCategoria");
	String nombre = request.getParameter("Nombre");
	String cantidad = request.getParameter("Cantidad");
	String precio= request.getParameter("Precio");
	Producto p = new Producto();
	
	String resultado = p.ingresarProducto(Integer.parseInt(id), Integer.parseInt(cat), 
			nombre, Integer.parseInt(cantidad), Double.parseDouble(precio));
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
		<h1>Customina<span> "Detalles que brillan"</span> </h1>
	</header>
	<section class="navega">
		<nav>
			<ul>
				<a href="menu.jsp">Menú</a>
				<a href="nueva_producto.jsp">Nuevo producto</a>
				<a href="cerrarSesion.jsp">Cerrar Sesión</a>
			</ul>
		</nav>
	</section>
	<main>
	<%=resultado%>
	<jsp:forward page="consulta.jsp">
		<jsp:param name="error" value="No se realizo." />
	</jsp:forward>
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