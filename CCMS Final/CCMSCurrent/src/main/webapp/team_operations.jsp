<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
  	String url = "jdbc:mysql://localhost:3306/ccms";
	String user = "root";
	String pwd = "";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	String session_Club_Id = session.getAttribute("Club_Id").toString();
	
	String delete_id = request.getParameter("del_id");
	String add_id = request.getParameter("add_id");
	String del_member_id = request.getParameter("del_member_id");
	try
	{
		Statement s = con.createStatement();
		String set_status = "UPDATE member SET Status = 'M' WHERE Member_Id = '"+ delete_id +"' ";
		s.executeUpdate(set_status);
		response.sendRedirect("all_cmembers.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	
	try
	{
		// temp status....perform with team table
		Statement s = con.createStatement();
		String set_status = "UPDATE member SET Status = 'T' WHERE Member_Id = '"+ add_id +"' ";
		s.executeUpdate(set_status);
		response.sendRedirect("all_cmembers.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}

	try
	{
		// temp status....perform with team table
		Statement s = con.createStatement();
		String set_status = "DELETE FROM member WHERE Member_Id = '"+ del_member_id +"' ";
		s.executeUpdate(set_status);
		response.sendRedirect("all_cmembers.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	
	
  %>
	