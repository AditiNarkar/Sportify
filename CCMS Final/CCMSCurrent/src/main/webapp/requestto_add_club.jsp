<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar"%>
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
<%
  	String url = "jdbc:mysql://localhost:3306/ccms";
	String user = "root";
	String pwd = "";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	
  %>
<header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo mr-auto"><a href="index.html">SPORTIFY</a></h1>
    </div>
</header>

<div class="requestto-add-club">
    <div class="div1">
        <div class="img">
            <img src="assets/images/logo1-removebg.png" alt="">
        </div>
        <div class="title">
            Fill up the form to request Sportify to add your club ...
        </div>
    </div>
    
    <form method = "POST" action = "add_club_operations.jsp">
        <div class="div2">
            <div class="club-info">
                <div class="title">club information</div>
                <label for="">Club Name</label>
                <input type="text" name = "cname" required><br>
                <label for="">Club Description</label>
                <input type="text" name = "cdesc" required><br>
                <label for="" >Club Logo</label>
                <input type="file" name = "clogo" >
                <label for="">Maximum Capacity</label>
                <input name = "mcapacity" type="number" style = "width: 100px; text-align: center; " max = "100" min = "10" required><br>
            </div>

            <div class="venue-info">
                <div class="title">venue information</div>
                <label for="">Venue Name</label>
                <input type="text" name = "vname" required><br>
                <label for="">Address</label>
                <input type="text" name = "vadd" required>
            </div>
    
            <div class="head-coach-info">
                <div class="title">head coach information</div>
                <label for="">Full Name</label>
                <input type="text" name = "hname" required><br>
                <label for="">Email Id</label>
                <input type="text" name = "hemail" required>
                <label for="">Contact</label>
                <input type="text" name = "hcontact" required><br>
                <label for="">Age</label>
                <input type="number" name = "hage"  type="number" style = " text-align: center; " min = "20" required>
                <label for="">Experience</label>
                <input type="text" name = "hexp" required><br>
                <label for="">Password</label>
                <input type="password" name = "hpass" required>
                <label for="">Re-enter Password</label>
                <input type="password" name = "hrepass" required>
            </div>
       
            <div class="sub-coaches">
                <div class="title">subcoaches information</div>
                <label for="">Batting Coach</label>
                <input type="text" name = "batting_coach"><br>
                
                <label for="">Fielding Coach</label>
                <input type="text" name = "fielding_coach">
               
                <label for="">Bowling Coach</label>
                <input type="text" name = "bowling_coach">
              
            </div>
       
            <div class="div3">
                <button type="submit">Submit</button>
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

</html>