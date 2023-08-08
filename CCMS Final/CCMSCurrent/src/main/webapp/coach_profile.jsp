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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
            ResultSet i2 = img.executeQuery("Select Image FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
            if(i2.next())
            {
            %>
                <img src="assets/images/<%= i2.getString(1) %>" alt="" ><%} %>
            
            <%
                Statement abc = con.createStatement();
                ResultSet ab1 = abc.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
                if(ab1.next())
                {
                %>
                <h4><%= ab1.getString(1) %><% } %></h4>
        </div>
          
        <ul>
             	<li><a href="coach.jsp"><i class="bi bi-clipboard-data"></i>Dashboard</a></li>
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
                         <li class = "active"><a href="coach_profile.jsp?count=1"><i class="bi bi-person-circle"></i>My Profile</a></li>
                         <%
                	}
                	else
                	{
                		 %>
                         <li class = "active"><a href="coach_profile.jsp?count=<%= rsps.getInt(1) %>"><i class="bi bi-person-circle"></i>My Profile</a></li>
                         <%
                	}
                
                } 
                %>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
        </ul>
      </div>
      <!-- sidebar -->

    <div class="edit-profile-container" id="coach-edit-profile">

        <div class="div1">
          <div class="profile-image">
          <%
              Statement img1 = con.createStatement();
            ResultSet i1 = img1.executeQuery("Select Image FROM coach WHERE Club_Id = '" + session_Club_Id + "'");
            if(i1.next())
            {
            %>
                <img src="assets/images/<%= i1.getString(1) %>"  alt="" height="150" width="150" ><%} %>
              
            
          </div>
          <div class="div2">
            
            <!-- form -->
            <form action="" method = "POST">
            <div class="club-dropdown">
            <%
            	Statement club_name = con.createStatement();
            	ResultSet cn = club_name.executeQuery("SELECT Club_Id FROM coach WHERE Email = '" + session_Email_Id + "'");
            	if(cn.next())
            	{
            		Statement a = con.createStatement();
                	ResultSet ab = a.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + cn.getString(1) + "'");
                	ab.next();
                	
            %><h5>Head Coach of <%= ab.getString(1) %></h5>
         
              <%} %>
            	
            </div>
        
            <form   enctype="multipart/form-data" method="post">
            <a>Change profile photo</a>
             <div class="save-btn">
            <input type="file" class="form-control" id="uploadpic" name = "ui">
            <%
	            String ui = request.getParameter("ui");
	            String upload_img = "UPDATE coach SET Image = ? WHERE Email = '" + session_Email_Id + "'";
	            PreparedStatement pic = con.prepareStatement(upload_img);
	            pic.setString(1,ui);
	            pic.executeUpdate();
            %>
            <input type="submit" value="Upload" />
            </div>
            </form>
          </div>
        </div>
        <!-- div1   -->

        <div class="title1">
            <div class="divider"></div>
            <h4> Personal information</h4>
        </div>
<%
Statement st1 = con.createStatement();
ResultSet rs1 = st1.executeQuery("SELECT * FROM coach WHERE Email = '" + session_Email_Id + "'");
if(rs1.next())
{
%>

        <div class="profile-form">
          <div class="form-div1">
            <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputname">Name</label>
                <input name = "coach_name" type="text" class="form-control" id="inputname" value = "<%= rs1.getString(3) %>" placeholder="Name" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="inputemail">Email</label>
                <input name = "coach_email" type="text" class="form-control" id="inputemail" value = "<%= rs1.getString(4) %>" placeholder="Email"  required >
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputcontact">Contact</label>
                <input name = "coach_contact" type="text" class="form-control" id="inputcontact" value = "<%= rs1.getString(5) %>" placeholder="Contact" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="inputage">Age</label>
                <input name = "coach_age" type="number" class="form-control" id="inputage" value = "<%= rs1.getString(6) %>" placeholder="Age" required>
              </div><br>
               <div class="form-group col-md-10">
                <label for="inputexp">Experience</label>
                <input name = "coach_experience" type="text" class="form-control" id="inputage" value = "<%= rs1.getString(9) %>" placeholder="Experience" required>
              </div><br>
              </div>
              </div>
          
          <!-- form-div1 -->
          
        <div class="form-div2">
              <div class="form-row">
              <div class="form-group col-md-10">
                <label for="inputnewpassword">New Password</label>
                <input name = "coach_npass" type="password" class="form-control" id="inputnewpassword" placeholder="Leave blank if you don't want to edit previous one" >
              </div><br>
              <div class="form-group col-md-10">
                <label for="inputconfirmpassword">Confirm Password</label>
                <input name = "coach_cpass" type="password" class="form-control" id="inputconfirmpassword" placeholder="Confirm New Password">
              </div>
            </div>
          </div>
          <!-- div2 -->
        
        <%
          try
          {
        	  String coach_name = request.getParameter("coach_name");
        	  String coach_email = request.getParameter("coach_email");
        	  String coach_contact = request.getParameter("coach_contact");
        	  String coach_experience = request.getParameter("coach_experience");
        	  String coach_age = request.getParameter("coach_age");
        	  String coach_npass = request.getParameter("coach_npass");
        	  String coach_cpass = request.getParameter("coach_cpass");
        	  
        	  
        	  if(coach_name != null && coach_email != null  && coach_contact != null && coach_age != null && coach_experience != null )
        	  {
        		  
        		  Statement s = con.createStatement();
        		  ResultSet rs2 = s.executeQuery("SELECT admin.Email, coach.Email, member.Email FROM admin,coach,member WHERE admin.Email = '" + coach_email + "' OR coach.Email = '" + coach_email + "' OR member.Email = '" + coach_email + "'");
        		  if(rs2.next())
        		  {
        			  Statement st4 = con.createStatement();
            		  ResultSet rs4 = s.executeQuery("SELECT Coach_Id FROM coach WHERE Email = '" + rs2.getString(2) + "' AND Coach_Id = '" + rs1.getString(2) + "'");
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
            			  String update_profile = "UPDATE coach SET Coach_Name = ?, Contact = ?, Age = ?, Email =?, Experience = ?  WHERE Email = '" + session_Email_Id + "' ";
            			  
        				  PreparedStatement pst1 = con.prepareStatement(update_profile);
        				  pst1.setString(1,coach_name);
        				  pst1.setString(2,coach_contact);
        				  pst1.setString(3,coach_age);
        				  pst1.setString(4,coach_email);
        				  pst1.setString(5,coach_experience);
        				  session.setAttribute("Email",coach_email);
        				  pst1.executeUpdate();
        				 
        				  if(!coach_cpass.equals("") && !coach_npass.equals(""))
        				
            			  {
            				  if(coach_npass.equals(coach_cpass))
            				  {
            					  Statement pwdupdate = con.createStatement();
            					  pwdupdate.executeUpdate("UPDATE coach SET Password = '" + coach_cpass + "' WHERE Email = '" + coach_email +"'");
            					  System.out.println("HII");
            					  System.out.println(coach_cpass + "abc");
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
        		  session.setAttribute("Email", coach_email);
            	  response.sendRedirect("coach.jsp");

        	    
        	  }
          }
         
          
          catch(Exception e)
          {
        	  System.out.println(e);
          }
 
		
          %>
        
    
        </div>
        <!-- profile-form -->
        <div class="save-btn">
        <button type="submit">Update</button>
      </div>
    </form>

      <div class="title2">
        <div class="divider"></div>
        <h4> Practice sessions</h4>
        <h4> Team & Member</h4>
        
        <form id="addremove-form" method="POST">
		<table class="table table-dark table-bordered" id="session">
		
			<tr>
				<th>Session ID</th>
				<th>For</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Current Capacity</th>
				<th>Maximum Capacity</th>
				<th>Add OR Remove</th>
			</tr>
		
		<%
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM session WHERE Club_Id = '" + session_Club_Id + "' ORDER BY Team_Member DESC");
		
		try{
		
		if(rs.next()) {
			
			%>
			<tr>
			
				<td>
					<input class="form-control" type="text" name="sessionid1" value="<%= rs.getString(2) %>" readOnly>
					<input class="form-control" type="hidden" name="sessionno1" value="<%= rs.getString(1) %>" >
				</td>
			
				 <td><input class="form-control" type="text" name="forwhom1" value="<%= rs.getString(5) %>" required></td>
				<td><input class="form-control" type="text" name="start1" value="<%= rs.getString(3) %>" required></td>
				<td><input class="form-control" type="text" name="end1" value="<%= rs.getString(4) %>" required></td>
				<td><input class="form-control" type="text" name="currentcap1" value="<%= rs.getInt(7) %>" readOnly></td>
				<td><input class="form-control" type="text" name="maxc1" value="<%= rs.getInt(8) %>" required></td>
				<td><input class="btn btn-warning" type="button" name="add" id="add" value="ADD" onclick = "addViews()"></td>
			</tr>
			
		<%
		
		}
		int i, flag=0;
		
		int count = Integer.parseInt(request.getParameter("count"));
		
		for(i=2; i < count+1; i++)
		{
			if(rs.next()){
						%>
						
						<tr>
							<td>
								<input class="form-control" type="text" name="sessionid<%= i %>" value="<%= rs.getString(2) %>" readOnly>
								<input class="form-control" type="hidden" name="sessionno<%= i %>" value="<%= rs.getString(1) %>" >
							</td>
							<td><input class="form-control" type="text" name="forwhom<%= i %>" value="<%= rs.getString(5) %>" required></td>
							<td><input class="form-control" type="text" name="start<%= i %>" value="<%= rs.getString(3) %>" required></td>
							<td><input class="form-control" type="text" name="end<%= i %>" value="<%= rs.getString(4) %>" required></td>
							<td><input class="form-control" type="text" name="currentcap<%= i %>" value="<%= rs.getInt(7) %>" readOnly></td>
							<td><input class="form-control" type="text" name="maxc<%= i %>" value="<%= rs.getInt(8) %>" required></td>
							<td><input class="btn btn-warning" type="button" value="REMOVE" onclick = "removeViews()"></td>
						</tr>
						
						<%
				}
				else{
					System.out.println(i);
							%>
							
							<tr>
								<td>
									<input class="form-control" type="text" name="sessionid<%= i %>" readOnly>
									<input class="form-control" type="hidden" name="sessionno<%= i %>" >
								</td>
								<td><input class="form-control" type="text" name="forwhom<%= i %>" required></td>
								<td><input class="form-control" type="text" name="start<%= i %>" required></td>
								<td><input class="form-control" type="text" name="end<%= i %>" required></td>
								<td><input class="form-control" type="text" name="currentcap<%= i %>" readOnly></td>
								<td><input class="form-control" type="text" name="maxc<%= i %>" required></td>
								<td><input class="btn btn-warning" type="button" value="REMOVE" onclick = "removeViews()"></td>
							</tr>
							
							<%
						
				}
			}
		}
		
		catch(Exception e){
			System.out.println(e);
		}
					 
					 
	}
		
	
	%>	
		</table>
		<input class="btn btn-success"  type="submit" name="save" id="save" value="SAVE">
		<input class="btn btn-success"  type="button" name="reset" id="reset" value="RESET" onclick = "resetViews()">
	</form>

     
      </div>

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
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const getCount = urlParams.get('count');

localStorage.setItem('session_count', getCount);

var count = localStorage.getItem('session_count');

function redirect123(){
	localStorage.setItem('session_count', count);
	window.location.href = "coach_profile.jsp?count="+count;
}

function addViews() 
{
  localStorage.setItem('session_count', ++count);
  window.location = "coach_profile.jsp?count="+count;
}

function removeViews() 
{
  localStorage.setItem('session_count', --count);
  window.location.href = "coach_profile.jsp?count="+count;
}

function resetViews() 
{
  localStorage.setItem('session_count', 0);
  window.location.href = "coach_profile.jsp?count="+count;
}

document.getElementById("addremove-form").action =  "practise_session_operations.jsp?count="+count;
</script>
</html>