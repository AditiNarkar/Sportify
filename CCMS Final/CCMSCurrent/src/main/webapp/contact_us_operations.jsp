<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar"%>

<%
String url = "jdbc:mysql://localhost:3306/ccms";
String user = "root";
String pwd = "";
String msg = "";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, pwd);

 // parameters
String name = request.getParameter("name");
String email= request.getParameter("email");
String subject = request.getParameter("subject");
String send_message = request.getParameter("message");
String desc = "";

//calender
Calendar cal = Calendar.getInstance();
SimpleDateFormat dateformat = new SimpleDateFormat("E, MMM dd yyyy");
SimpleDateFormat timeformat = new SimpleDateFormat("h:mm a");

	String coach_noti = "INSERT INTO notifications_admin(Description,Date,Time,Club_Id,Noti_Category,Sender_mail) VALUES (?,?,?,?,?,?)";
	PreparedStatement pst1 = con.prepareStatement(coach_noti);
	
	desc = subject + "<br>" + send_message + "<br>By " + name + ", " + email + "";
	System.out.println(desc);
	pst1.setString(1, desc);
	pst1.setString(2, dateformat.format(cal.getTime()));
	pst1.setString(3, timeformat.format(cal.getTime()));
	pst1.setString(4, "");
	pst1.setString(5, "contact us");
	pst1.setString(6, email);
	pst1.executeUpdate();
  
response.sendRedirect("index.jsp");

%>