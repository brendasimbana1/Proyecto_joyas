<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<%
	int cod = Integer.parseInt(request.getParameter("editarId"));
	String nom = request.getParameter("editarNom");
	int cant = Integer.parseInt(request.getParameter("editarCant"));
	double prec = Double.parseDouble(request.getParameter("editarPrecio"));
	Producto p = new Producto(cod, nom, cant, prec);
	if(p.ModificarProducto(p)){
		response.sendRedirect("consulta.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customina</title>
</head>
<body>

</body>
</html>