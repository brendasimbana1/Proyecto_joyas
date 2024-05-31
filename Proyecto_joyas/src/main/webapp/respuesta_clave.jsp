<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
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

Usuario u = new Usuario();
String nueva= request.getParameter("nueva_c");
String repetir= request.getParameter("repetir_c");
String antigua= request.getParameter("anterior_c");
boolean respuesta = u.verificarClave(antigua);
boolean r = u.clave(nueva, repetir);
String resultado="";
if (respuesta && r) {
	resultado=u.cambioClave(usuario, nueva);
}else{

%>
<jsp:forward page="menu.jsp">
		<jsp:param name="error" value="clave incorrecta." />
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
	<%=resultado%>
	<jsp:forward page="login.jsp">
		<jsp:param name="error" value="No se registro user." />
	</jsp:forward>
</body>
</html>
<%
}
%>