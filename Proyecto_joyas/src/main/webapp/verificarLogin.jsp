<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%
Usuario usuario = new Usuario();
String nlogin = request.getParameter("usuario");
String nclave = request.getParameter("clave");
HttpSession sesion = request.getSession(); //Se crea la variable de sesión
boolean respuesta = usuario.verificarUsuario(nlogin, nclave);
if (respuesta) {
	sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
	sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
	response.sendRedirect("menu.jsp"); //Se redirecciona a una página específica
	System.out.println(usuario.getNombre());
	System.out.println(usuario.getPerfil());
	System.out.println("fin verificar");
} else {
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error"
		value="Datos incorrectos.<br>Vuelva a intentarlo." />
</jsp:forward>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>