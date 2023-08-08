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
	
	String email 	= request.getParameter("email");
	String contact 	= request.getParameter("contact");
	String color 	= request.getParameter("color");
	String pet		= request.getParameter("pet");
	String password = request.getParameter("pwd");
	
	PreparedStatement pst = con.prepareStatement("SELECT Member_Id FROM member WHERE Email = ? AND Contact = ? AND Color = ? AND Pet = ?");
	pst.setString(1, email);
	pst.setString(2, contact);
	pst.setString(3, color);
	pst.setString(4, pet);
	
	ResultSet rs = pst.executeQuery();
	if(rs.next())
	{
		PreparedStatement pst1 = con.prepareStatement("UPDATE member SET Password = ? WHERE Member_Id = ? ");
		pst1.setString(1, password);
		pst1.setString(2, rs.getString(1));
		pst1.executeUpdate();
		
		response.sendRedirect("login.jsp");
		
	}
	else{
		response.sendRedirect("forgot_pwd.jsp?msg=error");
	}
	
  %>