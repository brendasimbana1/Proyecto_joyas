<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.negocio.*"%>
<%@ page
	import="java.util.List, java.text.DecimalFormat, java.util.ArrayList, java.sql.SQLException"%>
<%
String usuario;
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null || (Integer) sesion.getAttribute("perfil") != 2) //Se verifica si existe la variable
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
<html>
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
				<a href="menu.jsp">Men�</a>
				<a href="cerrarSesion.jsp">Cerrar Sesi�n</a>
			</ul>
		</nav>
	</section>
	<form name="listadoProductos" action="carrito.jsp">
		<%
		Producto producto = new Producto();
		String tabla = producto.consultarProductos();
		out.print(tabla);
		%>
		<br>
		<div>
			<input class="boton" type="submit" name="button" id="button"
				value="Enviar" />
		</div>
	</form>
	<h2>Mi carrito</h2>
	<ul>
		<%
		DecimalFormat df = new DecimalFormat("#.00");
		List<String> listaElementos = (List<String>) session.getAttribute("carrito");
		List<Integer> listacomp = new ArrayList<>();
		List<Double> precio = new ArrayList<>();
		List<String> ids = new ArrayList<>();
		if (listaElementos == null) {
			listaElementos = new ArrayList<String>();
			session.setAttribute("carrito", listaElementos);
		}

		String[] elementos = request.getParameterValues("productos");
		int i = 0;
		if (elementos != null) {
			while (i < elementos.length) {
				listaElementos.add(elementos[i]);
				i++;
			}
		}
		for (String tmp : listaElementos) {
			out.println("<li>" + tmp + "</li>");
		}
		listacomp = producto.suma(listaElementos); //devuelve productos elegidos lista
		precio = producto.precio(listacomp);

		ids = producto.elegidos(listaElementos);
		%>
	</ul>
	<main>
		<table class="factura">
			<tr>
				<th>Id Producto</th>
				<th>Precio total</th>
			</tr>
			<%
			for (int j = 0; j < ids.size(); j++) {
			%>
			<tr>
				<td><%=ids.get(j)%></td>
				<td><%=df.format(precio.get(j))%></td>
			</tr>
			<%
			}
			%>
		</table>
	</main>
	<div>
			<label>Total de la compra: <%=df.format(producto.precioTotal(precio))%>
				$
			</label>
		</div>
		<br>
		<div class="contenedor">
			<form action="borrarCarrito.jsp" method="post">
				<input class="boton" type="submit" value="Borrar Carrito">
			</form>
		</div>
		<div class="contenedor">
			<form action="cerrarSesion.jsp" method="post">
				<input class="boton" type="submit" value="Cerrar Sesi�n">
			</form>
		</div>
	<br>
	<br>
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