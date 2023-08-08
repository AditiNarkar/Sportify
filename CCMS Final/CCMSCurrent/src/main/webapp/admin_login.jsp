<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>CCMS</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/styles.css" rel="stylesheet">
<link href="assets/post-login.css" rel="stylesheet">

</head>

<body>
	<header id="coach-header" class="d-flex align-items-center">
	
		<h1 class="logo">
			<a href="index.html">SPORTIFY</a>
		</h1>
		
	</header>
	<%
	String session_email = session.getAttribute("Email").toString();
	String url = "jdbc:mysql://localhost:3306/ccms";
	String user = "root";
	String pwd = "";

	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection con = DriverManager.getConnection(url, user, pwd);
	String session_Email_Id = session.getAttribute("Email").toString();

	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * from admin WHERE Email = '" + session_email + "'");

	while (rs.next()) {
	%>
	<div class="wrapper">
		<div class="sidebar">
			<div class="clublogo">
				
<img src="assets/images/logo1-removebg.png" alt="" >
<h4>admin</h4>
			</div>

			<ul>
				<li class="active"><a href="admin_login.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
				<li><a href="admin_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications Tables</a></li>
				<li><a href="all_amembers.jsp"><i class="bi bi-people-fill"></i>All Members</a></li>
				<li><a href="admin_all_clubs.jsp"><i class="bi bi-filter-square-fill"></i>All Clubs</a></li>
				<li><a href="admin_profile.jsp"><i class="bi bi-person-circle"></i>Edit Profile</a></li>
				<li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
			</ul>
		</div>



		<div class="coach-dashboard">
			<div class="welcome">
				welcome
				<c:out value="${sessionScope.user_role}" />
				,
				<%=rs.getString(3)%></div>
				
			<div class="div1">
			<%
        Statement count_mem = con.createStatement();
        String count = "SELECT COUNT(*) FROM member";
        ResultSet c = count_mem.executeQuery(count);
        while(c.next())
        {
    	   Statement pqr = con.createStatement();
    	   String count1 = "SELECT COUNT(*) FROM clubs";
           ResultSet c1 = pqr.executeQuery(count1);
           while(c1.next())
           {
        	   Statement club_req = con.createStatement();
        	   String count3 = "SELECT COUNT(*) FROM notifications_admin WHERE Noti_Category = 'add club req'";
               ResultSet c3 = club_req.executeQuery(count3);
               while(c3.next())
               {
            	   Statement conu = con.createStatement();
            	   String count4 = "SELECT COUNT(*) FROM notifications_admin WHERE Noti_Category = 'contact us'";
                   ResultSet c4 = conu.executeQuery(count4);
                   while(c4.next())
                   {
        	   
       %>
				<button class="count-container club-members">
					Total Members <br>
					
					
					<span id="member-count"> <%= c.getString(1) %></span>
				</button>
				<button class="count-container team-members">
					Total Clubs <br>
					<span id="team-count"><%= c1.getString(1) %>   </span>
				</button>
			</div>
			<div class="div2">
				<button class="count-container team-req">
					Club Requests <br>
					<span id="team-req-count"> <%= c3.getString(1) %></span>
				</button>
				<button class="count-container challenge">
					Contacted Us<br>
					<span id="challenge-count"> <%= c4.getString(1) %><%}}}} %> </span>
				</button>
			</div>

			<div class="admin-profile">
				<div class="admin-profile-container">


					<div class="post-noti-admin">
						<form method="post">
			                <textarea placeholder="Enter message to post..." name="admin_msg_to_post"></textarea>
			                <button type="submit" name = "to_coaches" formaction="admin_post_noti.jsp?signal=to_coaches" >Post to coaches</button>
			                <button type="submit" name = "to_all" formaction = "admin_post_noti.jsp?signal=to_all">post To all</button>
			              </form>
					</div>

					<div class="divider"></div>
					<div class="head">My profile</div>
					<div class="divider"></div>

					<div class="admin-info">
						<dl class="row">

							<dt class="col-sm-4">Admin ID</dt>
							<dd class="col-sm-6"><%=rs.getString(2)%></dd>

							<dt class="col-sm-4">Name</dt>
							<dd class="col-sm-6"><%=rs.getString(3)%></dd>

							<dt class="col-sm-4">Email Id</dt>
							<dd class="col-sm-6">
								<%=rs.getString(4)%>
							
							</dd>

							<dt class="col-sm-4">Contact</dt>
							<dd class="col-sm-6"><%=rs.getString(6)%></dd>
							
							<%
							}
							%>
						</dl>
						<a href="admin_profile.jsp"><button	class="edit-admin-profile-btn">EDIT</button></a>
					</div>

				</div>
				<!-- admin-profile-container -->

				<div class="club-data">
					<div class="head">Club analysis</div>
					<div class="divider"></div>
					<div class="club-data-table">
						<table class="table table-dark table-borderless">

							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Club Name</th>
									<th scope="col">Current </th>
									<th scope="col">Maximum </th>
									<th scope="col">Percent </th>
								</tr>
							</thead>
							<%
							Statement st3 = con.createStatement();
						
									Statement st1 = con.createStatement();
									ResultSet rs1 = st1.executeQuery("Select Club_Id,Club_Name, Max_Capacity from clubs WHERE Status = 'Approved'");

									while (rs1.next()) 
									{

								Statement st2 = con.createStatement();
								ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) FROM member WHERE Club_Id = '" + rs1.getString(1) + "'");

								if (rs2.next()) 
								{
									float percent = (Float.parseFloat(rs2.getString(1)) / Float.parseFloat(rs1.getString(3))) * 100;
							%>
							<tbody>
								<tr>
									<th scope="row"><%=rs1.getString(1)%></th>
									<td><%=rs1.getString(2)%></td>
									<td><%=rs2.getString(1)%></td>
									<td><%=rs1.getString(3)%></td>
									<td><%=percent%>%</td>
								</tr>
								<%
								}
								}
							
								%>
							</tbody>
						</table>
					</div>
				</div>
				<!-- club-data -->
			</div>
			<!-- admin-profile -->

			<script>
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {

            var data = google.visualization.arrayToDataTable([
            	<%
            	Statement x1 = con.createStatement();
                ResultSet c = x1.executeQuery("SELECT COUNT(*) FROM member");
                c.next();
                
            	   Statement x2 = con.createStatement();
            	   String q2 = "SELECT COUNT(*) FROM clubs";
                   ResultSet c1 = x2.executeQuery(q2);
                   c1.next();
                   
                	   Statement x3 = con.createStatement();
                	   String q3 = "SELECT COUNT(*) FROM notifications_admin WHERE Noti_Category = 'add club req'";
                       ResultSet c3 = x3.executeQuery(q3);
                      c3.next();
                       
                    	   Statement x4 = con.createStatement();
                    	   String q4 = "SELECT COUNT(*) FROM notifications_admin WHERE Noti_Category = 'contact us'";
                           ResultSet c4 = x4.executeQuery(q4);
                           c4.next();
                           
		            %>
             ['Task', 'Hours per Day'],
             ['Total Members', <%= c.getString(1) %>],
             ['Total Clubs',   <%= c1.getString(1) %>],
             ['Club Requests',   <%= c3.getString(1) %>  ],
             ['Contacted Us',  <%= c4.getString(1) %>],
            ]);

            var options = {
              
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
          }
        </script>


			<div id="piechart"></div>

		</div>
	</div>
	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="copyright">
						&copy; Copyright <strong>Sportify Cricket Academy</strong>. All
						Rights Reserved
					</div>
					<div class="credits"></div>
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