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
	
	
  %>

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
    <header id="coach-header" class="d-flex align-items-center">
    
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
        
    </header> 
   <div class="wrapper">
       <div class="sidebar">
            <div class="clublogo">
            <%
                   Statement img1 = con.createStatement();
            ResultSet i21 = img1.executeQuery("Select Image FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
            if(i21.next())
            {
            %>
                
                <img src="assets/images/<%= i21.getString(1) %>" alt=""  ><%} %>
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
                <li><a href="coach_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
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

       <div class="view-req-container">
          <div class="challenge-menu"> 
            <div onclick="window.location.href='challenge.jsp'">Challenge Clubs</div>
            <div class="divider"></div>
            <div class="active" onclick="window.location.href='coach_view_req.jsp'"> View Requests</div>
          </div>
          
          <div class="view-req-content">

              <div class="div1"> <marquee behavior="" direction="">You can view the challenges contested to your club by other clubs. You can choose to accept or reject them.</marquee> </div>

             <div class="div4">
                <div class="team-table">
                  <table class="table table-hover table-striped table-dark">
                    <thead>
                      <tr>
                        <th scope="col">Challenge Number</th>
                        <th scope="col">Challenge Description</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Accept</th>
                        <th scope="col">Reject</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%
                    Statement chr = con.createStatement();
                    ResultSet ccr = chr.executeQuery("SELECT * FROM challenge WHERE opp_club = '" + session_Club_Id + "' AND Status = 'Unapproved' AND match_status = 'ongoing'"); 
    	            while(ccr.next())
    	            {
                    
                    Statement desc = con.createStatement();
                    ResultSet d = desc.executeQuery("SELECT Description,Notification_No FROM notifications_coach WHERE Visibility = '" + session_Club_Id + "' AND Challenge_Id = '" + ccr.getString(2) + "'");
                    while(d.next())
                    {
                   
                    %>
                      <tr>
                        <th scope="row"><%= ccr.getString(1) %></th>
                        <td><%= d.getString(1) %></td>
                        <td><%= ccr.getString(6) %></td>
                        <td><%= ccr.getString(7) %></td>
                        <td><button type="submit"><a href = "approve_challenge2.jsp?accept_challengeid=<%= ccr.getString(2) %>&noti_no=<%= d.getString(2) %>"><i class="bi bi-check"></i> Accept</a></button></td>
						<td><button type="submit"><a href = "approve_challenge2.jsp?reject_challengeid=<%= ccr.getString(2) %>&noti_no=<%= d.getString(2) %>"><i class="bi bi-x"></i> Reject</a></button></td>
						
                      </tr>
                      <%}} %>
                    </tbody>
                  </table>
                </div>

            </div> 
            <!-- div4 ends -->

         </div>
            
       </div>
   <!-- </div> -->
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