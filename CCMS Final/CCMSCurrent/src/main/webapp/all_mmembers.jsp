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
                 <li><a href="member_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li><a href="member_coach_proile.jsp"><i class="bi bi-clipboard-check"></i>Club Coach</a></li>
                <li  class="active" ><a href="all_mmembers.jsp"><i class="bi bi-people-fill"></i>Club Members</a></li>
                <li ><a href="all_mteam.jsp"><i class="bi bi-person-check-fill"></i>Team</a></li>
             
                <li><a href="member_profile.jsp"><i class="bi bi-person-circle"></i>Edit My Profile</a></li>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
       </div>

        <div class="members-page-list">
            <div class="divider2"></div>
            <div class="team-list">All club members</div>
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
                </tr>
                
            </thead>
            <tbody>
                  <%
            try{
          
             		Statement st4 = con.createStatement();
            	  	ResultSet rs4 = st4.executeQuery("Select Full_name,Email,Contact,Age, Interested_Status, Status, Member_Id FROM member WHERE  Club_Id = '" + session_Club_Id +"'  ORDER BY Full_name ASC");
            	  	
            	  int i = 1;
            	  
	            	  	while(rs4.next())
					      { 
	            	  		
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
	                     
	                     <% }
	            	 }
            	  	catch(Exception e){}
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