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

String session_Club_Id = session.getAttribute("Club_Id").toString();
String session_email = session.getAttribute("Email").toString();
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
 
</head>

<body>
    <header id="coach-header" class="d-flex align-items-center">
   
          <h1 class="logo"><a href="index.html">SPORTIFY</a></h1>
         
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
                 Statement abc = con.createStatement();
                ResultSet ab1 = abc.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
                if(ab1.next())
                {
                %>
                <h4><%= ab1.getString(1) %><% } %></h4>
            </div>
           
            <ul>
                   <li ><a href="member_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li ><a href="member_coach_profile.jsp"><i class="bi bi-clipboard-check"></i>My Club</a></li>
                <li class="active"><a href="all_mmembers.jsp"><i class="bi bi-people-fill"></i>Club Members</a></li>
                <li><a href="all_mteam.jsp"><i class="bi bi-person-check-fill"></i>Team</a></li>
               
                <li><a href="member_profile.jsp"><i class="bi bi-person-circle"></i>Edit My Profile</a></li>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
       </div>

      <div class="edit-profile-container">

        <div class="div1">
          <div class="profile-image">
          <%
            Statement img = con.createStatement();
            ResultSet p = img.executeQuery("Select Image FROM member WHERE Club_Id = '" + session_Club_Id + "'");
            if(p.next())
            {
            %>
                <img src="assets/images/<%= p.getString(1) %>" alt="" height="200" width="200" ><%} %>


          </div>
          <div class="div2">
          <%
          Statement cn = con.createStatement();
          ResultSet cnr = cn.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
          cnr.next();
         
         
          Statement m = con.createStatement();
          ResultSet mr = m.executeQuery("SELECT Status FROM member WHERE Club_Id = '" + session_Club_Id + "' AND  Email = '" + session_email + "'");
          mr.next();
       
          if(mr.getString(1).equals("T"))
          {%>
         <h5>Team Member of <%= cnr.getString(1) %></h5>
          <%}
          else
          {%>
        <h5>Club Member of <%= cnr.getString(1) %></h5>
       <%}
         
          %>
         
           
            <!-- form -->
      <form action="" method = "POST">
            <div class="club-dropdown">
             
            </div><br>
            <a>Change profile photo</a>
            <input type="file" class="form-control" id="uploadpic" name = "ui">
            <%
	            String ui = request.getParameter("ui");
	            String upload_img = "UPDATE member SET Image = ? WHERE Email = '" + session_email + "'";
	            PreparedStatement pic = con.prepareStatement(upload_img);
	            pic.setString(1,ui);
	            pic.executeUpdate();
            %>
            <input type="submit" value="Upload" />
          </div>
        </div><br>
<%
Statement st1 = con.createStatement();
ResultSet rs1 = st1.executeQuery("SELECT * FROM member WHERE Email = '" + session_email + "'");
if(rs1.next())
{
%>
        <div class="profile-form">
          <div class="form-div1">
            <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputname">Name</label>
                <input name = "m_name" type="text" class="form-control" id="inputname" value = "<%= rs1.getString(3) %>" placeholder="Name" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="inputemail">Email</label>
                <input name = "m_email" type="text" class="form-control" id="inputemail" value = "<%= rs1.getString(4) %>" placeholder="Email"  required >
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputcontact">Contact</label>
                <input name = "m_contact" type="text" class="form-control" id="inputcontact" value = "<%= rs1.getString(5) %>" placeholder="Contact" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="inputage">Age</label>
                <input name = "m_age" type="number" class="form-control" id="inputage" value = "<%= rs1.getString(6) %>" placeholder="Age" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="m_role">Interested Status</label>
                <select name="m_role" id="r" class="form-control form-control-sm">
                  <option value="<%= rs1.getString(10) %>" selected  ><%= rs1.getString(10) %></option>
                  <option value="Bowling">Bowling</option>
 <option value="Batting">Batting</option>
 <option value="Fielding">Fielding</option>
 <option value="All Rounder">All Rounder</option>
</select>  </div><br>
              </div>
              </div>
         
          <!-- form-div1 -->
         
        <div class="form-div2">
              <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputnewpassword">New Password</label>
                <input name = "m_npass" type="password" class="form-control" id="inputnewpassword" placeholder="Leave blank if you don't want to edit previous one" >
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputconfirmpassword">Confirm Password</label>
                <input name = "m_cpass" type="password" class="form-control" id="inputconfirmpassword" placeholder="Confirm New Password">
              </div>
            </div>
          </div>
          <!-- div2 -->
        <%
         
         String m_name = request.getParameter("m_name");
         String m_email = request.getParameter("m_email");
         String m_contact = request.getParameter("m_contact");
         String m_age = request.getParameter("m_age");
         String m_role = request.getParameter("m_role");
         String m_npass = request.getParameter("m_npass");
         String m_cpass = request.getParameter("m_cpass");
        
         
         if(m_name != null && m_email != null  && m_contact != null && m_age != null && m_role != null )
         {
         System.out.println(2);

Statement smemid = con.createStatement();
ResultSet rs2memid = smemid.executeQuery("SELECT Member_Id FROM member WHERE Email = '" + m_email + "' AND Member_Id = '" + rs1.getString(2) + "'");
if(rs2memid.next())
{
%>
                 <script>
                alert("Email is already present");
                 </script>
         <%
}
         
Statement s = con.createStatement();
ResultSet rs2 = s.executeQuery("SELECT admin.Email, coach.Email FROM admin,coach WHERE admin.Email = '" + m_email + "' OR coach.Email = '" + m_email + "'");

if(rs2.next())
{

%>
<script>
alert("Email is already present");
</script>
<%
}

             else
             {
             System.out.println(5);
             String update_profile = "UPDATE member SET Full_Name = ?, Contact = ?, Age = ?, Email =?, Interested_Status = ?  WHERE Email = '" + session_email + "' ";
             
         PreparedStatement pst1 = con.prepareStatement(update_profile);
         pst1.setString(1,m_name);
         pst1.setString(2,m_contact);
         pst1.setString(3,m_age);
         pst1.setString(4,m_email);
         pst1.setString(5,m_role);
         session.setAttribute("Email",m_email);
         pst1.executeUpdate();
       
         if(!m_cpass.equals("") && !m_npass.equals(""))
        
             {
             System.out.println(6);
             if(m_npass.equals(m_cpass))
             {
             System.out.println(7);
             Statement pwdupdate = con.createStatement();
              pwdupdate.executeUpdate("UPDATE member SET Password = '" + m_cpass + "' WHERE Email = '" + m_email +"'");
             System.out.println("HII");
             System.out.println(m_cpass + "abc");
             }
             else
             {%>
             <script>
              alert("Both password fields should be same");
             </script>
             <%
             }
             }
          }
			session.setAttribute("Email", m_email);
             response.sendRedirect("member_notifications.jsp");
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