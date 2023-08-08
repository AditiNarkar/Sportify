<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            ResultSet i = img.executeQuery("Select Image FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
            if(i.next())
            {
            %>
                <img src="assets/images/<%= i.getString(1) %>" alt="" ><%} %>
                 <%
                Statement abc = con.createStatement();
                ResultSet ab = abc.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
                if(ab.next())
                {
                	
                
                %>
                <h4><%= ab.getString(1) %><% } %></h4>
            </div>
            
            <ul>
                <li class = "active"><a href="coach.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
                <li ><a href="coach_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li><a href="all_cmembers.jsp"><i class="bi bi-people-fill"></i>Club Members</a></li>
                <li><a href="all_cteam.jsp"><i class="bi bi-person-check-fill"></i>Team</a></li>
                <li><a href="challenge.jsp"><i class="bi bi-bullseye"></i>Challenge</a></li>
                
                
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
  <%
  
  String session_email = session.getAttribute("Email").toString();


   Statement st = con.createStatement();
   ResultSet rs = st.executeQuery("Select * from coach WHERE Email = '" + session_email +"'");
 
   while(rs.next())
   {
 %>
      <div class="coach-dashboard">
        <div class="welcome">welcome  <c:out value="${sessionScope.user_role}"/>, <%= rs.getString(3) %><%} %></div>
        <div class="div1">
       <%
            	Statement tmemu = con.createStatement();
                String pcountu = "SELECT COUNT(*) FROM member Where Club_Id = '" + session_Club_Id +"'";
                ResultSet su = tmemu.executeQuery(pcountu);
                su.next();
                
                Statement st10u = con.createStatement();
            	String tcountu = "SELECT COUNT(*) FROM member WHERE Status = 'T' AND Club_Id = '" + session_Club_Id +"'";
                ResultSet s1u = st10u.executeQuery(tcountu);
	            s1u.next();
	            
	            Statement chu = con.createStatement();
            	String ctu = "SELECT COUNT(Challenge_Id) FROM challenge WHERE  opp_club = '" + session_Club_Id + "' AND Status = 'Unapproved' AND match_status = 'ongoing'";
                ResultSet sttu = chu.executeQuery(ctu);
	            sttu.next();
	            
	            Statement sesu = con.createStatement();
            	String sesqu = "SELECT COUNT(*) FROM session WHERE Club_Id = '" + session_Club_Id +"'";
            	ResultSet stttu = sesu.executeQuery(sesqu);
            	stttu.next();
		            %>
          <button class="count-container club-members">
              Total Members 
              <br><span id="member-count"><%= su.getString(1) %></span>
          </button>
          <button class="count-container team-members">
              Team Formed
              <br><span id="team-count"><%= s1u.getString(1) %></span>
          </button>
        </div>
        <div class="div2">
          <button class="count-container team-req">
            Team Requests 
          <br><span id="team-req-count"> <%= stttu.getString(1) %> </span>
          </button>
          <button class="count-container challenge">
              Challenge Requests
              <br><span id="challenge-count"><%= sttu.getString(1) %> </span>
          </button>
        </div>
        
        <div class="profile">
          <div class="profile-container">
            <div class="divider"></div>
            <div class="head">My profile</div>
            <div class="divider"></div>

            <div class="profile-div1">
              <div class="profile-img">
              
              
              <%
              Statement img1 = con.createStatement();
            ResultSet i1 = img1.executeQuery("Select Image FROM coach WHERE Club_Id = '" + session_Club_Id + "'");
            if(i1.next())
            {
            %>
                <img src="assets/images/<%= i1.getString(1) %>" alt="" ><%} %>
    
              </div>
            
              <div class="profile-content">
              <%
               Statement st1 = con.createStatement();
               ResultSet rs1 = st1.executeQuery("Select Coach_Name, Email, Contact, Age, Experience from coach WHERE Club_Id = '"+ session_Club_Id +"' AND Status = 'Head'");
        		while(rs1.next())
        		{
       			%>
                <dl class="row">

                  <dt class="col-sm-5">Name</dt>
                  <dd class="col-sm-6"> <%= rs1.getString(1) %></dd>
                
                  <dt class="col-sm-5">Email Id</dt>
                  <dd class="col-sm-6">
                   <%= rs1.getString(2) %>
               
                  </dd>
                
                  <dt class="col-sm-5">Contact</dt>
                  <dd class="col-sm-6"><%= rs1.getString(3) %></dd>

                  <dt class="col-sm-5">Age</dt>
                  <dd class="col-sm-6"> <%= rs1.getString(4) %> yrs</dd>

                  <dt class="col-sm-5">Experience</dt>
                  <dd class="col-sm-6"> <%= rs1.getString(5) %></dd>
                  <%} %>
                </dl> 
  
              </div>
            <!-- profile content -->

            <div class="profile-session">

              <div class="subcoaches">
                <div class="divider1"></div>
                <h5>Club coaches</h5>
  
                <dl class="row">
  					<%
		               Statement st2 = con.createStatement();
		               ResultSet rs2 = st2.executeQuery("Select Coach_Name from coach WHERE Club_Id = '"+ session_Club_Id +"' AND Status = 'Batting'");
		        		if(rs2.next())
		        		{
		        			if(!rs2.getString(1).equals(""))
		        			{%>
       							<dt class="col-sm-4">Batting</dt>
                  				<dd class="col-sm-6"><%= rs2.getString(1) %></dd>
  							<%}
		        		}
		        			else
		        			{
		        			%>
		        			<dt class="col-sm-4">Batting</dt>
                  			<dd class="col-sm-6">N.A.</dd>
		        		<%} %>
  					<%
		               Statement st3 = con.createStatement();
		               ResultSet rs3 = st3.executeQuery("Select Coach_Name from coach WHERE Club_Id = '"+ session_Club_Id +"' AND Status = 'Fielding'");
		               if(rs3.next())
		        		{
		        			if(!rs3.getString(1).equals(""))
		        			{%>
      							<dt class="col-sm-4">Fielding</dt>
                 				<dd class="col-sm-6"><%= rs3.getString(1) %></dd>
 							<%}
		        		}
		        			else
		        			{
		        			%>
		        			<dt class="col-sm-4">Fielding</dt>
                 			<dd class="col-sm-6">N.A.</dd>
		        		<%} %>
 					<%
		               Statement st4 = con.createStatement();
		               ResultSet rs4 = st4.executeQuery("Select Coach_Name from coach WHERE Club_Id = '"+ session_Club_Id +"' AND Status = 'Bowling'");
		               if(rs4.next())
		        		{
		        			if(!rs4.getString(1).equals(""))
		        			{%>
     							<dt class="col-sm-4">Bowling</dt>
                				<dd class="col-sm-6"><%= rs4.getString(1) %></dd>
							<%}
		        		}
		        			else
		        			{
		        			%>
		        			<dt class="col-sm-4">Bowling</dt>
                			<dd class="col-sm-6">N.A.</dd>
		        		<%} %>
		           
                </dl>
              </div>

              <div class="divider1"></div>
              <h5>practice sessions</h5>

              <dl class="row">
              
				<dt class="col-sm-8">Team</dt>
				<table style="font-size: 16px; color: #d4d4d4; margin-left: 30px;">
                		<thead>
                			<th>Id</th>
                			<th>Start</th>
                			<th>End</th>
                			<th>Current</th>
                			<th>Max</th>
                		</thead>
                	<tbody>
				<%
				Statement st01 = con.createStatement();
				ResultSet rs01 = st01.executeQuery("SELECT * FROM session WHERE Club_Id = '" + session_Club_Id + "' AND Team_Member = 'Team'");
				while(rs01.next())
				{
				%>
                	<tr>
                		<td><%= rs01.getString(2) %></td>
                		<td><%= rs01.getString(3) %></td>
                		<td><%= rs01.getString(4) %></td>
                		<td><%= rs01.getString(7) %></td>
                		<td><%= rs01.getString(8) %></td>
                	</tr>
                 
				<% } %>
				</tbody>
				</table>
				
				<div style="height: 50px;"></div>
				<dt class="col-sm-8">Member</dt>
				<table style="font-size: 16px; color: #d4d4d4; margin-left: 30px;">
                		<thead>
                			<th>Id</th>
                			<th>Start</th>
                			<th>End</th>
                			<th>Current</th>
                			<th>Max</th>
                		</thead>
                	<tbody>
				<%
				Statement st011 = con.createStatement();
				ResultSet rs011 = st011.executeQuery("SELECT * FROM session WHERE Club_Id = '" + session_Club_Id + "' AND Team_Member = 'Member'");
				while(rs011.next())
				{
				%>
                	<tr>
                		<td><%= rs011.getString(2) %></td>
                		<td><%= rs011.getString(3) %></td>
                		<td><%= rs011.getString(4) %></td>
                		<td><%= rs011.getString(7) %></td>
                		<td><%= rs011.getString(8) %></td>
                	</tr>
                 
				<% } %>
				</tbody>
				</table>
              </dl>
				
				<%
				Statement st02 = con.createStatement();
				ResultSet rs02 = st02.executeQuery("SELECT COUNT(*) FROM session WHERE Club_Id = '" + session_Club_Id + "'");
				rs02.next();
				int sescount = rs02.getInt(1);
				%>
              <button class="edit-coach" onclick="window.location.href = 'coach_profile.jsp?count=<%= sescount %>'">Edit</button> 
            </div>

          </div>
          <!-- profile-div1 -->
          </div>
        </div>  

   

        <div id="piechart"></div>
       
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
     <script>
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {

            var data = google.visualization.arrayToDataTable([
            	<%
            	Statement tmem = con.createStatement();
                ResultSet s = tmem.executeQuery("SELECT COUNT(*) FROM member Where Club_Id = '" + session_Club_Id +"'");
                s.next();
                
                Statement st10 = con.createStatement();
                ResultSet s1 = st10.executeQuery("SELECT COUNT(*) FROM member WHERE Status = 'T' AND Club_Id = '" + session_Club_Id +"'");
	            s1.next();
	            
	            Statement chr = con.createStatement();
                ResultSet ccr = chr.executeQuery("SELECT COUNT(Challenge_Id) FROM challenge WHERE opp_club = '" + session_Club_Id + "' AND Status = 'Unapproved' AND match_status = 'ongoing'"); 
	            ccr.next();
	            
	            Statement ses = con.createStatement();
            	ResultSet sttt = ses.executeQuery("SELECT COUNT(*) FROM session WHERE Club_Id = '" + session_Club_Id +"'");
            	sttt.next();
	            
		            %>
             ['Task', 'Hours per Day'],
             ['Total Members', <%= s.getString(1) %>],
             ['Team Formed',   <%= s1.getString(1) %>],
             ['Sessions',    <%= sttt.getString(1) %>],
             ['Challenge Requests', <%= ccr.getString(1) %>],
            ]);

            var options = {
              
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
          }
        </script>
</html>