<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
<%
String url = "jdbc:mysql://localhost:3306/ccms";
String user = "root";
String pwd = "";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, pwd);

%>
<body>
    <header id="coach-header" class="d-flex align-items-center">
    
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
          
    </header> 
    <div class="wrapper">
       <div class="sidebar">
            <div class="clublogo">
                <img src="assets/images/logo1-removebg.png" alt="" >
                <h4>Admin</h4>
            </div>
            
            <ul>
                  <li ><a href="admin_login.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
				<li class="active"><a href="admin_notifications.jsp"><i class="bi bi-bell-fill"></i>Notification</a></li>
				<li><a href="all_amembers.jsp"><i class="bi bi-people-fill"></i>All Members</a></li>
				<li><a href="admin_all_clubs.jsp"><i class="bi bi-filter-square-fill"></i>All Clubs</a></li>
				<li><a href="admin_profile.jsp"><i class="bi bi-person-circle"></i>Edit Profile</a></li>
				<li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
       </div>

            <div class="admin-noti">
            
               <div class="tabs">
                <div onclick="window.location.href='admin_notifications.jsp'" >Add Club Requests</div>
                <div class="divider-tabs"></div> 
                <div  class="active"  onclick="window.location.href='admin_notifications_contact_us.jsp'" >Contacted Us</div> 
                 <div class="divider-tabs"></div>
                  
             
                   
                </div>


                <div class="noti-content">
                    <table class="table table-sm table-dark" >
                        <thead>
                          <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Description</th>
                            <th scope="col">Date</th>
                             <th scope="col">Time</th>
                             <th scope="col"></th>
                         
                          </tr>
                        </thead>
                        <tbody>
                        
                        <%
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM notifications_admin WHERE Noti_Category = 'contact us' ORDER BY Notification_No DESC");
                        int i = 1;
                        while(rs.next())
                        {
                        %>
                          <tr>
                            <th scope="row"><%= i++ %></th>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            	
                            <td><button><a href="admin_reply.jsp?to=<%=rs.getString(7)%>">Reply</a></button></td>
                            
                            </tr>
                            <%} %>
                        </tbody>
                   
                      </table>
                </div>
            </div>
            
            </div>
            </div>


       
      </div>
      <!-- sidebar -->

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

function deleteNoti(noti_no){
	if(confirm('Delete notification '+noti_no+' from coach notifications ?')){
		window.location = "admin_del_noti.jsp?who=coach&noti_no="+noti_no;
	}
}
</script>



</html>