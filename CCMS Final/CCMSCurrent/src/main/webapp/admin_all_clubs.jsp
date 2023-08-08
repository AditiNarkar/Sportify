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
 
 
 <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CCMS</title>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 <link href="assets/styles.css" rel="stylesheet">
 <link href="assets/post-login.css" rel="stylesheet">
 <link href="assets/admin_all_clubs.css" rel="stylesheet">
 <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
 <script type="module" src="assets/load_particles.js"></script>
   <link href="assets/styles.css" rel="stylesheet">
  <script src="assets/slideshow.js"></script>
  <script type="module" src="assets/load_particles.js"></script>
</head>

<body>
    <header id="coach-header" class="d-flex align-items-center">
     
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
          
    </header> 
    <div class="wrapper">
       <div class="sidebar">
            <div class="clublogo">
                <img src="assets/images/logo1-removebg.png" alt="" >
                <h4>admin</h4>
            </div>
            
            <ul>
                <li ><a href="admin_login.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
                <li><a href="admin_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li><a href="all_amembers.jsp"><i class="bi bi-people-fill"></i>All Members</a></li>
                <li class="active"><a href="admin_all_clubs.jsp"><i class="bi bi-filter-square-fill"></i>All Clubs</a></li>
                <li><a href="admin_profile.jsp"><i class="bi bi-person-circle"></i>Edit Profile</a></li>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
            
       </div>
        <!-- sidebar -->

        
        <div class="admin-all-clubs">
            
            <canvas class="webgl" id="admin-webgl"></canvas>
            <div class="admin-search-bar" data-aos="fade-up">
                <input type="text" placeholder="Search Clubs ..." name = "search" id = "search">
                <div class="search-btn"  onclick = "s()">
                    <i class="bi bi-search"></i>
                </div>
                <div class="cancel-btn">
                    <i class="bi bi-x"></i>
                </div>
            </div> 
            <%             
            String search = request.getParameter("search");
			if(search == null)
			{
			%>
            <a href="admin_notifications.jsp"><button class="add-btn">View club requests</button></a>
            <!-- admin-search-bar -->
      
       	<div class="club-contents" data-aos = "fade-up" data-aos-delay ="200">
     
            <%
      		Statement img = con.createStatement();
            ResultSet i2 = img.executeQuery("Select * FROM clubs WHERE Status = 'Approved'");
            while(i2.next())
            {
            %>
              <div class="new-club"> <!--box-->
                <img src="assets/images/<%= i2.getString(8) %>" alt="" >
                <div class = "image_overlay"> <!--boxcontent-->
                  <div class="overlay_content"> <!--content-->
                    <ul class="social">
                    <h3><%= i2.getString(3) %></h3>
                        <a href="admin_view_club.jsp?id=<%= i2.getString(2) %>"> <h3 class="List"><i class="bi bi-eye-fill" ></i> View Club</h3></a>
                      
                            <a href="admin_dis.jsp?id=<%= i2.getString(2) %>"> <h3 class="List"><i class="bi bi-trash-fill"></i> Disapprove</h3></a> 
                    </ul>
                    </div>
  
                  </div>
                 
              </div>
              <%} 
            
      		Statement img2 = con.createStatement();
            ResultSet i22 = img2.executeQuery("Select * FROM clubs WHERE Status = 'Pending' OR Status = 'Disapproved'");
            while(i22.next())
            {
            %>
               
           
              <div class="new-club"> <!--box-->
                <img src="assets/images/<%= i22.getString(8) %>" alt="" >
                <div class = "image_overlay"> <!--boxcontent-->
                  <div class="overlay_content"> <!--content-->
                    <ul class="social">
                    <h3><%= i22.getString(3) %></h3>
                       <h3 class="List"> Disapproved</h3>
                    </ul>
                    </div>
  
                  </div>
                 
              </div>
              <%}
            }
			else
			{
				  Statement st1 = con.createStatement();
	        	  ResultSet rs = st1.executeQuery("SELECT * FROM clubs WHERE Club_Name LIKE '%" + search + "%'");
	        	  while(rs.next())
	        	  {%>
	              <a href="admin_notifications.jsp"><button class="add-btn">View club requests</button></a>
	              <!-- admin-search-bar -->
	        
	         	<div class="club-contents" data-aos = "fade-up" data-aos-delay ="200">
	       
	              <%


	              if(rs.getString(7).equals("Approved"))
	              {
	              %>
	                <div class="new-club"> <!--box-->
	                  <img src="assets/images/<%= rs.getString(8) %>" alt="" >
	                  <div class = "image_overlay"> <!--boxcontent-->
	                    <div class="overlay_content"> <!--content-->
	                      <ul class="social">
	                      <h3><%= rs.getString(3) %></h3>
	                          <a href="admin_view_club.jsp?id=<%= rs.getString(2) %>"> <h3 class="List"><i class="bi bi-eye-fill" ></i> View Club</h3></a>
	                        
	                              <a href="admin_dis.jsp?id=<%= rs.getString(2) %>"> <h3 class="List"><i class="bi bi-trash-fill"></i> Disapprove</h3></a> 
	                      </ul>
	                      </div>
	    
	                    </div>
	                   
	                </div>
	                <%} %>
	                
	            
	              <%
	              if(rs.getString(7).equals("Disapproved"))
	              {
	              %>
	                 
	             
	                <div class="new-club"> <!--box-->
	                  <img src="assets/images/<%= rs.getString(8) %>" alt="" >
	                  <div class = "image_overlay"> <!--boxcontent-->
	                    <div class="overlay_content"> <!--content-->
	                      <ul class="social">
	                      <h3><%= rs.getString(3) %></h3>
	                         <h3 class="List"> Disapproved</h3>
	                      </ul>
	                      </div>
	    
	                    </div>
	                   
	                </div>
	                <%}
	        		  
	        	  }
			}
			%>
 
        </div>
     <!-- admin-all-clubs -->
</div>
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
      function s()
      {
    	 
     var a = document.getElementById("search").value;
     
     location.href = "admin_all_clubs.jsp?search="+a;

      }
      </script>
</html>