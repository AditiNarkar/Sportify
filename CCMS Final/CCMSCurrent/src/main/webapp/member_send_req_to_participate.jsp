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
	String mem_email = session.getAttribute("Email").toString();
	String chid = request.getParameter("chid");
	
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dateformat = new SimpleDateFormat("E, MMM dd yyyy");
	SimpleDateFormat timeformat = new SimpleDateFormat("h:mm a");
	
	String desc2 = "";
	try
	{
		String coach_noti = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id, Mem_Id) Values(?,?,?,?,?,'"+ chid +"', ?)";
		
		Date current_date1 = dateformat.parse(dateformat.format(new Date()));
	    
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT ch_club, opp_club, Challenge_Date, Challenge_Time FROM challenge WHERE Challenge_Id = '" + chid + "'");
		if(rs.next())
		{
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + rs.getString(1) + "'");
			rs1.next();
			
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + rs.getString(2) + "'");
			rs2.next();
			
			Statement st3 = con.createStatement();
			ResultSet rs3 = st3.executeQuery("SELECT Full_Name FROM member WHERE Email = '" + mem_email + "'");
			rs3.next();
			
			desc2 = rs3.getString(1) + " , one of your club member has requested to participate for match held on " + rs.getString(3) + " at " + rs.getString(4) + " between " +  rs1.getString(1) + " and " + rs2.getString(1) + " (" + chid + ").";
		}
		   
        PreparedStatement pst2 = con.prepareStatement(coach_noti);
        pst2.setString(1, session_Club_Id);
        pst2.setString(2, desc2);
        pst2.setString(3, dateformat.format(cal.getTime()));
        pst2.setString(4, timeformat.format(cal.getTime()));
        pst2.setString(5, "request from member");
        pst2.setString(6, mem_email);
        
        pst2.executeUpdate();
        
        response.sendRedirect("member_notifications.jsp");
	}
	catch(Exception e){
		System.out.println(e);
	}
	
%>