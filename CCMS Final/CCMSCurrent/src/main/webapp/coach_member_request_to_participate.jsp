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
	
	String acc_chid = request.getParameter("accept_challengeid");
	String rej_chid = request.getParameter("reject_challengeid");
	String mem_id = request.getParameter("mem_id");
	String noti_no = request.getParameter("noti_no");

	if(!acc_chid.equals("") ||!acc_chid.equals(null) )
	{
		Statement q = con.createStatement();
		ResultSet q1 = q.executeQuery("SELECT Member_Id FROM member WHERE Email = '" + mem_id + "'");
		q1.next();
		mem_id = q1.getString(1);
		
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("SELECT include_from_mem FROM challenge WHERE Challenge_Id = '" + acc_chid + "'");
		rs1.next();
		
		String str = rs1.getString(1) + " " + mem_id;
		System.out.println(str);
		
		Statement st = con.createStatement();
		st.executeUpdate("UPDATE challenge SET include_from_mem = '" + str + "' WHERE Challenge_Id = '" + acc_chid + "'");
		
		String s = "INSERT INTO team (Member_Id, Club_Id, Challenge_Id,Status) Values (?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(s);
		pst.setString(1,mem_id);
		pst.setString(2,session_Club_Id);
		pst.setString(3,acc_chid);
		pst.setString(4,"Approved");
		pst.executeUpdate();
		
		String ai = "CALL autoinc_team()";
        Statement auto_inc = con.createStatement();
        auto_inc.executeUpdate(ai);
		
	}
	response.sendRedirect("coach_notifications.jsp");
	
	
%>