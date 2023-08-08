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

	String mem_id = request.getParameter("mem_id");
	String swapped_mem_id = request.getParameter("swapped_id");
	String ch_id = "";
	 ch_id = request.getParameter("ch_id");

	PreparedStatement st = con.prepareStatement("UPDATE member SET Status = ? WHERE Member_Id = ?");
	st.setString(1, "TS");
	st.setString(2, mem_id);
	st.executeUpdate();
	
	PreparedStatement st1 = con.prepareStatement("UPDATE member SET Status = ? WHERE Member_Id = ?");
	st1.setString(1, "MS");
	st1.setString(2, swapped_mem_id);
	st1.executeUpdate();
	
	if(ch_id == null)
	{
		response.sendRedirect("challenge.jsp");
	}
	else
	{
		 response.sendRedirect("challenge2_accept.jsp?chid=" + ch_id);
	}

%>