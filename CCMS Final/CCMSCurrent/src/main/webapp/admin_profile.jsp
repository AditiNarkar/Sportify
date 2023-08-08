<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
//current
  	String url = "jdbc:mysql://localhost:3306/ccms";
	String user = "root";
	String pwd = "";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, pwd);
	String session_Email_Id = session.getAttribute("Email").toString();
  %>
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
                <li><a href="admin_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li  ><a href="all_amembers.jsp"><i class="bi bi-people-fill"></i>All Members</a></li>
                <li><a href="admin_all_clubs.jsp"><i class="bi bi-filter-square-fill"></i>All Clubs</a></li>
                <li class="active"><a href="admin_profile.jsp"><i class="bi bi-person-circle"></i>Edit Profile</a></li>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
				
        </ul>
      </div>
      <!-- sidebar -->

    <div class="edit-profile-container" id="admin-edit-profile">    
         <!-- form -->
        <form action="" method = "POST">

        <div class="title1">
            <div class="divider"></div>
            <h4> Personal information</h4>
            <div class="divider"></div>
        </div>
<%
Statement st1 = con.createStatement();
ResultSet rs1 = st1.executeQuery("SELECT * FROM admin WHERE Email = '" + session_Email_Id + "'");
if(rs1.next())
{
%>
        <div class="profile-form">
          <div class="form-div1">
            <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputname">Name</label>
                <input name = "admin_name" type="text" class="form-control" id="inputname" value = "<%= rs1.getString(3) %>" placeholder="Name" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="inputemail">Email</label>
                <input name = "admin_email" type="text" class="form-control" id="inputemail" value = "<%= rs1.getString(4) %>" placeholder="Email"  required >
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputcontact">Contact</label>
                <input name = "admin_contact" type="text" class="form-control" id="inputcontact" value = "<%= rs1.getString(6) %>" placeholder="Contact" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="inputage">Age</label>
                <input name = "admin_age" type="number" class="form-control" id="inputage" value = "<%= rs1.getString(7) %>" placeholder="Age" required>
              </div><br>
              </div>
              </div>
              
              <div class="form-div2">
              <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputnewpassword">New Password</label>
                <input name = "admin_npass" type="password" class="form-control" id="inputnewpassword" placeholder="Leave blank if you don't want to edit previous password" >
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputconfirmpassword">Confirm Password</label>
                <input name = "admin_cpass" type="password" class="form-control" id="inputconfirmpassword" placeholder="Confirm New Password">
              </div>
              
            </div>
          </div>
        
          <%
          try
          {
        	  String admin_name = request.getParameter("admin_name");
        	  String admin_email = request.getParameter("admin_email");
        	  String admin_contact = request.getParameter("admin_contact");
        	  String admin_age = request.getParameter("admin_age");
        	  String admin_npass = request.getParameter("admin_npass");
        	  String admin_cpass = request.getParameter("admin_cpass");
        	  
        	  
        	  if(admin_name != null && admin_email != null  && admin_contact != null && admin_age != null )
        	  {
        		 
        		  Statement s = con.createStatement();
        		  ResultSet rs2 = s.executeQuery("SELECT admin.Email, coach.Email, member.Email FROM admin,coach,member WHERE admin.Email = '" + admin_email + "' OR coach.Email = '" + admin_email + "' OR member.Email = '" + admin_email + "'");
        		  if(rs2.next())
        		  {
        			  Statement st4 = con.createStatement();
            		  ResultSet rs4 = s.executeQuery("SELECT Admin_Id FROM admin WHERE Email = '" + rs2.getString(1) + "' AND Admin_Id = '" + rs1.getString(2) + "'");
            		  if(!rs4.next())
            		  {
            			  %>
                		  <script>
               					alert("Email is already present");
               			  </script>
                		 <%
            		  }
            		  else
            		  {
            			  String update_profile = "UPDATE admin SET Admin_Name = ?, Contact = ?, Age = ?, Email =?  WHERE Email = '" + session_Email_Id + "' ";
            			  
        				  PreparedStatement pst1 = con.prepareStatement(update_profile);
        				  pst1.setString(1,admin_name);
        				  pst1.setString(2,admin_contact);
        				  pst1.setString(3,admin_age);
        				  pst1.setString(4,admin_email);
        				  session.setAttribute("Email",admin_email);
        				  pst1.executeUpdate();
        				 
        				  if(!admin_cpass.equals("") && !admin_npass.equals(""))
        				  //if(admin_cpass != null && admin_npass != null)
            			  {
            				  if(admin_npass.equals(admin_cpass))
            				  {
            					  Statement pwdupdate = con.createStatement();
            					  //pwdupdate.executeUpdate("UPDATE admin SET Password = '121' WHERE Email = '" + session.getAttribute("Email").toString() +"'");
            					  pwdupdate.executeUpdate("UPDATE admin SET Password = '" + admin_cpass + "' WHERE Email = '" + admin_email +"'");
            					  System.out.println("HII");
            					  System.out.println(admin_cpass + "abc");
            				  }
            				  else
            				  {%>
            					  <script>
            					  		alert("Both password fields should be same");
            					  </script>
            				  <%}
            			  }
            		  }
        		  	}
        		  
            	  response.sendRedirect("admin_login.jsp");
            	  
        	
        	  }
          }
         
          
          catch(Exception e)
          {
        	  System.out.println(e);
          }
 
}
          %>
   
        
        </div>
        <!-- profile-form -->


      <div class="save-btn">
        <button type="submit">Update</button>
      </div>
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
</html>