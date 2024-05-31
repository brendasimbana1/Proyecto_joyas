package com.productos.seguridad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.productos.datos.Conexion;

public class Usuario {
	private String nombre;
	private String direccion;
	private String login;
	private String clave;
	private Integer perfil;
	
	public boolean verificarClave(String nclave) {
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuario where clave_us='"+nclave+"';";
		//System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs==null) {
				System.out.println("No vale la consulta");
			}
			if(rs.next())
			{
				respuesta=true;
				this.setClave(nclave);
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	
	public boolean clave(String n, String r) {
		boolean respuesta=false;
		if (n.equals(r)) {
			respuesta=true;
		}else {
			respuesta=false;
		}
		return respuesta;
	}

	public String mostrarPerfil()
	{
		String combo="<select name=cmbPerfil>";
		String sql="SELECT * FROM tb_perfil";
		ResultSet rs=null;
		Conexion con=new Conexion();	
		try
		{
			rs=con.Consulta(sql);
			if (rs==null) {
				return "Error: La consulta SQL no devolvió resultado";
			}
			while(rs.next())
			{
				combo+="<option value="+rs.getInt(1)+ ">"+rs.getString(2)+"</option>";
			}
			combo+="</select>";
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return combo;
	}
	
	public boolean verificarUsuario(String nlogin, String nclave)
	{
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuario where login_us='"+nlogin+
				"' and clave_us='"+nclave+"';";
		//System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs==null) {
				System.out.println("No vale la consulta");
			}
			if(rs.next())
			{
				respuesta=true;
				this.setLogin(nlogin);
				this.setClave(nclave);
				this.setPerfil(rs.getInt(6));
				this.setNombre(rs.getString(2));
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
			System.out.println("Usuario");
		}
		return respuesta;
	}
	
	public String registroCliente(int id, String nombre, String direccion, String user, String clave)
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_us,nombre_us,"
				+ "direccion_us,login_us,clave_us,id_per) "
				+ "VALUES(?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id);
			pr.setString(2,nombre);
			pr.setString(3, direccion);
			pr.setString(4, user);
			pr.setString(5, clave);
			pr.setInt(6, 2);   //Ingresa solo usuarios tipo 2: cliente
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
	
	public String registroVendedor(int id, String nombre, String direccion, int perfil)
	{
		String result="";
		String clave="654321";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_us,nombre_us,"
				+ "direccion_us,login_us,clave_us,id_per) "
				+ "VALUES(?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id);
			pr.setString(2,nombre);
			pr.setString(3, direccion);
			pr.setString(4, direccion);
			pr.setString(5, clave);
			pr.setInt(6, perfil);   
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
	
	public String cambioClave(String nombre, String nueva)
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		
		String sql="Update tb_usuario set clave_us= '"+ nueva+"' where nombre_us= '"+nombre+"' ";
		System.out.println(sql);
		try{
			pr=con.getConexion().prepareStatement(sql);
			if(pr.executeUpdate()==1)
			{
				result="Actualización clave correcta";
			}
			else
			{
				result="Actualización error";
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
	public int id_cliente() {

		String sql="SELECT id_us FROM tb_usuario order by id_us asc;";
		Conexion con=new Conexion();
		ResultSet rs=null;
		List<Integer> id=new ArrayList<>();
		//List<Integer> resultado=new ArrayList<>();
		int mayor = 0;	
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				id.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		
		if(id.isEmpty()){
			System.out.println("La lista l está vacía");
			 return 0;
		}
			
		mayor=Collections.max(id)+1;
		return mayor;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public Integer getPerfil() {
		return perfil;
	}

	public void setPerfil(Integer perfil) {
		this.perfil = perfil;
	}
	
	
}
