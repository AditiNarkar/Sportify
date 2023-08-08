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
				<li ><a href="admin_notifications.jsp"><i class="bi bi-bell-fill"></i>Notification</a></li>
				<li><a href=""><i class="bi bi-people-fill"></i>All Members</a></li>
				<li class="active"><a href="admin_all_clubs.jsp"><i class="bi bi-filter-square-fill"></i>All Clubs</a></li>
				<li><a href="admin_profile.jsp"><i class="bi bi-person-circle"></i>Edit Profile</a></li>
				<li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
       </div>
        <!-- sidebar -->

        <div class="view-club">
            <div class="div1">
                <div class="back"><a href="admin_all_clubs.jsp"><i class="bi bi-arrow-left-circle"></i> View All Clubs</a></div>
                <div class="img">
                    <%
                   Statement img1 = con.createStatement();
            ResultSet i21 = img1.executeQuery("Select Image FROM clubs WHERE Club_Id = '" + id + "'");
            if(i21.next())
            {
            %>
                
                <img src="assets/images/<%= i21.getString(1) %>" alt=""  height="200" ><%} %>
                </div>
                      <%
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM clubs WHERE Club_Id = '" + id + "'");
                rs.next();
                %>
                <div class="club-info">
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
                    Statement count = con.createStatement();
                    ResultSet c = count.executeQuery("SELECT COUNT(Member_No) FROM member WHERE Club_Id = '" + id + "'");
                    c.next();
                    %>
                    
                    
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
            </div>
            <!-- div1 -->

            <div class="div2">
                <div class="coach-profile">
                    <div class="title">club coaches</div>
                    <div class="divider"></div>
                    <div class="coach-table">
                        <table class="table table-hover table-striped table-dark">
                            <thead>
                                <tr>
                                <th scope="col">Coach ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Contact</th>
                                <th scope="col">Age</th>
                                <th scope="col">Experience</th>
                                <th scope="col">Designation</th>
                                </tr>
                            </thead>
                            <tbody>
                             <%
			                Statement coach = con.createStatement();
			                ResultSet co = coach.executeQuery("SELECT * FROM coach WHERE  Club_Id = '" + id + "'");
			           
			                while(co.next())
			                {
			                %>
                                <tr>
                                <th scope="row"><%= co.getString(2) %></th>
                                <td><%= co.getString(3) %></td>
                                <td><%= co.getString(4) %></td>
                                <td><%= co.getString(5) %></td>
                                <td><%= co.getString(6) %></td>
                                <td><%= co.getString(9) %></td>
                                <td><%= co.getString(11) %></td>
                                </tr>
                                <%} %>
                               
                                </tbody>
                            </table>
                    </div>
                </div>
                <!-- coach-profile -->
                <div class="members-list">
                    <div class="title">Club members</div>
                    <div class="divider"></div>
                    <div class="member-table">
                        <table class="table table-hover table-striped table-dark">
                            <thead>
                                <tr>
                                <th scope="col">Member ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Contact</th>
                                <th scope="col">Age</th>
                                <th scope="col">Session ID</th>
                                <th scope="col">Interested in...</th>
                                <th scope="col">Status</th>
                                <th scope="col">Kick Out</th>
                                </tr>
                            </thead>
                               <tbody>
                             <%
			                Statement mem = con.createStatement();
			                ResultSet m = mem.executeQuery("SELECT * FROM member WHERE  Club_Id = '" + id + "'");
			           
			                while(m.next())
			                {
			                %>
                                <tr>
                                <th scope="row"><%= m.getString(2) %></th>
                                <td><%= m.getString(3) %></td>
                                <td><%= m.getString(4) %></td>
                                <td><%= m.getString(5) %></td>
                                <td><%= m.getString(6) %></td>
                                <td><%= m.getString(9) %></td>
                                <td><%= m.getString(10) %></td>
                                <td><%= m.getString(11) %></td>
                                <td><button id = "del" type="submit" value = "<%=  m.getString(2) %>" onclick = "return del_mem(this.value)"><i class="bi bi-dash-circle"></i></button></td>
                                </tr>
                                <%} %>
                               
                                </tbody>
                            </table>
                    </div>
                </div>
                <!-- members-list -->
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
<script>
function del_mem(m)
{
	if(confirm("Delete this member?") == true)
		{
		let urlString = window.location.href;
		let paramString = urlString.split('?')[1];
		let queryString = new URLSearchParams(paramString);

	
		for (let pair of queryString.entries()) {
		   let cid = pair[1];
		  
		   break;
		}
	
	 	return false; 
	 
		}
}
</script>
</html>