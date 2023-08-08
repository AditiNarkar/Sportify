<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Arrays"%>
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
int flag = 0;
String msg = "";

    String challenge_club = request.getParameter("challenge_club");
    String ch_date = request.getParameter("challenge_date");
    String ch_time = request.getParameter("challenge_time");
    String challenge_am_pm = request.getParameter("challenge_am_pm");
    String challenge_time = ch_time.concat(" ").concat(challenge_am_pm);
    
    SimpleDateFormat input_format = new SimpleDateFormat("yyyy-MM-dd");
    Date d1 = input_format.parse(ch_date);
    SimpleDateFormat output_format = new SimpleDateFormat("E, MMM dd yyyy");
    String challenge_date = output_format.format(d1);
    
    SimpleDateFormat input_format1 = new SimpleDateFormat("h:mm a");
    Date d11 = input_format1.parse(challenge_time);
    SimpleDateFormat output_format1 = new SimpleDateFormat("h:mm a");
    String time = output_format1.format(d11);
    
	Statement stg2 = con.createStatement();
    ResultSet rs = stg2.executeQuery("Select * FROM challenge");
   
    while(rs.next())
    {
        if (rs.getString(3).equals(session_Club_Id) && rs.getString(4).equals(challenge_club) && rs.getString(6).equals(challenge_date) && rs.getString(7).equals(time) && rs.getString(9).equals("Ongoing"))
        {
            if (rs.getString(8).equals("Unapproved")) 
            {
                msg = "Unapproved";
                flag = 1;
                break;
            } 
            else if (rs.getString(8).equals("Approved")) 
            {
            	msg = "Approved";
                flag = 1;
                break;
            }
        }
    }
    
    if(flag == 1)
    {
    	response.sendRedirect("challenge.jsp?msg="+msg);
    }
    
    else if(flag==0) 
    {
        	Statement stg3 = con.createStatement();
            ResultSet rs1 = stg3.executeQuery("SELECT Venue_Id,Venue_Name,Venue_Address FROM venue WHERE Venue_Id = (SELECT Venue_Id FROM clubs WHERE Club_Id = '"+ session_Club_Id + "')");
            if (rs1.next())
            {
                String venue_id     = rs1.getString(1);
                String venue_n      = rs1.getString(2);
                String venue_addr   = rs1.getString(3);
                String venue_name   = venue_n.concat(", ").concat(venue_addr);
                
                String insert_query = "INSERT INTO challenge(ch_club,opp_club,Venue_Id,Challenge_Date,Challenge_Time,Status,match_status) Values(?,?,?,?,?,'Unapproved','Ongoing')";
                PreparedStatement pst = con.prepareStatement(insert_query);
                pst.setString(1, session_Club_Id);
                pst.setString(2, challenge_club);
                pst.setString(3, venue_id);
                pst.setString(4, challenge_date);
                pst.setString(5, time);
                pst.executeUpdate();
    
                String ai = "CALL autoinc_challenge()";
                Statement auto_inc = con.createStatement();
                auto_inc.executeUpdate(ai);
                
                PreparedStatement ps1 = con.prepareStatement("SELECT Challenge_Id FROM challenge ORDER BY Challenge_No DESC");
                ResultSet rs6 = ps1.executeQuery();
                rs6.next();
              
                Statement stg4 = con.createStatement();
                ResultSet rs2 = stg4.executeQuery("SELECT Challenge_Id, Challenge_Date, Challenge_Time FROM challenge");
                while (rs2.next()) 
                {
                    String datetime = rs2.getString(2).concat(" ").concat(rs2.getString(3));
                    
                    SimpleDateFormat sdformat = new SimpleDateFormat("E, MMM dd yyyy h:mm a");
                    Date d2 = sdformat.parse(datetime);
                
                    Calendar cal = Calendar.getInstance();
                    Date current_date = sdformat.parse(sdformat.format(new Date()));
                    String current_date1 = sdformat.format(cal.getTime());
                    current_date = sdformat.parse(current_date1);
    
                    if (d2.compareTo(current_date) > 0 || (d2.compareTo(current_date) == 0))
                    {
                    	Statement stg1 = con.createStatement();
                        stg1.executeUpdate("UPDATE challenge SET match_status = 'Ongoing' WHERE Challenge_Id = '" + rs2.getString(1) + "'");
                    
                    } 
                    else if (d2.compareTo(current_date) < 0) 
                    {
                    	Statement stg5 = con.createStatement();
                        stg5.executeUpdate("UPDATE challenge SET match_status = 'Finished' WHERE Challenge_Id = '" + rs2.getString(1) + "'");
                        
                        Statement stg6 = con.createStatement();
                        stg6.executeUpdate("DELETE FROM team WHERE Challenge_Id = '" + rs2.getString(1) + "'");
                    }  
                       
                }
    
                Statement stg6 = con.createStatement();
                ResultSet rs3 = stg6.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + challenge_club + "'");
                
                if (rs3.next()) 
                {
    
                    String club_name = rs3.getString(1);
                    Statement stg7 = con.createStatement();
                    
                    ResultSet rs4 = stg7.executeQuery("SELECT Challenge_Id FROM challenge WHERE ch_club = '" + session_Club_Id + "' AND opp_club = '" + challenge_club + "' AND Venue_Id = '" + venue_id + "' AND Challenge_Date = '" + challenge_date + "' AND Challenge_Time = '" + time + "' AND match_status = 'Ongoing' ");
                   
                    if (rs4.next()) 
                    {
                        String challenge_Id = rs4.getString(1);
                        String coach_noti = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id) Values('"+ session_Club_Id + "',?,?,?,?,?)";
                        String desc = "You have challenged " + club_name;
                        
                        Calendar cal1 = Calendar.getInstance();
                    
                        SimpleDateFormat sdf = new SimpleDateFormat("E, MMM dd yyyy");
                        Date current_date11 = sdf.parse(sdf.format(new Date()));
                        SimpleDateFormat sdf1 = new SimpleDateFormat("h:mm a");
                        
                        PreparedStatement pst1 = con.prepareStatement(coach_noti);
                        pst1.setString(1, desc);
                        pst1.setString(2, sdf.format(cal1.getTime()));
                        pst1.setString(3, sdf1.format(cal1.getTime()));
                        pst1.setString(4, "");
                        pst1.setString(5, challenge_Id);
                        pst1.executeUpdate();
    
                        Statement stg8 = con.createStatement();
                        ResultSet rs5 = stg8.executeQuery("SELECT Club_Name FROM clubs WHERE Club_Id = '" + session_Club_Id + "'");
                        if (rs5.next())
                        {
                            String ch_club_name = rs5.getString(1);
                            String coach_noti1 = "INSERT INTO notifications_coach(Visibility,Description,Date,Time,Noti_Category,Challenge_Id) Values('"+ challenge_club + "',?,?,?,?,?)";
                            
                          
                            String ch =  rs6.getString(1);
                            String desc1 = "<a href='challenge2_accept.jsp?chid=" + ch + "'>Edit your team before accepting.</a>" + ch_club_name + " challenged you. ";
                            
                            PreparedStatement pst2 = con.prepareStatement(coach_noti1);
                            pst2.setString(1, desc1);
                            pst2.setString(2, sdf.format(cal1.getTime()));
                            pst2.setString(3, sdf1.format(cal1.getTime()));
                            pst2.setString(4, "challenge");
                            pst2.setString(5, challenge_Id);
                            pst2.executeUpdate();
    
                        }
                    }
                }
    
                
            }
            response.sendRedirect("coach_notifications.jsp");
        }

%>