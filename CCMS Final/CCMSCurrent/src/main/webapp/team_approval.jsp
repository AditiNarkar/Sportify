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
	
	String member_id = request.getParameter("member_id");
	String status = request.getParameter("status");
	String ch_id = request.getParameter("ch_id");
	
	try
	{
		if(status.equals("approved"))
		{
			String s = "SELECT Member_Id FROM team WHERE Member_Id = ? AND Club_Id = ? AND Challenge_Id = ? AND Status = 'Pending'";
			PreparedStatement pst = con.prepareStatement(s);
			pst.setString(1,member_id);
			pst.setString(2,session_Club_Id);
			pst.setString(3,ch_id);
		
			ResultSet rss = pst.executeQuery();
			if(rss.next())
			{

				String sss = "UPDATE team SET Status  = ? WHERE Member_Id = ? AND Challenge_Id = ?";
				PreparedStatement psts = con.prepareStatement(sss);
				psts.setString(2,member_id);
				psts.setString(1,"Approved");
				psts.setString(3,ch_id);
				psts.executeUpdate();
			}
			else
			{
			
				String sss = "INSERT INTO team (Member_Id, Club_Id, Challenge_Id, Status) Values (?,?,?,?)";
				PreparedStatement psts = con.prepareStatement(sss);
				psts.setString(1,member_id);
				psts.setString(2,session_Club_Id);
				psts.setString(3,ch_id);
				psts.setString(4,"Approved");
				psts.executeUpdate();
				
				String ai = "CALL autoinc_team()";
		        Statement auto_inc = con.createStatement();
		        auto_inc.executeUpdate(ai);
			}
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT Full_Name, Club_Id FROM member WHERE Member_Id = '"+ member_id +"'");
			while(rs.next())
			{
				
				String team_accept = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id,Mem_Id) Values(?,?,?,?,?,?,?)";
		    		
		  		Calendar cal = Calendar.getInstance();
		  	    SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
		  		Date current_date1 = sdf.parse(sdf.format(new Date()));
		  	    SimpleDateFormat sdf3 = new SimpleDateFormat("h:mm a");
		         
		  	    String desc = rs.getString(1) + " has accepted to participate in the match (" + ch_id + ").";
	  	    
	            PreparedStatement p = con.prepareStatement(team_accept);
	            p.setString(1, rs.getString(2));
	            p.setString(2, desc);
	            p.setString(3, sdf.format(cal.getTime()));
	            p.setString(4, sdf3.format(cal.getTime()));
	            p.setString(5, "team approval");
	            p.setString(6, ch_id);
	            p.setString(7, member_id);
	            
	            p.executeUpdate();
			}
			response.sendRedirect("member_notifications.jsp");
		}
		
		else if(status.equals("disapproved")){
		
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT Full_Name, Club_Id FROM member WHERE Member_Id = '"+ member_id +"'");
			while(rs.next())
			{
				
				String team_accept = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id,Mem_Id) Values(?,?,?,?,?,?,?)";
		    		
		  		Calendar cal = Calendar.getInstance();
		  	    SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
		  		Date current_date1 = sdf.parse(sdf.format(new Date()));
		  	    SimpleDateFormat sdf3 = new SimpleDateFormat("h:mm a");
		         
		  	    String desc = rs.getString(1) + " has rejected to participate in the match (" + ch_id + ").";
	  	    
	            PreparedStatement p = con.prepareStatement(team_accept);
	            p.setString(1, rs.getString(2));
	            p.setString(2, desc);
	            p.setString(3, sdf.format(cal.getTime()));
	            p.setString(4, sdf3.format(cal.getTime()));
	            p.setString(5, "team approval");
	            p.setString(6, ch_id);
	            p.setString(7, member_id);
	            
	            p.executeUpdate();
			}
		}
		response.sendRedirect("member_notifications.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
%>