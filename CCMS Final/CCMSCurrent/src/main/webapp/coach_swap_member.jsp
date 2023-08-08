<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
	String mem_id = request.getParameter("mem_id");
	String ch_id = request.getParameter("ch_id");
	
  %>

    <header id="coach-header" class="d-flex align-items-center">
     
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
         
    </header> 
   <div class="wrapper">
       <div class="sidebar">
            <div class="clublogo">
                <img src="assets/images/logo1-removebg.png" alt="" >
                <%
                Statement abc = con.createStatement();
                ResultSet ab1 = abc.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
                if(ab1.next())
                {
                %>
                <h4><%= ab1.getString(1) %><% } %></h4>
            </div>
            
            <ul>
                <li><a href="coach.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
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
            </ul>
       </div>

        <div class="members-page-list">
            <div class="divider2"></div>
          
            <div class="divider2"></div>

        <div class="members-table">
            <table class="table table-hover table-striped table-dark">
            <thead>
                <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Contact</th>
                <th scope="col">Age</th>
                <th scope="col">Role</th>
                <th scope="col">Select</th>
               
                </tr>
            </thead>
            <tbody>
            
            <%
            try
			{
            	
            	  	Statement st4 = con.createStatement();
                	ResultSet rs4 = st4.executeQuery("Select Full_name, Email, Contact, Age, Interested_Status, Status, Member_Id FROM member WHERE  Club_Id = '" + session_Club_Id +"' AND (Status = 'M' OR Status = 'TS')  ORDER BY Full_name ASC");
                	int i =1;
            	  	while(rs4.next())
				     { 
            	  		System.out.println(rs4.getString(1));
            	  		%>
                      <tr>
                        <td>
                        <%= i++ %>
                        </td>
                        <td><%= rs4.getString(1) %></td>
                        <td><%= rs4.getString(2) %></td>
                        <td><%= rs4.getString(3) %></td>
                        <td><%= rs4.getString(4) %></td>
                        <td><%= rs4.getString(5) %></td>
                        
                        <td>
                        <%
                        if(ch_id == null)
	            		{%>
	            		
	            			<button type="submit" name = "swap"><a href = "coach_swap_member_operations.jsp?mem_id=<%= mem_id %>&swapped_id=<%= rs4.getString(7) %>"><i class="bi bi-check-lg"></i> Select </a></button>
	            		<%}
	            		else
	            		{%>
	            			<button type="submit" name = "swap"><a href = "coach_swap_member_operations.jsp?mem_id=<%= mem_id %>&swapped_id=<%= rs4.getString(7) %>&ch_id=<%= ch_id %>"><i class="bi bi-check-lg"></i> Select </a></button>
	            		}
	            	<%
	            	}
                    %>
                        
                        </td>
                        
                         </tr>
                       <% }%>
            	  	<tr>
            	  	
                <%
				}
            	catch(Exception e1) {
            	  		System.out.println(e1);
            	}
            	%>
            
            </tbody>
            </table>
            
            
            
        </div>
    </div> 
    <!-- div4 ends -->

            
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