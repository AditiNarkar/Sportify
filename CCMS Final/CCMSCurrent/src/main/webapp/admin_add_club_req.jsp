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
	
	String id = request.getParameter("id");
	
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
  
</head>

<body>
<header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
	
	<h1 class="logo mr-auto"><a href="index.jsp">SPORTIFY</a></h1>
    </div>
</header>

<div class="requestto-add-club">
    <div class="div1">
        <div class="img">
            <img src="assets/images/logo1-removebg.png" alt="">
        </div>
        <div class="title">
            Requested Club details for Club Id - <%= id %>
            <%
            Statement st = con.createStatement();
    		ResultSet rs = st.executeQuery("SELECT * FROM clubs WHERE Club_Id = '" + id + "'");
    		rs.next();
            %>
            <br> Status - <%= rs.getString(7) %>
        </div>
    </div>
    
    <form>
        <div class="div2">
            <div class="club-info">
                <div class="title">club information</div>
                <label for="">Club Name </label>
                <span><%= rs.getString(3) %></span><br><br>
                <label for="">Club Logo</label>
                <img src="assets/images/q.png" alt="" height="150"><br><br>
                <label for="">Maximum Capacity</label>
                <span><%= rs.getString(6) %></span><br><br>
            </div>
            <div class="venue-info">
            <%
            Statement stv = con.createStatement();
    		ResultSet rsv = stv.executeQuery("SELECT * FROM venue WHERE Venue_Id = '" + rs.getString(4) + "'");
    		rsv.next();
            %>
                <div class="title">venue information</div>
                <label for="">Venue Name</label>
                <span><%= rsv.getString(3) %></span><br><br>
                <label for="">Address </label>
                <span><%= rsv.getString(4) %></span><br><br>
            </div>
            
            <div class="head-coach-info">
            <%
            Statement sth = con.createStatement();
    		ResultSet rsh = sth.executeQuery("SELECT * FROM coach WHERE Club_Id = '" + id + "' AND Status = 'Head' ");
    		rsh.next();
            %>
                <div class="title">head coach information</div>
                <label for="">Full Name </label>
                <span><%= rsh.getString(3) %></span><br><br>
                <label for="">Email Id</label>
                <span><%= rsh.getString(4) %></span><br><br>
                <label for="">Contact</label>
                <span><%= rsh.getString(5) %></span><br><br>
                <label for="">Age</label>
                <span><%= rsh.getString(6) %></span><br><br>
                <label for="">Experience</label>
                <span><%= rsh.getString(9) %></span><br><br>
            </div>
            <div class="sub-coaches">
            <%
            String bat = "N.A.", ball  = "N.A.", f  = "N.A.";
            Statement stbat = con.createStatement();
    		ResultSet rsbat = stbat.executeQuery("SELECT Coach_Name FROM coach WHERE Club_Id = '" + id + "' AND Status = 'Batting' ");
    		if(rsbat.next()) {
    			 bat = rsbat.getString(1);
    		}
    		
    		Statement stf = con.createStatement();
    		ResultSet rstf = stf.executeQuery("SELECT Coach_Name FROM coach WHERE Club_Id = '" + id + "' AND Status = 'Fielding' ");
    		if(rstf.next()){
    			f = rstf.getString(1);
    		}
    		
    		Statement stbowl = con.createStatement();
    		ResultSet rsbowl = stbowl.executeQuery("SELECT Coach_Name FROM coach WHERE Club_Id = '" + id + "' AND Status = 'Bowling' ");
    		if(rsbowl.next()){
    			ball = rsbowl.getString(1);
    		}
            %>
                <div class="title">sub-coaches information</div>
                <label for="">Batting Coach</label>
                <span><%=bat %></span><br><br>
                <label for="">Fielding Coach</label>
                <span><%= f %></span><br><br>
                <label for="">Bowling Coach</label>
                <span><%= ball %></span><br><br>
            </div>
            
        
            <div class="admin-btns">
            <%
            if(rs.getString(7).equals("Approved"))
            {
            %>
            <button id="unapprove" type="submit" onclick="p_reject('<%= id %>')"><i class="bi bi-x"></i> Delete</button>
           <%} 
            else if(rs.getString(7).equals("Disapproved"))
            {
            %>
                <button id="approve" type="submit" onclick="p_accept('<%= id %>')"><i class="bi bi-check-lg"></i> Approve</button>
           <%}
            else if(rs.getString(7).equals("Pending"))
            {
            %>
                <button id="approve" type="submit" onclick="p_accept('<%= id %>')"><i class="bi bi-check-lg"></i> Accept</button>
                <button id="unapprove" type="submit" onclick="p_reject('<%= id %>')"><i class="bi bi-x"></i> Reject</button>
           <%}
           %>
           
           
            </div>
        </div>
    </form>
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
  </footer><!-- End Footer -->


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

function p_accept(id)
{
	event.preventDefault();
	if(confirm("Are you sure you want to approve Club Id " + id + "  ?") == true)
	{
		location.href = "admin_club_operations.jsp?id=" + id + "&status=approve";
	}
}

function p_reject(id)
{
	event.preventDefault();
	if(confirm("Are you sure you want to disapprove Club Id " + id + " ?") == true)
	{
		window.location = "admin_club_operations.jsp?id=" + id + "&status=disapprove";
	}
}

</script>
</html>