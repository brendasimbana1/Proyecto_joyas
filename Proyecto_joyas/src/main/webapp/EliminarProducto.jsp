<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<%
	int cod = Integer.parseInt(request.getParameter("cod"));
	Producto p = new Producto();
	if(p.EliminarProducto(cod)){
		response.sendRedirect("consulta.jsp");
	}else{
		response.sendRedirect("index.jsp");
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