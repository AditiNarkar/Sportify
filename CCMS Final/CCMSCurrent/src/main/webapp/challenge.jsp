<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CCMS</title>
  
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 <link href="assets/styles.css" rel="stylesheet">
 <link href="assets/post-login.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

<%
  	String url = "jdbc:mysql://localhost:3306/ccms";
	String user = "root";
	String pwd = "";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	String session_Club_Id = session.getAttribute("Club_Id").toString();
	
  %>
  
  <%
   try{
	  String msg = request.getParameter("msg");
	  if(msg.equals("Unapproved")){
	  %>
	  <script>
      		alert("You have already challenged the other club on this date and time. Wait for approval.");
  		</script>
  		<%
	  }
	  else if(msg.equals("Approved")){
		  %>
	  	<script>
	  		alert("The match is already scheduled!");
  		</script>
  		<%
	  }
   }
  catch(Exception e){
	  
  }
  
  %>
  
  

    <header id="coach-header" class="d-flex align-items-center">
      
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
         
    </header> 
   <div class="wrapper">
       <div class="sidebar">
            <div class="clublogo">
            <%
               Statement img = con.createStatement();
            ResultSet i2 = img.executeQuery("Select Image FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
            if(i2.next())
            {
            %>
                
                <img src="assets/images/<%= i2.getString(1) %>" alt="" ><%} %>
        <%
                Statement abc = con.createStatement();
                ResultSet ab1 = abc.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
                if(ab1.next())
                {
                %>
                <h4><%= ab1.getString(1) %><% } %></h4>
            </div>
            
            <ul>
                <li ><a href="coach.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
                <li ><a href="coach_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li><a href="all_cmembers.jsp"><i class="bi bi-people-fill"></i>Club Members</a></li>
                <li><a href="all_cteam.jsp"><i class="bi bi-person-check-fill"></i>Team</a></li>
                <li class = "active"><a href="challenge.jsp"><i class="bi bi-bullseye"></i>Challenge</a></li>
                
                 <%
                Statement ps1 = con.createStatement();
                ResultSet rsps = ps1.executeQuery("SELECT COUNT(*) FROM session WHERE Club_Id = '" + session_Club_Id + "'");
                if(rsps.next())
                {
                	if(rsps.getInt(1) == 0)
                	{
                		 %>
                         <li><a href="coach_profile.jsp?count=1"><i class="bi bi-person-circle"></i>My Profile</a></li>
                         <%
                	}
                	else
                	{
                		 %>
                         <li><a href="coach_profile.jsp?count=<%= rsps.getInt(1) %>"><i class="bi bi-person-circle"></i>My Profile</a></li>
                         <%
                	}
                
                } 
                %>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
       </div>

       <div class="challenge-container">
          <div class="challenge-menu"> 
            <div class="active" onclick="window.location.href='challenge.jsp'">Challenge Clubs</div>
            <div class="divider"></div>
            <div onclick="window.location.href='coach_view_req.jsp'"> View Requests</div>
          </div>
          <div class="challenge-content">
            <div class="vs">
              <img src="assets/images/vs-removebg-preview.png" alt="">
            </div>
            <div class="challenge-club">
            
            
			<%
			
			Statement st8 = con.createStatement();
			String query1 = "Select Coach_Name FROM coach WHERE Club_Id = '" + session_Club_Id +"'";
			ResultSet rs8 = st8.executeQuery(query1);
			if(rs8.next())
			{
				
			%>

              <div class="div1"> <marquee behavior="" direction="">Hello Coach <%= rs8.getString(1) %><%} %>, challenge other club for a match by selecting venue, club, date, time and your club team! We will notify you after approving your challenge request.</marquee> </div>

             <div class="div2">
             <%
             Statement img1 = con.createStatement();
            ResultSet i21 = img1.executeQuery("Select Image FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
            if(i21.next())
            {
            %>
                
                <img src="assets/images/<%= i21.getString(1) %>" alt="" height = "250" width = "280" ><br><%} %>
                
             
                <%
                try
                { 
	                  
	            	Statement st3 = con.createStatement();
	                String query = "Select Venue_Id FROM clubs WHERE Club_Id = '" + session_Club_Id +"'";
	            	ResultSet rs3 = st3.executeQuery(query);
	            	while(rs3.next())
	            	{
	            		Statement st2 = con.createStatement();
	            	  	ResultSet rs2 = st2.executeQuery("Select Venue_Name,Venue_Address FROM venue WHERE Venue_Id = '" + rs3.getString(1) +"' ");
	            	  	while(rs2.next())
	    			      { 
	            	  	
	    			          %>
	    						<label for="">Venue : <%= rs2.getString(1) %> ,</label>
	    						<label for=""><%= rs2.getString(2) %> </label>
	    						<% } %><%	
	            	}
            	}
                catch(Exception e)
                {
                	System.out.println(e);
                }
            	
                       %>
	          
             </div>
              
              
             <div class="div3">
              <form name="challenge-form" method = "POST" action = "challenge_operations.jsp">
                <div class="form-group row">
                  <label for="inputTeam" class="col-sm-2 col-form-label">Team</label>
                  <div class="col-sm-10">
                  
                    <select id="inputTeam" class="form-control" name = "challenge_club" required>
                      <option value="" selected>Find Opponent</option>
                     
							<%
							try
							{
             	
             		Statement st1 = con.createStatement();
            	  	ResultSet rs1 = st1.executeQuery("Select Club_Id,Club_Name FROM clubs WHERE Status = 'Approved'");
            	  	while(rs1.next())
				      { 
            	  	if(!rs1.getString(1).equals(session_Club_Id))
            	  	{
            	  		%>
        				
						<option value =<%=rs1.getString(1) %>>
							<%= rs1.getString(2) %> </option>
						<% }}}
							 catch(Exception e1)
			                {
			                	System.out.println(e1);
			                }
							
							%>
                      
                      
                    </select>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputDate" class="col-md-12 col-form-label">ON</label>
                  <label for="inputDate" class="col-sm-2 col-form-label">Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="inputDate" placeholder="Match Date" name = "challenge_date" required>
                    <script>
              		var now = new Date();
              		var tomorrow = now.setDate(now.getDate()+1);
              		minDate = new Date(tomorrow).toISOString().substring(0,10);
              		$('#inputDate').prop('min', minDate);
                  </script>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputTime" class="col-md-12 col-form-label">AT</label>
                  <div class="col-sm-8" id="start-time">
                    <input type="text" class="form-control" id="inputTime" placeholder="Match Start Time" name = "challenge_time" min="2022-02-04" required>
                    
                  </div>
                  <div class="col-sm-4">
                    <select id="inputtime2" class="form-control" name = "challenge_am_pm">
                      <option selected>am</option>
                      <option>pm</option>
                    </select>
                  </div>
                </div>
              
             </div>

             <div class="div4">
                <div class="team-list">team members</div>
                <div class="divider2"></div>
                <h6><i>
					Note: Challenge Request will be sent to all team members you select and only 15 team members who accept first will be taken for match.
                </i></h6>
                <div class="team-table">
                  <table class="table table-hover table-striped table-dark">
                    <thead>
                      <tr>
                       	<th scope="col">Sr. No.</th>
                        <th scope="col">Name</th>
                        <th scope="col">Role</th>
                        <th scope="col">Swap</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%
					try
					{
								
             		Statement st4 = con.createStatement();
            	  	ResultSet rs4 = st4.executeQuery("Select Full_name, Interested_Status, Member_Id FROM member WHERE Club_Id = '" + session_Club_Id +"' AND Status = 'T' OR Status = 'MS' ");
            	  	
            	  	int i =1;
            	  	while(rs4.next())
				      { 
            	  		
            	  		%>
                      <tr>
                       
                        <td>
                        <%= i++ %>
                        </td>
                        <td><%= rs4.getString(1) %></td>
                        <td><%= rs4.getString(2) %></td>
                        <td><a href="coach_swap_member.jsp?mem_id=<%= rs4.getString(3) %>">Swap</a></td>
                         </tr>
                         
                    <% }
            	  	}
            	  	catch(Exception e1)
            	  	{
            	  		System.out.println(e1);
            	  	}
            	  	%>
                     
                    </tbody>
                  </table>
                </div>
                <a id="edit" href="all_cmembers.jsp">Want to edit team members ? </a>
                <button type = "submit">Challenge</button>
                <div style="height: 70px;"></div>
            </form>
            </div> 
            <!-- div4 ends -->

          
     
            </div>
            
       </div>
   </div>
</div>

    <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="copyright">
            &copy; Copyright <strong>Sportify Cricket Academy</strong>. All Rights Reserved
          </div>
          <div class="credits">
            
            
          </div>
        </div>
      </div>
    </div>
  </footer> 
  <!-- End Footer -->


  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/typed.js/typed.min.js"></script>
  <script src="assets/vendor/contact-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="./assets/scripts.js"></script>
</body>
</html>