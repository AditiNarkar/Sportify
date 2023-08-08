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
String team_id = request.getParameter("id");
	
	PreparedStatement st = con.prepareStatement("UPDATE team SET Captain = ? WHERE Club_Id = ?");
	st.setString(1, "0");
	st.setString(2, session_Club_Id);
	st.executeUpdate();
	
	PreparedStatement st1 = con.prepareStatement("UPDATE team SET Captain = ? WHERE Club_Id = ? AND Team_Id = ?");
	st1.setString(1, "1");
	st1.setString(2, session_Club_Id);
	st1.setString(3, team_id);
	st1.executeUpdate();
	
	
		
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
	Date current_date5 = sdf.parse(sdf.format(new Date())); 
	SimpleDateFormat sdf11 = new SimpleDateFormat("h:mm a");
	
	PreparedStatement st2 = con.prepareStatement("SELECT Full_Name FROM member WHERE Member_Id = (SELECT Member_Id FROM team WHERE Team_Id = ?)");
	st2.setString(1, team_id);
	ResultSet rs2 = st2.executeQuery();
	rs2.next();
    String desc = rs2.getString(1) + " is now your club's team captain.";
	
    String all_members = "INSERT INTO notifications_team(Visibility,Description,Date,Time,Noti_Category, Challenge_Id) Values(?,?,?,?,?,?)";
    PreparedStatement pst10 = con.prepareStatement(all_members);
    pst10.setString(1, session_Club_Id);
   	pst10.setString(2, desc);
  	pst10.setString(3, sdf.format(cal.getTime()));
	pst10.setString(4, sdf11.format(cal.getTime()));
	pst10.setString(5, "match");
	pst10.setString(6, "");
        
	pst10.executeUpdate();
	response.sendRedirect("coach_notifications.jsp");

 %>