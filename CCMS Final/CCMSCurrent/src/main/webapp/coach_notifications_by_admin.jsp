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
                <li class="active"><a href="coach_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li><a href="all_cmembers.jsp"><i class="bi bi-people-fill"></i>Club Members</a></li>
                <li><a href="all_cteam.jsp"><i class="bi bi-person-check-fill"></i>Team</a></li>
                <li><a href="challenge.jsp"><i class="bi bi-bullseye"></i>Challenge</a></li>
                
                 <%
                Statement ps1 = con.createStatement();
                ResultSet rsps = ps1.executeQuery("SELECT COUNT(*) FROM session WHERE Club_Id = '" + session_Club_Id + "'");
                if(rsps.next())
                {
                %>
                <li><a href="coach_profile.jsp?count=<%= rsps.getInt(1) %>"><i class="bi bi-person-circle"></i>My Profile</a></li>
                <% 
                } 
                %>
                
          </ul>

    </div>
    <!-- sidebar   -->
        
    <div class="coach-login">
              
      <div class="coach-noti">
          <div class="tabs">
              <div onclick="window.location.href='coach_notifications.jsp'" >All</div> 
              <div class="divider-tabs"></div>
              <div onclick="window.location.href='coach_notifications.jsp'" >Team Approval</div> 
              <div class="divider-tabs"></div>
              <div class="active" onclick="window.location.href='coach_notifications_by_admin.jsp'" >By Admin</div> 
          </div>
          <div class="noti-content">
              <table class="table table-sm table-dark" style="width: 100%">
             
              <thead>
					                    <tr>
					                      <th scope="col">#</th>
					                      <th scope="col">Description</th>
					                      <th scope="col">Date</th>
					                      <th scope="col">Time</th>
					                     
					                    </tr>
					                  </thead>
					                  <tbody>
					                  
              <%
              	Statement st = con.createStatement();
	      	  	ResultSet rs= st.executeQuery("Select Visibility, Noti_Category, Description, Date, Time, Challenge_Id, Notification_No FROM notifications_coach ORDER BY Notification_No DESC");
	      	  
		      		 int c = 1;
			      	  	while(rs.next())
			          	{
			          		if(rs.getString(1).equals(session_Club_Id) || rs.getString(1).equals("all"))
			          		{
			          			 if(rs.getString(2).equals("by admin"))
				    	      	  	{
					          			%>
								         <tr>
					                      <th scope="row"><%= c++ %></th>
					                      <td><%= rs.getString(3) %></td>
					                      <td><%= rs.getString(4) %></td>
					                      <td><%= rs.getString(5) %></td>
					                      
					                      <td></td>
					                      <td></td>
					                    </tr>
				          				
				          			<%
				    	      	  	}
			          			}
			          					          			
			          		}
			   %>
                  
              </tbody>
              
                </table>
              </div>
          </div>
          <div class="team-formed">
          
          <div class="post-noti">
              <form method="post">
                <textarea placeholder="Enter message to post..." name="coach_msg_to_post"></textarea>
                <button type="submit" name = "to_club" formaction="coach_post_noti.jsp?signal=to_club" >Post to my Club</button>
                <button type="submit" name = "to_coach" formaction = "coach_post_noti.jsp?signal=to_coach">post To coaches</button>
              </form>
            </div>
            <div class="divider"></div>
            <div class="title">My Team Formed</div>
            <div class="divider"></div>

            <div class="team-formed-table">
              <table class="table table-sm table-dark">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Role</th>
                    <th scope="col">Captain</th>
                  </tr>
                </thead>
                <tbody>
                   <%
                   
                   int i=1;
							try
							{
								
								Statement a = con.createStatement();
								ResultSet ab = a.executeQuery("SELECT Member_Id, Team_Id, Captain FROM team WHERE Club_Id = '" + session_Club_Id +"'");
								while(ab.next())
								{
									Statement st2 = con.createStatement();
				            	  	ResultSet rs2 = st2.executeQuery("Select Full_name, Interested_Status FROM member WHERE Member_Id = '" + ab.getString(1) +"'");
									
				            	  		if(rs2.next())
									    { %>
									    
				            	  		<tr>
				                        	<td>
						                    <%= i++ %>
						                    </td>
						                    <td><%= rs2.getString(1) %></td>
						                    <td><%= rs2.getString(2) %></td>
						                    
						                    <%
						                    if(ab.getString(3).equals("1")){
						                    
						                    %>
						                    <td><input type="radio" name="captain" value="<%= ab.getString(2) %>" onclick="makeCaptain(this)" checked></td>
						                    <%} 
						                    else{
						                    	%>
							                    <td><input type="radio" name="captain" value="<%= ab.getString(2) %>" onclick="makeCaptain(this)"></td>
							                    <%}%>
						               </tr>
				                      <% }   
				                 }
							}
				            catch(Exception e1)
				            {
				             	System.out.println(e1);
				            }
            	  	%>
                
                </tbody>
            
              </table>
            </div>
            

           
            
          </div>
          <!-- team-formed -->
      </div>  

  </div>
  <!-- wraper -->


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
<script>
function makeCaptain(ele){
	ele.checked = true;
	if(confirm("Make the selected player captain ?")==true){
		window.location = "make_captain.jsp?id="+ele.value;
	}
	else{
		ele.checked = false;
		window.location = "coach_notifications.jsp"
	}
}
</script>
</html>