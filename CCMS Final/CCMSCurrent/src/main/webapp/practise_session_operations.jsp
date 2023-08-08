<%@page import="org.apache.taglibs.standard.tag.el.core.ForEachTag"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  	String url = "jdbc:mysql://localhost:3306/ccms";
	String user = "root";
	String pwd = "";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	String session_Club_Id = session.getAttribute("Club_Id").toString();
 %>
 	 
<%
int count = Integer.parseInt(request.getParameter("count"));
int i;
try{
	
	Statement st = con.createStatement();
	st.executeUpdate("DELETE FROM session WHERE Club_Id = '" + session_Club_Id + "'");
	
	 for(i=1; i<count+1; i++)
	 {
		 String session_no 	= request.getParameter("sessionno"+i);
		 String session_id 	= request.getParameter("sessionid"+i);
		 String start		= request.getParameter("start"+i);
		 String end 		= request.getParameter("end"+i);
		 String forwhom		= request.getParameter("forwhom"+i);
		 String current_cap	= request.getParameter("currentcap"+i);
		 String maxc 		= request.getParameter("maxc"+i);
		
		 if(session_no == null || session_no.equals("")){
			 String insert_session = "INSERT INTO session(Start_Time, End_Time, Team_Member, Club_Id, Current_Capacity, Max_Capacity) VALUES(?,?,?,?,?,?)";
			 PreparedStatement pst = con.prepareStatement(insert_session);
			 pst.setString(1, start);
			 pst.setString(2, end);
			 pst.setString(3, forwhom);
			 pst.setString(4, session_Club_Id);
			 pst.setString(5, "0");
			 pst.setString(6, maxc);
			 pst.executeUpdate();
			 
			 Statement st1 = con.createStatement();
			 st1.executeUpdate("CALL autoinc_session");
		 }
		 else if(!session_no.equals(null)){
			 String insert_session = "INSERT INTO session( Session_No, Session_Id, Start_Time, End_Time, Team_Member, Club_Id, Current_Capacity, Max_Capacity) VALUES(?,?,?,?,?,?,?,?)";
			 PreparedStatement pst = con.prepareStatement(insert_session);
			 pst.setString(1, session_no);
			 pst.setString(2, session_id);
			 pst.setString(3, start);
			 pst.setString(4, end);
			 pst.setString(5, forwhom);
			 pst.setString(6, session_Club_Id);
			 pst.setString(7, current_cap);
			 pst.setString(8, maxc);
			 pst.executeUpdate();
		 }
	
		
	 }
	 
	 String insert_noti_team = "INSERT INTO notifications_team( Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES(?,?,?,?,?,?)";
	 
	 Calendar cal = Calendar.getInstance();
	 SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
     Date current_date1 = sdf.parse(sdf.format(new Date()));
	 SimpleDateFormat sdf3 = new SimpleDateFormat("h:mm a");
      
	 String desc = "Some session timmings are altered by coach. <a href='member_coach_profile.jsp'> Click to check. </a>";
   
	 PreparedStatement p = con.prepareStatement(insert_noti_team);
     p.setString(1, session_Club_Id);
     p.setString(2, desc);
     p.setString(3, sdf.format(cal.getTime()));
     p.setString(4, sdf3.format(cal.getTime()));
     p.setString(5, "session changed");
     p.setString(6, "");
     
     p.executeUpdate();
     
     
     
	String insert_noti_mem = "INSERT INTO notifications_members( Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES(?,?,?,?,?,?)";
	
	 String desc1 = "Some session timmings are altered by coach. <a href='member_coach_profile.jsp'> Click to check. </a>";
   
	 PreparedStatement p1 = con.prepareStatement(insert_noti_mem);
     p1.setString(1, session_Club_Id);
     p1.setString(2, desc1);
     p1.setString(3, sdf.format(cal.getTime()));
     p1.setString(4, sdf3.format(cal.getTime()));
     p1.setString(5, "session changed");
     p1.setString(6, "");
     
     p1.executeUpdate();
	
	 Statement ps1 = con.createStatement();
     ResultSet rsps = ps1.executeQuery("SELECT COUNT(*) FROM session WHERE Club_Id = '" + session_Club_Id + "'");
     if(rsps.next())
     {
    	 int total_ses = rsps.getInt(1);
		response.sendRedirect("coach_profile.jsp?count=" + total_ses + "");
     }
}
catch(Exception e){ System.out.println(e+"huhuhu"); }
%>
