<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
  	String url = "jdbc:mysql://localhost:3306/ccms";
	String user = "root";
	String pwd = "";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, pwd);
  %>
          <%
          try
        {
        	
           
            String club_session = request.getParameter("club-session");
            
            Statement st2 = con.createStatement();
    	  	ResultSet rs2 = st2.executeQuery("Select Club_Id FROM session WHERE Session_Id = '" + club_session + "'");
            
        	String fname = request.getParameter("fname");
        	String mail = request.getParameter("mail");
        	String contact = request.getParameter("contact");
        	String age = request.getParameter("age");
        	String status = request.getParameter("interested_status");
        	String pass = request.getParameter("pass");
          	String re_pass = request.getParameter("re-pass");
        
        	//Club_Id
        	if(club_session != null && fname != null && mail != null && contact != null &&  age != null && status != null && pass != null && re_pass != null)
        	{
        		Statement st4 = con.createStatement();
        	  	ResultSet rs4 = st4.executeQuery("Select Email FROM member WHERE Email = '" + mail + "'");
        		
        	  	if(rs4.next())
        	  	{%> 
        	  		<script>
        	  		alert("User already exists");
        	  		 response.sendRedirect("login.jsp");
        	  		
        	  		</script>
        	  		
        	  	<%}
        	  	else if(!re_pass.equals(pass))
              {%> 
        	  		<script>
        	  		alert("Passwords doesn't match. Please try again.");
        	  		response.sendRedirect("login.jsp");
        	
        	  		</script>
        	  	<%}
              else
        	  	{
		        		if(rs2.next())
		        		{
		        			String ClubiD = rs2.getString(1);
		        		  
				        	String insert_query = "INSERT INTO member(Club_Id, Session_Id,Full_name,Email, Contact, Age, Interested_Status, Password, Status,Image) VALUES (?,?,?,?,?,?,?,?,'M',?)";
			                  PreparedStatement pst = con.prepareStatement(insert_query);
			                  pst.setString(1, ClubiD);
			                  pst.setString(2, club_session);
			                  pst.setString(3, fname);
			                  pst.setString(4, mail);
			                  pst.setString(5, contact);
			                  pst.setString(6, age);
			                  pst.setString(7, status);
			                  pst.setString(8, pass);
			                  pst.setString(9, "profile.png");
			                  pst.executeUpdate();
			
			                  String ai = "CALL autoinc_member()";
			                  Statement auto_inc = con.createStatement();
			                  auto_inc.executeUpdate(ai);
			                      
			                  Statement st3 = con.createStatement();
			                  st3.executeUpdate("UPDATE session SET Current_Capacity = Current_Capacity + 1 WHERE Session_Id = '" + club_session + "'");
			                  
			                  session.setAttribute("Email",mail);
			                  response.sendRedirect("survey_page.jsp");
                  
		        	}
        	  	}
        	}
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }

        
        %>