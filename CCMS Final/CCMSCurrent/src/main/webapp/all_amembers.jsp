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
	
	
  %>

    <header id="coach-header" class="d-flex align-items-center">
   
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
       
    </header> 
   <div class="wrapper">
       <div class="sidebar">
            <div class="clublogo">
                <img src="assets/images/logo1-removebg.png" alt="" >
                <h4>club name</h4>
            </div>
            
            <ul>
               <li ><a href="admin_login.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
                <li><a href="admin_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li  class="active"><a href="all_amembers.jsp"><i class="bi bi-people-fill"></i>All Members</a></li>
                <li><a href="admin_all_clubs.jsp"><i class="bi bi-filter-square-fill"></i>All Clubs</a></li>
                <li><a href="admin_profile.jsp"><i class="bi bi-person-circle"></i>Edit Profile</a></li>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
       </div>

        <div class="members-page-list">
            <div class="divider2"></div>
            <div class="team-list">All Members List</div>
            <div class="divider2"></div>

        <div class="members-table">
            <table class="table table-hover table-striped table-dark">
            
                <thead>
                <tr>
                <th scope="col">Member ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Contact</th>
                <th scope="col">Age</th>
                <th scope="col">Role</th>
                </tr>
            </thead>
            
            <tbody>
            <%
                try
				{
            	Statement st = con.createStatement();
        	  	ResultSet rs = st.executeQuery("Select * FROM member");
        	  	while(rs.next())
        	  	{
        	  	%>
                <tr>
                <th scope="row"><%= rs.getString(2) %></th>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(10) %></td>
                <%}
                }
            catch(Exception e1)
    	  	{
    	  		System.out.println(e1);
    	  	}
                %>
                </tr>
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