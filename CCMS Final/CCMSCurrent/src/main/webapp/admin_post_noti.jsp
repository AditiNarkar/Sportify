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

String coach_email = session.getAttribute("Email").toString();

String coach_msg = request.getParameter("admin_msg_to_post");

String signal = request.getParameter("signal");
String query = "";

Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
SimpleDateFormat sdf1 = new SimpleDateFormat("h:mm a");
Date current_date = sdf.parse(sdf.format(new Date()));

query = "INSERT INTO notifications_coach ( Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES (?,?,?,?,?,?)";
PreparedStatement pst = con.prepareStatement(query);
String desc = coach_msg + "<br> Posted by Admin " + coach_email;

pst.setString(1, "all");
pst.setString(2, desc);
pst.setString(3, sdf.format(cal.getTime()));
pst.setString(4, sdf1.format(cal.getTime()));
pst.setString(5, "by admin");
pst.setString(6, "");
    
pst.executeUpdate();

if(signal.equals("to_all"))
{
	query = "INSERT INTO notifications_team (Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES (?,?,?,?,?,?)";
	PreparedStatement pst1 = con.prepareStatement(query);
	
    pst1.setString(1, "all");
    pst1.setString(2, desc);
    pst1.setString(3, sdf.format(cal.getTime()));
    pst1.setString(4, sdf1.format(cal.getTime()));
    pst1.setString(5, "by admin");
    pst1.setString(6, "");
        
	pst1.executeUpdate();
	
	query = "INSERT INTO notifications_members ( Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES (?,?,?,?,?,?)";
	PreparedStatement pst2 = con.prepareStatement(query);
	
    pst2.setString(1, "all");
    pst2.setString(2, desc);
    pst2.setString(3, sdf.format(cal.getTime()));
    pst2.setString(4, sdf1.format(cal.getTime()));
    pst2.setString(5, "by admin");
    pst2.setString(6, "");
        
	pst2.executeUpdate();
	
}

response.sendRedirect("admin_login.jsp");
%>