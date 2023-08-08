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
	String mem_email = session.getAttribute("Email").toString();

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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 <link href="assets/styles.css" rel="stylesheet">
 <link href="assets/post-login.css" rel="stylesheet">
 
</head>

<body>
    <header id="coach-header" class="d-flex align-items-center">
  
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
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
            rs.next();
            
            %>
            <h4><%= rs.getString(1) %></h4>
        </div>
          
        <ul>
                <li ><a href="member_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li class="active"><a href="member_coach_profile.jsp"><i class="bi bi-clipboard-check"></i>My Club</a></li>
                <li><a href="all_mmembers.jsp"><i class="bi bi-people-fill"></i>Club Members</a></li>
                <li><a href="all_mteam.jsp"><i class="bi bi-person-check-fill"></i>Team</a></li>
                <li><a href="member_profile.jsp"><i class="bi bi-person-circle"></i>Edit My Profile</a></li>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
        </ul>
      </div>
      <!-- sidebar -->

    <div class="edit-profile-container" id="coach-edit-profile">

        <div class="div1">
          <div class="profile-image">
          
          
          <%
              Statement img2 = con.createStatement();
            ResultSet i11 = img2.executeQuery("Select Image FROM coach WHERE Club_Id = '" + session_Club_Id + "'");
            if(i11.next())
            {
            %>
                <img src="assets/images/<%= i11.getString(1) %>" alt="200" width=200><%} %>
          
          </div>
          <div class="div2">
            <h5>Head Coach of</h5>
            <!-- form -->
            <form action="">
            <div class="club-dropdown">
              <h5><%= rs.getString(1) %></h5>
            </div><br>
          </div>
        </div>
        <!-- div1   -->

        <div class="title1">
            <div class="divider"></div>
            <h4> Personal information</h4>
        </div>

        <div class="profile-form">
			<%
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("SELECT * FROM coach WHERE Club_Id = '" + session_Club_Id + "' AND Status = 'Head'");
            rs1.next();
            
            %>
          <div class="form-div1">
            <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputEmail4">Name</label>
                <h5><%= rs1.getString(3) %></h5>
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputPassword4">Email</label>
                <h5><%= rs1.getString(4) %></h5>
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputPassword4">Contact</label>
                <h5><%= rs1.getString(5) %></h5>
              </div>
            </div>
          
          </div>
          <!-- form-div1 -->
          
          <div class="form-div2">
            <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputEmail4">Age</label>
                <h5><%= rs1.getString(6) %></h5>
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputPassword4">Experience</label>
                <h5><%= rs1.getString(9) %></h5>
              </div><br>
          
          </div>
          </div>
          <!-- div2 -->
        
        </div>
        <!-- profile-form -->

        <div class="title2">
          <div class="divider"></div>
          <h4> Club Coaches </h4>
        </div>
        
        <div class="sub-coaches">
        	<!-- <div class="form-row"> -->
              <div class="form-group col-md-4">
              <label for="inputEmail4">Batting Coach</label>
        	<%
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery("SELECT Coach_Name FROM coach WHERE Club_Id = '" + session_Club_Id + "' AND Status = 'Batting'");
            if(rs2.next()){
           	%>
               <h5><%= rs2.getString(1) %></h5>
			<%
			} 
            else{ %>
            	<h5>N.A.</h5>
            <%
            }
			%>
            </div>
            <div class="form-group col-md-4">
            <label for="inputPassword4">Bowling Coach</label>
			<%
            Statement st3 = con.createStatement();
            ResultSet rs3 = st3.executeQuery("SELECT Coach_Name FROM coach WHERE Club_Id = '" + session_Club_Id + "' AND Status = 'Bowling'");
            if(rs3.next()){
            %>
             <h5><%= rs3.getString(1) %></h5>
            <%} 
             else{ %><h5>N.A.</h5><%
             }
            %>
             </div>
             <div class="form-group col-md-4">
              <label for="inputPassword4">Fielding Coach</label>
             
             <%
            Statement st4 = con.createStatement();
            ResultSet rs4 = st4.executeQuery("SELECT Coach_Name FROM coach WHERE Club_Id = '" + session_Club_Id + "' AND Status = 'Fielding'");

            if(rs4.next()){
                %>
                 <h5><%= rs4.getString(1) %></h5>
                <%} 
                 else{ %><h5>N.A.</h5><%
                 }
                %>
             </div>

        </div>
      </form>
      
      <form id="member_practice_session_form" name = "member_practice_session_form" method="POST">
      <div class="title2">
        <div class="divider"></div>
        <h4> Practice sessions</h4>
        <h4> Team </h4>
      </div>
      <table class="table table-dark table-bordered" id="session">
		
			<tr>
				<th>Session ID</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Current Capacity</th>
				<th>Maximum Capacity</th>
				<th>Currently In</th>
			</tr>
	<%
	Statement st5 = con.createStatement();
    ResultSet rs5 = st5.executeQuery("SELECT * FROM session WHERE Club_Id = '" + session_Club_Id + "' AND Team_Member = 'Team'");
    
    while(rs5.next()){ %>
    <tr>
    	<td><label><%= rs5.getString(2) %></label></td>
		<td><label><%= rs5.getString(3) %></label></td>
		<td><label><%= rs5.getString(4) %></label></td>
		<td><label><%= rs5.getInt(7) %></label></td>
		<td><label><%= rs5.getInt(8) %></label></td>
		
		<% 
		Statement st7 = con.createStatement();
	    ResultSet rs7 = st7.executeQuery("SELECT Session_Id FROM member WHERE Email = '" + mem_email + "' AND Status = 'T'");
	    if(rs7.next()){
		    if(rs7.getString(1).equals(rs5.getString(2))){
		    	%>
				<td> <input type="radio" name="updated_session_id" value="<%= rs7.getString(1) %>" checked onclick="makeCheck(this)"> </td>
		    	<%	
		    }
		    else{
			%>
			<td> <input type="radio" name="updated_session_id" value="<%= rs5.getString(2) %>" onclick="makeCheck(this)"> </td>
	   
	    	<%	
	    	}
		    %>
		   
   <% 	}
	    else{
	    	%>
			<td> </td>
	   
	    	<%	
	    }
    }
    
	%>
	 </tr>
	</table>
    
  <div class="title2">
        <h4> Member </h4>
      </div>
      <table class="table table-dark table-bordered" id="session">
		
			<tr>
				<th>Session ID</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Current Capacity</th>
				<th>Maximum Capacity</th>
				<th>Currently In</th>
			</tr>
	<%
	Statement st6 = con.createStatement();
    ResultSet rs6 = st6.executeQuery("SELECT * FROM session WHERE Club_Id = '" + session_Club_Id + "' AND Team_Member = 'Member'");
    
    while(rs6.next()){ %>
    <tr>
    	<td><label><%= rs6.getString(2) %></label></td>
		<td><label><%= rs6.getString(3) %></label></td>
		<td><label><%= rs6.getString(4) %></label></td>
		<td><label><%= rs6.getInt(7) %></label></td>
		<td><label><%= rs6.getInt(8) %></label></td>
		<% 
		Statement st8 = con.createStatement();
	    ResultSet rs8 = st8.executeQuery("SELECT Session_Id FROM member WHERE Email = '" + mem_email + "' AND Status = 'M' OR Status = 'S'");
	    if(rs8.next()){
		    if(rs8.getString(1).equals(rs6.getString(2))){
		    	%>
				<td> <input type="radio" name="updated_session_id" value="<%= rs8.getString(1) %>" checked onclick="makeCheck(this)"> </td>
		    	<%	
		    }
		    else{
			%>
			<td> <input type="radio" name="updated_session_id" value="<%= rs6.getString(2) %>" onclick="makeCheck(this)"> </td>
	   
	    	<%	
	    	}
		    %>
		    
	   <% }
	    
	    else{
	    %>
			<td> </td>
	    <%	
	    }
	 }
    
    
	%>
	</tr>
	</table>
	</form>
      </div>
      <!-- edit-profile-container -->
	
   </div>

   <!-- wrapper -->

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

function makeCheck(ele){
	ele.checked = true;
	if(confirm("Are you sure you want to change your practice session time to" + ele.value + "? Your club's head coach will be reported about it.") == true){
		window.location = "member_practise_session_operations.jsp?id=" + ele.value +"";
	}
	else{
		ele.checked = false;
		window.location = "member_coach_profile.jsp";
	}
}


</script>
</html>