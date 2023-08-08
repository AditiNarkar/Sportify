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
	
	String mem_email = session.getAttribute("Email").toString();
	
	String color = request.getParameter("inputcolor");
	String pet = request.getParameter("inputpet");
	
	
	PreparedStatement pst = con.prepareStatement("UPDATE member SET Color = ?, Pet = ? WHERE Email = ?");
	pst.setString(1, color);
	pst.setString(2, pet);
	pst.setString(3, mem_email);
	pst.executeUpdate();
	
	response.sendRedirect("login.jsp");
  %>