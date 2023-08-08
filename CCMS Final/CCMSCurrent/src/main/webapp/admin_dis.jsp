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
 String id = request.getParameter("id");
 
 try
 {
 	Statement dis = con.createStatement();
 	String p = "UPDATE clubs SET Status = 'Disapproved' WHERE Club_Id =  '"+ id +"'";
 	dis.executeUpdate(p);
 	response.sendRedirect("admin_all_clubs.jsp");
 	
 }
 catch(Exception e)
 {
 	System.out.println(e);
 }
 
%>
 
 