<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
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
String mem_email = session.getAttribute("Email").toString();

int flag = 0;
int req_flag =0;
int match_ended = 0;
int flag000 = 0;
int z = 1;
ArrayList<String> excludechid = new ArrayList<String>();

String date_time = "";
String venue = "";
String chid = "";
  %>
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
                Statement c = con.createStatement();
            ResultSet cname = c.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
            cname.next();
           
            %>
            <h4><%= cname.getString(1) %></h4>
               
            </div>
           
            <ul>
           
                <li class="active"><a href="member_notifications.jsp"><i class="bi bi-bell-fill"></i>Notifications</a></li>
                <li><a href="member_coach_profile.jsp"><i class="bi bi-clipboard-check"></i>Club Coach</a></li>
                <li><a href="all_mmembers.jsp"><i class="bi bi-people-fill"></i>Club Members</a></li>
                <li><a href="all_mteam.jsp"><i class="bi bi-person-check-fill"></i>Team</a></li>
            
                <li><a href="member_profile.jsp"><i class="bi bi-person-circle"></i>Edit My Profile</a></li>
                <li><a href="logout.jsp" ><i class="bi bi-box-arrow-left"></i>Logout</a></li>
            </ul>
       </div>

       
        <div class="member-login">
         
            <div class="member-noti">
                <div class="tabs">
                  <div class="active" onclick="window.location.href='member_notifications.jsp'" >All</div>
                  <div class="divider-tabs"></div>
                  <div onclick="window.location.href='member_notifications.jsp'" >Matches</div>
                  <div class="divider-tabs"></div>
                  <div onclick="window.location.href='member_notifications.jsp'" >By Coach</div>
                </div>
                <div class="noti-content">
                    <table class="table table-sm table-dark">
                        <thead>
                          <tr>
                            <tr>
                     <th scope="col">#</th>
                     <th scope="col">Description</th>
                     <th scope="col">Date</th>
                     <th scope="col">Time</th>
                     <th scope="col"></th>
                     <th scope="col"></th>
                     
                          </tr>
                        </thead>
                        <tbody>
                        <%
                        String mem_id = "";
                  String match_end_status="";
                    Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("SELECT Member_Id,Email FROM member WHERE (Status = 'TS' OR Status = 'T')  AND Club_Id = '" + session_Club_Id + "' AND Email = '"+ mem_email +"'");
           
                if(rs2.next())
                {
                mem_id = rs2.getString(1);
                flag = 1;
             
                }
          
                if(flag == 1)
                {
                String match_status ="";
                Statement st = con.createStatement();
                ResultSet rs= st.executeQuery("Select * FROM notifications_team WHERE Visibility = '"+ session_Club_Id +"' ORDER BY Notification_No DESC");
               
                int i = 1;
                while(rs.next())
                {
               
                	if(rs.getString(7).equals("") && rs.getString(6).equals("match"))
                		{
                		%>
                        <tr>
                          <th scope="row"><%= z++ %></th>
                           <td><%= rs.getString(3)%></td>
                     <td><%= rs.getString(4) %></td>
                     <td><%= rs.getString(5) %></td>
                     <td></td>
                     <td></td></tr>
                         
                          <%
                		}
                	
                	if(rs.getString(7).equals("") && rs.getString(6).equals("by coach"))
            		{
            		%>
                    <tr>
                      <th scope="row"><%= z++ %></th>
                       <td>BY COACH: <br><%= rs.getString(3)%></td>
                 <td><%= rs.getString(4) %></td>
                 <td><%= rs.getString(5) %></td>
                 <td></td>
                 <td></td></tr>
                     
                      <%
            		}
                	
                	if(rs.getString(7).equals("") && rs.getString(6).equals("by admin"))
            		{
            		%>
                    <tr>
                      <th scope="row"><%= z++ %></th>
                       <td>BY ADMIN: <br><%= rs.getString(3)%></td>
                 <td><%= rs.getString(4) %></td>
                 <td><%= rs.getString(5) %></td>
                 <td></td>
                 <td></td></tr>
                     
                      <%
            		}
                	if(rs.getString(7).equals("") && rs.getString(6).equals("session changed"))
            		{
            		%>
                    <tr>
                      <th scope="row"><%= z++ %></th>
                       <td><%= rs.getString(3)%></td>
                 <td><%= rs.getString(4) %></td>
                 <td><%= rs.getString(5) %></td>
                 <td></td>
                 <td></td></tr>
                     
                      <%
            		}
                	
               if(!rs.getString(7).equals(""))
               {
               Statement st06 = con.createStatement();
                   ResultSet rs06= st06.executeQuery("Select Venue_id, Challenge_Date, Challenge_Time, match_status FROM challenge WHERE Challenge_Id = '"+ rs.getString(7) +"'");
           if(rs06.next())
           {
           match_end_status = rs06.getString(4);
           date_time = " on " + rs06.getString(2) + ", " + rs06.getString(3);
                 
           Statement st09 = con.createStatement();
                      ResultSet rs09= st09.executeQuery("SELECT Venue_Name, Venue_Address FROM venue WHERE Venue_Id = '"+ rs06.getString(1) +"'");
                      rs09.next();
                     venue = " at " + rs09.getString(1) + ", " + rs09.getString(2);
              }
               }
               
       
                  if(match_end_status.equals("Ongoing"))
                  {
                
                  Statement st3 = con.createStatement();
                           ResultSet rs3= st3.executeQuery("Select Email, Member_Id FROM member WHERE Email = '"+ mem_email + "' AND Club_Id='"+ session_Club_Id +"'");
                           
                           String status = "";
                           if(rs3.next())
                           {
                           Statement st31 = con.createStatement();
                           ResultSet rs31 = st31.executeQuery("Select Status FROM team WHERE Challenge_Id = '" + rs.getString(7) + "' AND Member_Id = '"+ rs3.getString(2) + "' AND Club_Id='"+ session_Club_Id +"'");
                           if(rs31.next())
                           {
                           status = rs31.getString(1);
                           
                         
                           if(status.equals("Approved"))
                           {
                     
                           %>
                                    <tr>
                                      <th scope="row"><%= z++ %></th>
                                       <td><%= rs.getString(3) + date_time + venue%></td>
                                 <td><%= rs.getString(4) %></td>
                                 <td><%= rs.getString(5) %></td>
                                     
                                      <%
                                    
                                      if(rs.getString(6).equals("match"))
                        {
                                   
                                      %>
                                     
                                      <td>You have approved for this match.</td>
                      <td></td>
                 
                                    </tr>
                                 
                                 <%
                               
                           }
       
                         
                           }    
                           
                           else if(status.equals("Pending"))
                           {
                           
                  %>
                                   <tr>
                                     <th scope="row"><%= i++ %></th>
                                     <td><%= rs.getString(3)+ date_time + venue %></td>
                                     <td><%= rs.getString(4) %></td>
                                     <td><%= rs.getString(5) %></td>
                                   
                                     <%
                                     if(rs.getString(6).equals("match") )
                      {
                                   
                                     %>
                                     <td><button type="submit"><a href = "team_approval.jsp?member_id=<%= mem_id %>&status=approved&ch_id=<%= rs.getString(7) %>"><i class="bi bi-check"></i> Accept</a></button></td>
                        <td><button type="submit"><a href = "team_approval.jsp?member_id=<%= mem_id %>&status=disapproved&ch_id=<%= rs.getString(7) %>"><i class="bi bi-x"></i> Reject</a></button></td>
                        </tr>
                     <%}
                   
                            }
                           
                           
                           
                           
                           
                           } }
                 
                           }
                           
                  else if(match_end_status.equals("Finished"))
                           {
                        
                           %>
                                    <tr>
                                      <th scope="row"><%= z++ %></th>
                                       <td><%= rs.getString(3) + date_time + venue%></td>
                                 <td><%= rs.getString(4) %></td>
                                 <td><%= rs.getString(5) %></td>
                                     
                                     
                                      <td>This match is finished.</td>
                      <td></td>
                     
                                    </tr>
                                 
                                 <%
                           }
                           }
                           
                }
                else if(flag == 0)
                {
                // member swapped
             Statement st5 = con.createStatement();
             ResultSet rs55 = st5.executeQuery("SELECT include_from_mem, Challenge_Id FROM challenge WHERE match_status = 'Ongoing' AND (ch_club = '" + session_Club_Id + "' OR opp_club = '" + session_Club_Id + "')");
           
              while(rs55.next())
              {
                
                    if(!rs55.getString(1).equals(" "))
                    {
                    String includestr = rs55.getString(1);
                  String includestrArray[] = includestr.split(" ");
                 
                    for (int i = 1; i < includestrArray.length; i++)
                    {
                   
                      Statement st51 = con.createStatement();
                      ResultSet rs551 = st51.executeQuery("SELECT Email FROM member WHERE Member_Id = '"+ includestrArray[i] +"'");
                      if(rs551.next())
                      {
                      if(rs551.getString(1).equals(mem_email))
                      {
                     
                      excludechid.add(rs55.getString(2));
                     
                    //team side
                      Statement st0 = con.createStatement();
                      ResultSet rs0= st0.executeQuery("Select * FROM notifications_team WHERE (Visibility = '"+ session_Club_Id +"' OR Visibility = '" + mem_email + "') AND Challenge_Id = '" + rs55.getString(2) + "' AND Noti_Category = 'match'  ORDER BY Notification_No DESC");
                      while(rs0.next())
                 {
                   if(!rs0.getString(7).equals(""))
                   {
              Statement st06 = con.createStatement();
                      ResultSet rs06= st06.executeQuery("Select Venue_id, Challenge_Date, Challenge_Time FROM challenge WHERE Challenge_Id = '"+ rs55.getString(2) +"'");
              if(rs06.next())
              {
              date_time = " on " + rs06.getString(2) + ", " + rs06.getString(3);
                     
              Statement st09 = con.createStatement();
                         ResultSet rs09= st09.executeQuery("SELECT Venue_Name, Venue_Address FROM venue WHERE Venue_Id = '"+ rs06.getString(1) +"'");
                         rs09.next();
                        venue = " at " + rs09.getString(1) + ", " + rs09.getString(2);
                 }
                  }
                     
                              Statement st3 = con.createStatement();
                              ResultSet rs3= st3.executeQuery("SELECT Member_Id FROM team WHERE Club_Id='"+ session_Club_Id +"' AND Challenge_Id = '" + rs55.getString(2) + "'");
                              int flag00 = 0;
                              while(rs3.next())
                              {
                              Statement st31 = con.createStatement();
                              ResultSet rs31= st31.executeQuery("SELECT Email FROM member WHERE Member_Id = '" + rs3.getString(1) + "'");
                              rs31.next();
                              if(rs31.getString(1).equals(mem_email)){
                              flag00 = 1;
                              }
                              }
                              if(flag00 == 1)
                              {
                              %>
                                       <tr>
                                         <th scope="row"><%= z++ %></th>
                                         <td><%= rs0.getString(3) + date_time + venue%></td>
                                         <td><%= rs0.getString(4) %></td>
                                         <td><%= rs0.getString(5) %></td>
                                         
                                         <%
                                         if(rs0.getString(6).equals("match"))
                          {
                                         %>
                                         <td>You have approved for this match.</td>
                         <td></td>
                         <%
                         }
                         %>
                                       </tr>
                                     
                                   
                                    <%
                              }
                              else
                              {
                      %>
                                       <tr>
                                         <th scope="row"><%= z++ %></th>
                                         <td>You have been selected as team player for this match. <%= rs0.getString(3)+ date_time + venue %></td>
                                         <td><%= rs0.getString(4) %></td>
                                         <td><%= rs0.getString(5) %></td>
                                         
                                         <%
                                         if(rs0.getString(6).equals("match"))
                          {
                                         
                                         %>
                                         <td><button type="submit"><a href = "team_approval.jsp?member_id=<%= includestrArray[i] %>&status=approved&ch_id=<%= rs55.getString(2) %>"><i class="bi bi-check"></i> Accept</a></button></td>
                         <td><button type="submit"><a href = "team_approval.jsp?member_id=<%= includestrArray[i] %>&status=disapproved&ch_id=<%= rs55.getString(2) %>""><i class="bi bi-x"></i> Reject</a></button></td>
                         <%
                         }
                         %>
                                       </tr>
                                     
                                   
                                    <%
                              }
                      }
                    }
                      }
                    }
                    }
              }
       
           //member side
           
        Statement st = con.createStatement();
        ResultSet rs= st.executeQuery("Select * FROM notifications_members WHERE (Visibility = '"+ session_Club_Id +"' OR Visibility = 'all') ORDER BY Notification_No DESC");
    
        while(rs.next())
        {
        flag000 = 0;
                    for (int k = 0; k < excludechid.size(); k++)
{
                    if(rs.getString(7).equals(excludechid.get(k)))
{
                    rs.next();
                    flag000 = 1;
                    break;
}
                   
                   
}
                    if(flag000 == 1){
                continue;
                }
          if(!rs.getString(7).equals(""))
          {
              Statement st6 = con.createStatement();
                  ResultSet rs6= st6.executeQuery("SELECT Venue_id, Challenge_Date, Challenge_Time FROM challenge WHERE Challenge_Id = '"+ rs.getString(7) +"'");
              if(rs6.next()){
                date_time = " on " + rs6.getString(2) + ", " + rs6.getString(3);
               
                Statement st9 = con.createStatement();
                  ResultSet rs9= st9.executeQuery("SELECT Venue_Name, Venue_Address FROM venue WHERE Venue_Id = '"+ rs6.getString(1) +"'");
                  rs9.next();
                  venue = " at " + rs9.getString(1) + ", " + rs9.getString(2);
              }

          // to request member to participate in the match
          Statement st15 = con.createStatement();
              ResultSet rs15= st15.executeQuery("SELECT ch_club, opp_club, match_status FROM challenge WHERE Challenge_Id = '"+ rs.getString(7) +"'");
              req_flag = 0;
              match_ended = 0;
             
              if(rs15.next())
                  {
                  if(rs15.getString(3).equals("Finished"))
                  {
                  match_ended = 1;
                  }
                  else if(rs15.getString(1).equals(session_Club_Id)||rs15.getString(2).equals(session_Club_Id))
                      {
                      req_flag = 1;
                      }
                 
              }
        }
                   
           
              %>
                               <tr>
                                 <th scope="row"><%= z++ %></th>
                                 <td><%= rs.getString(3) + date_time + venue %></td>
                                 <td><%= rs.getString(4) %></td>
                                 <td><%= rs.getString(5) %></td>
                                 
                                 <%
                                 if(req_flag == 1)
                                 {
                                 %>
                                 <td><a href="member_send_req_to_participate.jsp?chid=<%= rs.getString(7) %>">Request to participate</a></td>
                                 <td></td>
                                 <%
                                 }
                                 else if(match_ended == 1)
                                 {
                                 %>
                                 <td><a href="">Match finished</a></td>
                                 <td></td>
                                 <%
                                 }
                                 else{
                                  %>
                                  <td></td>
                                  <td></td>
                                 
                                  <%
                                 }
                                 %>
                               </tr>
                           <%
                  
        }
      }
      excludechid.clear();
         /%>
                       
               </tbody>
           </table>
       
                </div>
            </div>
           
            <%
            String status = "";
            PreparedStatement st10 = con.prepareStatement("SELECT * FROM member WHERE Email = ?");
            st10.setString(1, mem_email);
            ResultSet rs10 = st10.executeQuery();
            rs10.next();
            %>
           
            <div class="member-profile">
              <div class="divider"></div>
              <div class="title">My profile</div>
              <div class="divider"></div>
             
              <%
         
              if(rs10.getString(11).equals("M")||rs10.getString(11).equals("MS")){
             status = "Member";
              }
              else if(rs10.getString(11).equals("T")||rs10.getString(11).equals("TS")){
             status = "Team";
              }
              %>
             
              <div class="status">Status : <%= status %></div>
              <div class="profile-image">
              <%
              Statement img = con.createStatement();
            ResultSet p = img.executeQuery("Select Image FROM member WHERE Club_Id = '" + session_Club_Id + "' AND Email = '" + mem_email + "'");
            if(p.next())
            {
            %>
                <img src="assets/images/<%= p.getString(1) %>" alt="" height="200" width="200" ><%} %>
             
            
              </div>
             
              <div class="details">
                <dl class="row">

<%
PreparedStatement st11 = con.prepareStatement("SELECT Club_Name FROM clubs WHERE Club_Id = ?");
           st11.setString(1, rs10.getString(8));
           ResultSet rs11 = st11.executeQuery();
           rs11.next();
%>

                   <dt class="col-sm-4">Club</dt>
                  <dd class="col-sm-6"><%= rs11.getString(1) %></dd>

                  <dt class="col-sm-4">Name</dt>
                  <dd class="col-sm-6"><%= rs10.getString(3) %></dd>
               
                  <dt class="col-sm-4">Email Id</dt>
                  <dd class="col-sm-6">
                    <%= rs10.getString(4) %>
                  </dd>
               
                  <dt class="col-sm-4">Contact</dt>
                  <dd class="col-sm-6"><%= rs10.getString(5) %></dd>

                  <dt class="col-sm-4">Age</dt>
                  <dd class="col-sm-6"><%= rs10.getString(6) %></dd>

                  <dt class="col-sm-4">Interest</dt>
                  <dd class="col-sm-8"><%= rs10.getString(10) %></dd>


<%
PreparedStatement st12 = con.prepareStatement("SELECT Start_Time, End_Time FROM session WHERE Session_Id = ?");
           st12.setString(1, rs10.getString(9));
           ResultSet rs12 = st12.executeQuery();
           rs12.next();
%>

                  <dt class="col-sm-4">Session</dt>
                  <dd class="col-sm-8"><%= rs10.getString(9) + " - " + rs12.getString(1) +" to " + rs12.getString(2) %></dd>

                </dl>

                <div class="edit-button">
                  <button onclick="window.location = 'member_profile.jsp'">Edit</button>
                </div>
 
              </div>
              <!-- details -->
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
</html>
