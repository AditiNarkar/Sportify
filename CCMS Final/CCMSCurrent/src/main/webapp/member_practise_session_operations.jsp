<%@page import="org.apache.taglibs.standard.tag.el.core.ForEachTag"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	Calendar cal = Calendar.getInstance(); 
 %>
 	 
<%

try{
	String session_id = request.getParameter("id");
	PreparedStatement st = con.prepareStatement("UPDATE member SET Session_Id = ? WHERE Email = ?");
	st.setString(1, session_id);
	st.setString(2, mem_email);
	st.executeUpdate();
	
	SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
	Date current_date = sdf.parse(sdf.format(new Date()));
	    
	 SimpleDateFormat sdf1 = new SimpleDateFormat("h:mm a");
	 
	 Statement st2 = con.createStatement();
	 ResultSet rs2 = st2.executeQuery("SELECT Status, Full_Name FROM member WHERE Email= '"+ mem_email +"'");
	 rs2.next();
	 
	 Statement st3 = con.createStatement();
	 ResultSet rs3 = st3.executeQuery("SELECT Start_Time, End_Time FROM session WHERE Session_Id= '"+ session_id +"'");
	 rs3.next();
	 
	 String status;
	 if(rs2.getString(1) == "T"){
		 status = "team member";
	 }
	 else status = "member";
     String desc = rs2.getString(2) + ", who is among one of your club's " + status + ", has changed their pratice session time to " + rs3.getString(1) + " - " + rs3.getString(2) + " (" + session_id + ").";
      
     String query1 = "INSERT INTO notifications_coach(Visibility, Description, Date, Time, Noti_Category, Challenge_Id) VALUES ('" + session_Club_Id + "',?,?,?,?,?)"; 
	PreparedStatement pst1 = con.prepareStatement(query1);
    pst1.setString(1, desc);
    pst1.setString(2, sdf.format(cal.getTime()));
    pst1.setString(3, sdf1.format(cal.getTime()));
    pst1.setString(4, "session changed");
    pst1.setString(5, "");
      
    pst1.executeUpdate();
    
    
    // FOR SETTING CURRENT CAPACITY 
    Statement st5 = con.createStatement();
    ResultSet rs5 = st5.executeQuery("SELECT Session_Id FROM session");
   
    while(rs5.next()){
    	PreparedStatement st4 = con.prepareStatement("UPDATE session SET Current_Capacity = (SELECT COUNT(*) FROM member WHERE Session_Id = ?) WHERE Session_Id = ?");
        st4.setString(1, rs5.getString(1));
        st4.setString(2, rs5.getString(1));
    	st4.executeUpdate();
    }
  
	response.sendRedirect("member_coach_profile.jsp");
	
}
catch(Exception e){
	System.out.println(e);
}
%>
