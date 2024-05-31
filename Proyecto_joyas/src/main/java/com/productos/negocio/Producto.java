package com.productos.negocio;

import java.io.File;
import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.productos.datos.Conexion;

public class Producto {
	int id;
	int id_cat;
	String nombre;
	int cantidad;
	double precio;
	Byte foto;


	public Producto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Producto(int id, String nombre, int cantidad, double precio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.precio = precio;
	}


	public String consultarTodo()
	{
		String sql="SELECT * FROM tb_producto ORDER BY id_pr";
		Conexion con=new Conexion();
		String tabla="<table class='table'><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		if (rs == null) {
			return "Error: la consulta SQL no devolvió ningún resultado.";
		}
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getInt(1)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getInt(4)+"</td>"
						+ "<td>"+rs.getDouble(5)+"</td>"
						+ "<td> <a href= BuscarProducto.jsp?cod=" + rs.getInt(1) + ">Modificar</a></td>"
						+ "<td> <a href= EliminarProducto.jsp?cod=" + rs.getInt(1) + " onclick=\"confirmarEliminacion(event)\">Eliminar</a></td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	
	public String verProductos()
	{
		String sql="SELECT * FROM tb_producto ORDER BY id_pr";
		Conexion con=new Conexion();
		String tabla="<table class='table'><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		if (rs == null) {
			return "Error: la consulta SQL no devolvió ningún resultado.";
		}
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getInt(1)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getInt(4)+"</td>"
						+ "<td>"+rs.getDouble(5)+"</td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}


	public String buscarProductoCategoria(int cat)
	{
		String sentencia="SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table class=\"table\"><th>Producto</th><th>Precio</th>";
		try
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				resultado+="<tr><td>"+ rs.getString(1)+"</td>"
						+ "<td>"+rs.getDouble(2)+"</td></tr>";
			}
			resultado+="</table>";
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return resultado;
	}

	public String ingresarProducto(int id, int cat,String nombre, int cantidad, double precio)
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_producto (id_pr,id_cat,"
				+ "nombre_pr,cantidad_pr,precio_pr,foto_pr) "
				+ "VALUES(?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id);
			pr.setInt(2,cat);
			pr.setString(3, nombre);
			pr.setInt(4, cantidad);
			pr.setDouble(5, precio);
			pr.setBinaryStream(6,null);
			if(pr.executeUpdate()==1)
			{
				result="Inserción correcta";
			}
			else
			{
				result="Error en inserción";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
		}
		finally
		{
			try
			{
				pr.close();
				con.getConexion().close();
			}
			catch(Exception ex)
			{
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}

	public void CosulEditarProductos(int cod) {
		Conexion con=new Conexion();
		ResultSet rs = null;

		String sql = "SELECT id_pr,id_cat,nombre_pr,cantidad_pr,precio_pr FROM tb_producto WHERE id_pr='"
				+ cod + "'";

		try {
			rs = con.Consulta(sql);
			if (rs == null) {
				System.out.println("Error: la consulta SQL no devolvió ningún resultado."); 
			}
			while (rs.next()) {
				setId(rs.getInt(1));
				setId_cat(rs.getInt(2));
				setNombre(rs.getString(3));
				setCantidad(rs.getInt(4));
				setPrecio(rs.getDouble(5));
			}
		}catch (Exception e) {

		}
	}

	public boolean ModificarProducto(Producto p) {
		boolean agregado = false;
		Conexion con = new Conexion();
		String sql = "UPDATE tb_producto SET nombre_pr='"+p.getNombre()+"' "
				+ " , cantidad_pr = "+p.getCantidad()+" , precio_pr = "+p.getPrecio()
				+" WHERE id_pr = "+p.getId()+";";
		System.out.println(p.getId());
		System.out.println(p.getCantidad());
		System.out.println(p.getPrecio());
		System.out.println(p.getNombre());

		try {
			con.Ejecutar(sql);
			agregado = true;
		}catch (Exception e) {
			agregado = false;
		}

		if (agregado == false) {
			System.out.println("No se actualizo");
		}
		return agregado;
	}

	public boolean EliminarProducto (int cod) {
		boolean eliminado = false;
		Conexion con = new Conexion();
		String sql = "DELETE FROM tb_producto WHERE id_pr = '"+cod+"';";

		try {
			con.Ejecutar(sql);
			eliminado = true;
		}catch (Exception e) {
			eliminado = false;
		}
		return eliminado;
	}

	public String consultarProductos()
	{
		String sql="SELECT * FROM tb_producto GROUP BY id_pr order by id_pr asc;";
		Conexion con=new Conexion();
		String tabla="<table class=table table-striped><th>Id Producto</th><th>Producto</th><th>Añadir al carrito</th><th>Precio Unitario</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr>"
						+"<td>"+rs.getInt(1)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td><input type=checkbox name=productos value="+rs.getInt(1)+"></td>"
						+"<td>"+rs.getInt(5)+"</td>"
								+ "</tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	
	public List<Integer> suma(List<String> l) {
		if(l==null || l.isEmpty()){
			System.out.println("La lista lsuma está vacía");
			 return new ArrayList<>();
		}

		String sql="SELECT id_pr, precio_pr FROM tb_producto order by id_pr asc;";
		Conexion con=new Conexion();
		ResultSet rs=null;
		List<String> id=new ArrayList<>();
		List<Integer> resultado=new ArrayList<>();
		int count = 0;
		
			
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				id.add(String.valueOf(rs.getInt(1)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		
		if(id.isEmpty()){
			System.out.println("La lista l está vacía");
			 return new ArrayList<>();
		}
			
		for(String a:id) {
			count = 0;
			for(String b:l) {
				if(a.equals(b)) {
					count++;
				}
			}  
			System.out.println("El número " + a + " aparece " + count + " veces en la lista l.");
			resultado.add(count);
		}
		
		System.out.println("sumaaa");
		System.out.println(id);
		System.out.println(l);
		System.out.println(resultado);
		return resultado;
	}
	
	public List<Double>  precio(List<Integer> l) {
		if(l==null || l.isEmpty()){
			System.out.println("La lista lprecio está vacía");
			 return new ArrayList<>();
		}

		String sql="SELECT id_pr, precio_pr FROM tb_producto order by id_pr asc;";
		Conexion con=new Conexion();
		ResultSet rs=null;
		List<Double> precio=new ArrayList<>();
		List<Double> preciofinal=new ArrayList<>();
		List<Double> preciof=new ArrayList<>();
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				precio.add(rs.getDouble(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		if(precio.isEmpty() || (l.size() != precio.size())){
			System.out.println("La lista l está vacía o listas no se pueden multiplicar");
			 return new ArrayList<>();
		}

		for(int i = 0; i < precio.size(); i++) {
			 preciofinal.add(l.get(i) * precio.get(i));
		 }
		
		for(Double a:preciofinal) {
			if(a!= 0.0) {
				preciof.add(a);
			}
		}
		System.out.println(preciofinal);
		System.out.println(preciof);
		return preciof;
	}
	
	public double precioTotal(List<Double> pp) {
		double total = 0.0;
		for(Double x:pp) {
			total += x;
		}
		return total;
	}
	
	public List<String> elegidos(List<String> lista) {
		if(lista==null || lista.isEmpty()) {
			System.out.println("Lista inicial vacia");
			 return new ArrayList<>();
		}
		Set<String> set = lista.stream().collect(Collectors.toSet());
		List<String> productos = new ArrayList<>(set);
		System.out.println(productos);
		return productos;	
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getId_cat() {
		return id_cat;
	}


	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public int getCantidad() {
		return cantidad;
	}


	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}


	public Byte getFoto() {
		return foto;
	}


	public void setFoto(Byte foto) {
		this.foto = foto;
	}

}
