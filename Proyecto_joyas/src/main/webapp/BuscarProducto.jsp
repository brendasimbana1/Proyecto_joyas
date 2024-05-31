<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<%
	Categoria categoria = new Categoria();
	String combo = categoria.mostrarCategoria();
	int cod = Integer.parseInt(request.getParameter("cod"));
	Producto p = new Producto();
	p.CosulEditarProductos(cod);
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
				<a href="index.jsp">Inicio</a>
				<a href="#">Acerca de</a>
				<a href="#">Productos</a>
				<a href="contacto.jsp">Contacto</a>
				<a href="consulta.jsp">Consulta productos</a>
				<a href="categorias.jsp">Consulta categorias</a>
				<a href="login.jsp">Iniciar sesión</a>
			</ul>
		</nav>
	</section>
	<main>
			<form class="form_inicio" action="EditarProducto.jsp" method="post">
			
				<h2>Editar Producto</h2>
				<div>
					<label> Codigo producto: </label> <input type="number"
						placeholder="Ingrese el id" name="editarId" value="<%= p.getId() %>" required>
						<%--<output name="MId" value="<%= p.getId() %>"><%= p.getId() %></output>--%>
				</div>
				<div>
					<label> Categoria: </label> 
					<output><%= p.getId_cat() %></output>
					
				</div>
				<div>
					<label>Descripcion: </label>
					<input type="text"
						placeholder="Ingrese el nombre" name="editarNom" value="<%= p.getNombre() %>" required>
				</div>
				<div>
					<label> Cantidad: </label> <input type="number"
						placeholder="Ingrese la cantidad" name="editarCant" value="<%= p.getCantidad() %>" required>
				</div>
				<div>
					<label> Precio: </label> <input type="number" step="0.01"
						placeholder="Ingrese el precio" name="editarPrecio" value="<%= p.getPrecio() %>" required>
				</div>
				<input type="submit" value="Actualizar">
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