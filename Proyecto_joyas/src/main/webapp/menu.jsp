<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
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
	<%
	String usuario;
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
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
	<div class="privado"><h2>Sitio Privado</h2></div>
	
	<h4>Bienvenido
		<%
	out.println(usuario);
	%>
	</h4>
	<%
	Pagina pag = new Pagina();
	String menu = pag.mostrarMenu(perfil);
	out.print(menu);
	}
	%>
	
	<footer class="footer">
		<ul>
			<a href="#">Facebook</a>
			<a href="#">Instagram</a>
			<a href="#">X</a>
		</ul>
	</footer>
</body>
</html>