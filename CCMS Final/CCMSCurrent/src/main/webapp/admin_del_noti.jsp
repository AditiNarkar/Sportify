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

String table=request.getParameter("who");
String noti=request.getParameter("noti_no");
try{
Statement st = con.createStatement();
st.executeUpdate("DELETE FROM notifications_" + table + " WHERE Notification_No = " + Integer.parseInt(noti));
}
catch(Exception e){
	System.out.println(e);
}
response.sendRedirect("admin_notifications.jsp");
%>