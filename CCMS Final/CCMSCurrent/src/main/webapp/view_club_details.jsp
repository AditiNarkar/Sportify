<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>

 <%
  String url = "jdbc:mysql://localhost:3306/ccms";
String user = "root";
String pwd = "";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, pwd);

String id = request.getParameter("id");
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
 <script src="assets/slideshow.js"></script>
 <script type="module" src="assets/load_particles.js"></script>
 
</head>

<body>
    <header id="header" class="d-flex align-items-center">
      <div class="container d-flex align-items-center justify-content-between"> 
    
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
         
        </div>  
    </header> 
    <div class="wrapper">

        <div class="guest-view-club" id="guest-view-club">
            <div class="div1">
                <div class="back"><a href="clubs.jsp"><i class="bi bi-arrow-left-circle"></i> View All Clubs</a></div>
                <div class="img">
                <%
                   Statement img1 = con.createStatement();
            ResultSet i21 = img1.executeQuery("Select Image FROM clubs WHERE Club_Id = '" + id + "'");
            if(i21.next())
            {
            %>
                
                <img src="assets/images/<%= i21.getString(1) %>" alt=""  height="200" ><%} %>

                
              
                </div>
                <div class="club-info">
                
                <%
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM clubs WHERE Club_Id = '" + id + "'");
                rs.next();
                %>
                    <div class="club-name"><%= rs.getString(3) %></div>
                    
	                <%
	                Statement st1 = con.createStatement();
	                ResultSet rs1 = st1.executeQuery("SELECT * FROM venue WHERE Venue_Id = '" + rs.getString(4) + "'");
	                rs1.next();
	                %>
                 
                    <div class="venue-address">Venue : <%= rs1.getString(3) %>, <%= rs1.getString(4) %></div> 
                    <div class="divider"></div>
                    <div class="div11">
                    
                    	<%
		                Statement st2 = con.createStatement();
		                ResultSet rs2 = st2.executeQuery("SELECT COUNT(Member_No) FROM member WHERE Club_Id = '" + id + "'");
		                rs2.next();
		                %>
	                
                        Total Members : <span class="count-div"><%= rs2.getInt(1) %></span> <br>
                        Maximum Capacity : <span class="count-div"><%= rs.getString(6) %></span> <br>
                        
                        <%
		                Statement st3 = con.createStatement();
		                ResultSet rs3 = st3.executeQuery("SELECT COUNT(Session_No) FROM session WHERE Team_Member = 'Team' AND Club_Id = '" + id + "'");
		                rs3.next();
		                %>
		                
                        Total Team Practice Session(s) : <span class="count-div"><%= rs3.getInt(1) %></span> <br>
                        
                         <%
		                Statement st4 = con.createStatement();
		                ResultSet rs4 = st4.executeQuery("SELECT COUNT(Session_No) FROM session WHERE Team_Member = 'Member' AND Club_Id = '" + id + "'");
		                rs4.next();
		                %>
		                
                        Total Member Practice Session(s) : <span class="count-div"><%= rs4.getInt(1) %></span> <br>
                    </div>
                </div>
                <div class="join-btn">
                    <button onclick = "window.location = 'login.jsp'">Join club</button>
                </div>
            </div>
            <!-- div1 -->

            <div class="div2">
        
                <div class="session-list">
                    <div class="title">practice session timetable</div>
                    <div class="divider"></div>
                    
                    <div class="title1">Member</div>
                    <div class="session-table">
                    
                        <table class="table table-hover table-striped table-dark">
                            <thead>
                                <tr>
                                <th scope="col">Session_Id</th>
                                <th scope="col">Start_Time</th>
                                <th scope="col">End_Time</th>
                                <th scope="col">Current_Capacity</th>
                                <th scope="col">Max_Capacity</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <%
			                Statement st5 = con.createStatement();
			                ResultSet rs5 = st5.executeQuery("SELECT * FROM session WHERE Team_Member = 'Member' AND Club_Id = '" + id + "'");
			           
			                while(rs5.next())
			                {
			                %>
                                <tr>
                                <th scope="row"><%= rs5.getString(2) %></th>
                                <td><%= rs5.getString(3) %></td>
                                <td><%= rs5.getString(4) %></td>
                                <td><%= rs5.getString(7) %></td>
                                <td><%= rs5.getString(8) %></td>
                                </tr>
                          <% } %>                   
                            </tbody>
                        </table>
                    </div>

                    <div class="title1">team</div>
                    <div class="session-table">
                        <table class="table table-hover table-striped table-dark">
                            <thead>
                                <tr>
                                <th scope="col">Session_Id</th>
                                <th scope="col">Start_Time</th>
                                <th scope="col">End_Time</th>
                                <th scope="col">Current_Capacity</th>
                                <th scope="col">Max_Capacity</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <%
			                Statement st6 = con.createStatement();
			                ResultSet rs6 = st6.executeQuery("SELECT * FROM session WHERE Team_Member = 'Team' AND Club_Id = '" + id + "'");
			           
			                while(rs6.next())
			                {
			                %>
                                <tr>
                                <th scope="row"><%= rs6.getString(2) %></th>
                                <td><%= rs6.getString(3) %></td>
                                <td><%= rs6.getString(4) %></td>
                                <td><%= rs6.getString(7) %></td>
                                <td><%= rs6.getString(8) %></td>
                                </tr>
                          <% } %>                   
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- session-list -->

                <div class="coach-profile">
                    <div class="profile">
                        <div class="profile-container">
                          <div class="head">Club coaches</div>
                          <div class="divider"></div>
              
                          <div class="profile-div1">
                            <div class="profile-img">
                            <%
              Statement img2 = con.createStatement();
            ResultSet i11 = img2.executeQuery("Select Image FROM coach WHERE Club_Id = '" + id + "'");
            if(i11.next())
            {
            %>
                 <!-- <img src="assets/images/logo1-removebg.png" alt="" >   -->
                <img src="assets/images/<%= i11.getString(1) %>" alt="" ><%} %>
                            
                              <!--  <img src="assets/images/profile1.jfif" alt="">  -->
                            </div>
                          
                            <div class="profile-content">
                              <dl class="row">
              
                             <%
			                Statement st7 = con.createStatement();
			                ResultSet rs7 = st7.executeQuery("SELECT * FROM coach WHERE Status = 'Head' AND Club_Id = '" + id + "'");
			                rs7.next();
			                %>
              
                                <dt class="col-sm-5">Name</dt>
                                <dd class="col-sm-6"><%= rs7.getString(3) %></dd>
                              
                                <dt class="col-sm-5">Email Id</dt>
                                <dd class="col-sm-6">
                                  <%= rs7.getString(4) %>
                                </dd>
                              
                                <dt class="col-sm-5">Contact</dt>
                                <dd class="col-sm-6"><%= rs7.getString(5) %></dd>
              
                                <dt class="col-sm-5">Age</dt>
                                <dd class="col-sm-6"><%= rs7.getString(6) %></dd>
              
                                <dt class="col-sm-5">Experience</dt>
                                <dd class="col-sm-6"><%= rs7.getString(9) %></dd>
              
                              </dl> 
                
                            </div>
                            <!-- profile content -->

                            <div class="subcoaches">
                                <div class="divider1"></div>
                                <h5>Other coaches</h5>
                  
                                <dl class="row">
                  					
                  					<%
                  				String bat = "N.A.", f= "N.A.", bo = "N.A.";
			                	Statement st8 = con.createStatement();
				                ResultSet rs8 = st8.executeQuery("SELECT Coach_Name, Status FROM coach WHERE Club_Id = '" + id + "'");
				                while(rs8.next())
				                {
				                	if(rs8.getString(2).equals("Batting"))
				                	{
				                		bat = rs8.getString(1);
				                	}
				                	if(rs8.getString(2).equals("Fielding"))
				                	{
				                		f = rs8.getString(1);
				                	}
				                	if(rs8.getString(2).equals("Bowling"))
				                	{
				                		bo = rs8.getString(1);
				                	}
				                }
				                %>
			                
                                  <dt class="col-sm-4">Batting</dt>
                                  <dd class="col-sm-6"><%= bat %></dd> 
                  
                                  <dt class="col-sm-4">Fielding</dt>
                                  <dd class="col-sm-6"><%= f %></dd>
                
                                  <dt class="col-sm-4">Bowling</dt>
                                  <dd class="col-sm-6"><%= bo %></dd>
                  
                                </dl>
                            </div>
                        </div>
                </div>
                <!-- coach-profile -->


            </div>
            <!-- div2 -->
        </div>
        <!-- view-club -->
        
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
</html>