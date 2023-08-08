<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar"%>
<%
String url = "jdbc:mysql://localhost:3306/ccms";
String user = "root";
String pwd = "";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, pwd);

String session_Club_Id = session.getAttribute("Club_Id").toString();
String coach_email = session.getAttribute("Email").toString();

String coach_msg = request.getParameter("coach_msg_to_post");

String signal = request.getParameter("signal");
String query = "";

Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
SimpleDateFormat sdf1 = new SimpleDateFormat("h:mm a");
Date current_date = sdf.parse(sdf.format(new Date()));

if(signal.equals("to_club"))
{
	query = "INSERT INTO notifications_members ( Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES (?,?,?,?,?,?)";
	PreparedStatement pst = con.prepareStatement(query);
	
    pst.setString(1, session_Club_Id);
    pst.setString(2, coach_msg);
    pst.setString(3, sdf.format(cal.getTime()));
    pst.setString(4, sdf1.format(cal.getTime()));
    pst.setString(5, "by coach");
    pst.setString(6, "");
        
	pst.executeUpdate();
	
	query = "INSERT INTO notifications_team (Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES (?,?,?,?,?,?)";
	PreparedStatement pst1 = con.prepareStatement(query);
	
    pst1.setString(1, session_Club_Id);
    pst1.setString(2, coach_msg);
    pst1.setString(3, sdf.format(cal.getTime()));
    pst1.setString(4, sdf1.format(cal.getTime()));
    pst1.setString(5, "by coach");
    pst1.setString(6, "");
        
	pst1.executeUpdate();
}
else if(signal.equals("to_coach"))
{
	query = "INSERT INTO notifications_coach (Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES (?,?,?,?,?,?)";
	PreparedStatement pst = con.prepareStatement(query);
	
	String query1 = "SELECT Club_Name FROM clubs WHERE Club_Id = ?";
	PreparedStatement pst1 = con.prepareStatement(query1);
	pst1.setString(1, session_Club_Id);
	ResultSet rs4 = pst1.executeQuery();
	rs4.next();
	
	String desc = coach_msg + "<br> Posted by " + coach_email + ", " + rs4.getString(1) ;
	 	pst.setString(1, "all");
	    pst.setString(2, desc);
	    pst.setString(3, sdf.format(cal.getTime()));
	    pst.setString(4, sdf1.format(cal.getTime()));
	    pst.setString(5, "by coach");
	    pst.setString(6, "");
	    
	pst.executeUpdate();
}

response.sendRedirect("coach_notifications.jsp");
%>