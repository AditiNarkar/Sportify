<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>

<%

String url = "jdbc:mysql://localhost:3306/ccms";
String user = "root";
String pwd = "";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, pwd);

String id = request.getParameter("id");
String c = request.getParameter("clubid");
System.out.println(id);
System.out.println(c);

	Statement del = con.createStatement();
	String del_mem = "DELETE FROM member WHERE Member_Id = '"+ id +"' ";
	del.executeUpdate(del_mem);
	response.sendRedirect("admin_view_club.jsp?id="+c);

%>

