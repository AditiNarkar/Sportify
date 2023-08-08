
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Arrays"%>
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
	
	String accept_challengeid = "";
	accept_challengeid = request.getParameter("accept_challengeid");
	String reject_challengeid = request.getParameter("reject_challengeid");
	String noti_no = request.getParameter("noti_no");
	String exclude_from_team = "";
	String include_from_mem = "";
	try
	{	
		Statement st1 = con.createStatement();
  		st1.executeUpdate("UPDATE challenge SET Status = 'Approved' WHERE Challenge_Id = '"+ accept_challengeid +"'");
		
  	      		Statement st2 = con.createStatement();
  	      		ResultSet rs = st2.executeQuery("SELECT Club_Name,Club_Id FROM clubs WHERE Club_Id = (SELECT ch_club FROM challenge WHERE Challenge_Id = '"+ accept_challengeid +"' AND Status ='Approved')");
  	      		
  	      		Statement st3 = con.createStatement();
	      		ResultSet rs3 = st3.executeQuery("SELECT Club_Name,Club_Id FROM clubs WHERE Club_Id = (SELECT opp_club FROM challenge WHERE Challenge_Id = '"+ accept_challengeid +"' AND Status ='Approved')");
  	      		
  	      		if(rs.next() && rs3.next())
  	      		{
  	        		Statement st11 = con.createStatement();
  	        		ResultSet rs11 = st11.executeQuery("SELECT Member_Id FROM member WHERE Status = 'TS' AND (Club_Id = '" + rs.getString(2) +"' OR Club_Id = '" + rs3.getString(2) +"')" );
  	        		while(rs11.next())
  	        		{
  	        			exclude_from_team = exclude_from_team + " " + rs11.getString(1);
  	        		}
  	        		PreparedStatement st21 = con.prepareStatement("UPDATE challenge SET exclude_from_team = ? WHERE Challenge_Id = '"+ accept_challengeid +"'");
  	        		st21.setString(1, exclude_from_team);
  	        		st21.executeUpdate();
  	        		
  	        		Statement st111 = con.createStatement();
  	        		ResultSet rs111 = st111.executeQuery("SELECT Member_Id FROM member WHERE Status = 'MS' AND (Club_Id = '" + rs.getString(2) +"' OR Club_Id = '" + rs3.getString(2) +"')" );
  	        		while(rs111.next())
  	        		{
  	        			include_from_mem = include_from_mem + " " + rs111.getString(1);
  	        		}
  	        		PreparedStatement st211 = con.prepareStatement("UPDATE challenge SET include_from_mem = ? WHERE Challenge_Id = '"+ accept_challengeid +"'");
  	        		st211.setString(1, include_from_mem);
  	        		st211.executeUpdate();
  	        		
  	        		
  	        		Statement st = con.createStatement();
  	        		st.executeUpdate("UPDATE member SET Status = 'T' WHERE Status = 'TS' AND Club_Id = '" + session_Club_Id + "'");
  	        		
  	        		Statement st112 = con.createStatement();
  	        		st112.executeUpdate("UPDATE member SET Status = 'M' WHERE Status = 'MS' AND Club_Id = '" + session_Club_Id + "'");
  	        		
  	        		
  	      			String coach_noti_accept = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id) Values(?,?,?,?,?,'"+ accept_challengeid +"')";
  	          		
  	        		Calendar cal = Calendar.getInstance();
  	        	    
  	        	    SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
  	        		Date current_date = sdf.parse(sdf.format(new Date()));
  	        	    
  	        	    SimpleDateFormat sdf1 = new SimpleDateFormat("h:mm a");
  	                String desc = rs.getString(1)+ " and " + rs3.getString(1) + " are having a match.";
  	        		      
  	                  PreparedStatement pst1 = con.prepareStatement(coach_noti_accept);
  	                  pst1.setString(1, "all");
  	                  pst1.setString(2, desc);
  	                  pst1.setString(3, sdf.format(cal.getTime()));
  	                  pst1.setString(4, sdf1.format(cal.getTime()));
  	                  pst1.setString(5, "");
  	                  
  	                  pst1.executeUpdate();
  	                  
  	              
  	               
					String mem_noti_accept = "INSERT INTO notifications_members(Visibility,Description,Date,Time,Noti_Category, Challenge_Id) Values(?,?,?,?,?,?)";
  	          		
  	          		
  	        		Calendar cal3 = Calendar.getInstance();
  	        	    
  	        	    SimpleDateFormat sdf3 = new SimpleDateFormat("E, MMM dd yyyy");
  	        		Date current_date3 = sdf.parse(sdf.format(new Date()));
  	        	    
  	        	    SimpleDateFormat sdf4 = new SimpleDateFormat("h:mm a");
  	                String desc4 = rs.getString(1)+ " and " + rs3.getString(1) + " are having a match ";
  	        		      
  	                  PreparedStatement pst3 = con.prepareStatement(mem_noti_accept);
  	                  pst3.setString(1, "all");
  	                  pst3.setString(2, desc4);
  	                  pst3.setString(3, sdf.format(cal.getTime()));
  	                  pst3.setString(4, sdf1.format(cal.getTime()));
  	                  pst3.setString(5, "");
  	               	  pst3.setString(6, accept_challengeid);
  	                  
  	                  pst3.executeUpdate();
  	                  
  	                  
 					String team_noti_accept = "INSERT INTO notifications_team(Visibility,Description,Date,Time,Noti_Category, Challenge_Id) Values(?,?,?,?,?,?)";
  	          		
  	        		Calendar cal4 = Calendar.getInstance();
  	        	    
  	        	    SimpleDateFormat sdf5 = new SimpleDateFormat("E, MMM dd yyyy");
  	        		Date current_date4 = sdf.parse(sdf.format(new Date()));
  	        	    
  	        	    SimpleDateFormat sdf6 = new SimpleDateFormat("h:mm a");
  	                String desc5 = "Your club has challenged " + rs3.getString(1) + ".";
  	        		      
  	                  PreparedStatement pst4 = con.prepareStatement(team_noti_accept);
  	                  pst4.setString(1, rs.getString(2));
  	                  pst4.setString(2, desc5);
  	                  pst4.setString(3, sdf.format(cal.getTime()));
  	                  pst4.setString(4, sdf1.format(cal.getTime()));
  	                  pst4.setString(5, "match");
  	                  pst4.setString(6, accept_challengeid);
  	                  
  	                  pst4.executeUpdate();
  	                  
  	                 
						String all_members = "INSERT INTO notifications_team(Visibility,Description,Date,Time,Noti_Category, Challenge_Id) Values(?,?,?,?,?,?)";
	  	          		
	  	        		Calendar cal10 = Calendar.getInstance();
	  	        	    
	  	        	    SimpleDateFormat sdf10 = new SimpleDateFormat("E, MMM dd yyyy");
	  	        		Date current_date5 = sdf.parse(sdf.format(new Date()));
	  	        	    
	  	        	    SimpleDateFormat sdf11 = new SimpleDateFormat("h:mm a");
	  	                String desc10 = rs.getString(1)+ " and " + rs3.getString(1) + " are having a match ";
  	        		      
	  	                  PreparedStatement pst10 = con.prepareStatement(all_members);
	  	                  pst10.setString(1, rs.getString(2));
	  	              	  pst10.setString(2, desc10);
	  	            	  pst10.setString(3, sdf.format(cal.getTime()));
	  	          		  pst10.setString(4, sdf1.format(cal.getTime()));
	  	        		  pst10.setString(5, "all");
	  	        		  pst10.setString(6, accept_challengeid);
	  	                  
	  	      			  pst10.executeUpdate();
  	                  
  	                  
					String opp_team_noti_accept = "INSERT INTO notifications_team(Visibility,Description,Date,Time,Noti_Category, Challenge_Id) Values(?,?,?,?,?,?)";
  	          		
  	        		Calendar cal6 = Calendar.getInstance();
  	        	    
  	        	    SimpleDateFormat sdf7 = new SimpleDateFormat("E, MMM dd yyyy");
  	        		Date current_date6 = sdf.parse(sdf.format(new Date()));
  	        	    
  	        	    SimpleDateFormat sdf8 = new SimpleDateFormat("h:mm a");
  	                String desc6 = "Your club has been challenged by " + rs.getString(1) + ".";
  	        		      
  	                  PreparedStatement pst5 = con.prepareStatement(opp_team_noti_accept);
  	                  pst5.setString(1, rs3.getString(2));
  	                  pst5.setString(2, desc6);
  	                  pst5.setString(3, sdf.format(cal.getTime()));
  	                  pst5.setString(4, sdf1.format(cal.getTime()));
  	                  pst5.setString(5, "match");
  	                  pst5.setString(6, accept_challengeid);
  	                  
  	                  pst5.executeUpdate();
  	                  
  	                Statement del1 = con.createStatement();
	                  String del_noti1 = "DELETE FROM notifications_coach WHERE Notification_No = '" + noti_no + "'";
	                  del1.executeUpdate(del_noti1);
  	      		}
  	      	
  	      		Statement st4 = con.createStatement();
  	    		st4.executeUpdate("UPDATE challenge SET Status = 'Unapproved' WHERE Challenge_Id = '"+ reject_challengeid +"'");
				
  	    		Statement st6 = con.createStatement();
  	      		ResultSet rs4 = st6.executeQuery("SELECT Club_Name,Club_Id FROM clubs WHERE Club_Id = (SELECT ch_club FROM challenge WHERE Challenge_Id = '"+ reject_challengeid +"' AND Status ='Unapproved')");
  	      		
  	      		Statement st5 = con.createStatement();
	      		ResultSet rs5 = st5.executeQuery("SELECT Club_Name,Club_Id FROM clubs WHERE Club_Id = (SELECT opp_club FROM challenge WHERE Challenge_Id = '"+ reject_challengeid +"' AND Status ='Unapproved')");
  	      		
  	      		if(rs4.next() && rs5.next())
  	      		{
  	      			String coach_noti_reject = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id) Values(?,?,?,?,?,'"+ reject_challengeid +"')";
  	          		
  	        		Calendar cal = Calendar.getInstance();
  	        	    
  	        	    SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
  	        		Date current_date = sdf.parse(sdf.format(new Date()));
  	        	    
  	        	    SimpleDateFormat sdf1 = new SimpleDateFormat("h:mm a");
  	                String desc1 = rs5.getString(1)+ " has rejected your request.";
  	        		      
  	                  PreparedStatement pst1 = con.prepareStatement(coach_noti_reject);
  	                  pst1.setString(1, rs4.getString(2));
  	                  pst1.setString(2, desc1);
  	                  pst1.setString(3, sdf.format(cal.getTime()));
  	                  pst1.setString(4, sdf1.format(cal.getTime()));
  	                  pst1.setString(5, "rejected");
  	                  
  	                  pst1.executeUpdate();
  	                  
					String coach_noti_reject1 = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id) Values(?,?,?,?,?,'"+ reject_challengeid +"')";
  	          		
  	        		Calendar cal1 = Calendar.getInstance();
  	        	    
  	        	    SimpleDateFormat sdf2 = new SimpleDateFormat("E, MMM dd yyyy");
  	        		Date current_date1 = sdf.parse(sdf.format(new Date()));
  	        	    
  	        	    SimpleDateFormat sdf3 = new SimpleDateFormat("h:mm a");
  	                String desc2 = "You rejected " + rs4.getString(1)+ "'s request.";
  	        		      
  	                  PreparedStatement pst2 = con.prepareStatement(coach_noti_reject1);
  	                  pst2.setString(1, rs5.getString(2));
  	                  pst2.setString(2, desc2);
  	                  pst2.setString(3, sdf2.format(cal.getTime()));
  	                  pst2.setString(4, sdf3.format(cal.getTime()));
  	                  pst2.setString(5, "rejected");
  	                  
  	                  pst2.executeUpdate();
  	                 
  	                  Statement del = con.createStatement();
  	                  String del_noti = "DELETE FROM notifications_coach WHERE Notification_No = '" + noti_no + "'";
  	                  del.executeUpdate(del_noti);
  	                  
  	      		}
  	      	
	           
  	  		response.sendRedirect("coach_req_view.jsp");
  	  		
  	 
	}
	catch(Exception e)
	{
		System.out.print(e);
	}
%>