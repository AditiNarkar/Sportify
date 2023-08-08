<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
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
  <script src="assets/slideshow.js"></script>
  <script type="module" src="assets/load_particles.js"></script>
</head>

<body>
  <header id="clubs-header" class="d-flex align-items-center">
    <canvas class="webgl" id="webgl"></canvas>
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo mr-auto"><a href="index.jsp">SPORTIFY</a></h1>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="index.jsp">Home</a></li>
          <li><a class="nav-link scrollto" href="index.jsp#about">About</a></li>
          <li><a class="nav-link scrollto active" href="clubs.jsp">Clubs</a></li>
          <li><a class="nav-link scrollto" href="#shop">Shop</a></li>
          <li><a class="nav-link scrollto" href="index.jsp#contact">Contact</a></li>
         
          <ul>
            <li class="nav-link scrollto dropdown"><a href="#"><span>Log In as</span> <i class="bi bi-chevron-down"></i></a>
              <ul>
                <li><a href="#">Coach</a></li>
                <li><a href="#">Member</a></li>
                <li><a href="#">Team Member</a></li>
                <li><a href="#">Administrator</a></li>
              </ul>
            </li>
           
          </ul>
         
        </ul>        
      </nav>
    </div>
     <%
  String url = "jdbc:mysql://localhost:3306/ccms";
String user = "root";
String pwd = "";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, pwd);
  %>
 
  <form>
   
    <div class="search-bar" data-aos="fade-up">
   
       <input type="text" placeholder="Explore Clubs..." name = "search" id = "search">
     
     
     
      <div class="search-btn" onclick = "s()">
   
        <i class="bi bi-search"></i>
      </div>
   
      <div class="cancel-btn">
        <i class="bi bi-x"></i>
      </div>
  </div>
  </form>
  </header>
 
 

  <main id="main">
    <section id="clubsection">
      <div class="container" data-aos="fade-in">
        <div class="row">
          <div class="col-md-12">
            <h3 class="section-title">Our Clubs</h3>
            <div class="section-title-divider"></div>
          </div>
        </div>
      </div>
     
       <div class="all-clubs-container">
      <%
      String search = request.getParameter("search");
      if(search == null)
      {
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery("Select * from clubs WHERE Status = 'Approved'");
     
     while(rs.next())
     {
     %>
     <div class="container club-container" data-aos="fade-up" data-aos-delay="200">
       <div class="row">

         <div class="col-md-5 about-img"><br>
         
                
                <img src="assets/images/<%= rs.getString(8) %>" alt= "clublogoimg" height="200" >

       
         </div>

         <div class="col-md-6 about-content"><br>
           <h2 class="about-title">
           
           <%=
           rs.getString(3)
           %>
           </h2>
           <p class="about-text">
           Club Description :
           <%=
           rs.getString(5)
           %>
           
           </p>
           <p class="about-text">
			<%
			Statement s = con.createStatement();
			String h = "Select * From coach Where Club_Id = '"+ rs.getString(2) + "' AND Status = 'Head'";
			ResultSet r1 = s.executeQuery(h);
			if(r1.next())
			{
			%>          
			             Head Coach : <%= r1.getString(3) %><%} %>
			           </p>
			             <a href="#login" class="joinbtn">join</a>
			             <a href="view_club_details.jsp?id=<%= rs.getString(2) %>" class="joinbtn">View</a>
			         </div>
			       </div>
			     </div>
			     <br>
			     <div class="section-title-divider"></div>
			     <%
			      } 
	     }
	      else
	      {
	     Statement st1 = con.createStatement();
	        
         ResultSet rs = st1.executeQuery("SELECT * FROM clubs WHERE Status = 'Approved' AND (Club_No LIKE '%" + search + "%' OR Club_Name LIKE '%" + search + "%' OR club_desc LIKE '%" + search + "%')");
              while(rs.next())
              {%>          
              <div class="container club-container" data-aos="fade-up" data-aos-delay="200">
            <div class="row">

              <div class="col-lg-6 about-img"><br>
              <%
            Statement img1 = con.createStatement();
            ResultSet i21 = img1.executeQuery("Select Image FROM clubs");
            if(i21.next())
            {
            %>
                
                <img src="assets/images/<%= rs.getString(8) %>" alt= "clublogoimg" height="200" ><%} %>
          
              </div>

              <div class="col-md-6 about-content"><br>
                <h2 class="about-title">
                 
                <%=
                rs.getString(3)
                %>
                </h2>
                <p class="about-text">
                Club Description :
                <%=
                rs.getString(5)
                %>
               
                </p>
                <p class="about-text">
			    <%
			    Statement s = con.createStatement();
			    String h = "Select * From coach Where Club_Id = '"+ rs.getString(2) + "' AND Status = 'Head'";
			    ResultSet r1 = s.executeQuery(h);
			    if(r1.next())
			    {
			    %>          
                  Head Coach - <%= r1.getString(3) %><%} %>
                </p>
                  <a href="#login" class="joinbtn">join</a>
                  <a href="view_club_details.jsp?id=<%= rs.getString(2) %>" class="joinbtn">View</a>
              </div>

            </div>
          </div>
             
         
          <%}
      }
      %>
    </div>
    <!-- all-clubs-conatiner -->
    </section>
</main>
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
      function s()
      {
     var a = document.getElementById("search").value;
     alert(a);
     location.href = "clubs.jsp?search="+a;
  
      }
      </script>
</html>