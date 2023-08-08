<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>

<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar"%>

<%
String url = "jdbc:mysql://localhost:3306/ccms";
String user = "root";
String pwd = "";
String msg = "";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, pwd);

 // parameters
String status = request.getParameter("status");
String id = request.getParameter("id");
String desc = "";

//calender
Calendar cal = Calendar.getInstance();
SimpleDateFormat dateformat = new SimpleDateFormat("E, MMM dd yyyy");
SimpleDateFormat timeformat = new SimpleDateFormat("h:mm a");

//queries
String update_club = "UPDATE clubs SET Status = ? WHERE Club_Id = ?";
PreparedStatement pst = con.prepareStatement(update_club);
pst.setString(2, id);

if(status.equals("approve"))
{    	
	pst.setString(1, "Approved");
	pst.executeUpdate();
	
	String coach_noti = "INSERT INTO notifications_coach(Visibility,Description,Date,Time) Values(?,?,?,?)";
	PreparedStatement pst1 = con.prepareStatement(coach_noti);
	
	Statement st = con.createStatement();
    ResultSet rsps = st.executeQuery("SELECT COUNT(*) FROM session WHERE Club_Id = '" + id + "'");
    if(rsps.next())
    {
    	int count = rsps.getInt(1);
    	if(count == 0){
			count++;
    	}
    	desc = "Welcome coach, your club has been approved by Sportify. You can now make your club's practise session slots. <a href='coach_profile.jsp?count="+ count +">Click to edit.</a>";
    }
    	
    pst1.setString(1, id);
    pst1.setString(2, desc);
    pst1.setString(3, dateformat.format(cal.getTime()));
	pst1.setString(4, timeformat.format(cal.getTime()));
	
    pst1.executeUpdate();
    
    msg = "We have recieved your club request. Your club request is approved by our team. The details you provided have been registered with us successfully. You can now Login with your registered credentials with <a href='http://localhost:8080/CCMSCurrent/index.jsp'>Sportify.com</a> and can access all the facilities.<br><br> Thankyou for joining us.";
}
else if(status.equals("disapprove"))
{
	pst.setString(1, "Disapproved");
	pst.executeUpdate();
	
	 msg = "We are sorry to inform you that due to some reason your club has been disapproved by Sportify Academy. If you have any further queries, you may contact us.";
}


Statement st_to = con.createStatement();
ResultSet rsto = st_to.executeQuery("SELECT Coach_Name FROM coach WHERE Status = 'Head' AND Club_Id = '" + id + "'");
rsto.next();
String coachname = rsto.getString(1);

String to = "reciever-gmail";
String from = "sender-gmail"; 
String host = "smtp.gmail.com"; //or IP address  
String pass = "sender-password";

//Get the session object  
Properties properties = new Properties();  
properties.put("mail.smtp.host", host);  
//Session ses = Session.getDefaultInstance(properties);  

//Setup mail server
properties.put("mail.smtp.host", host);
properties.put("mail.transport.protocol", "smtp");
properties.put("mail.smtp.starttls.enable", "true");
properties.put("mail.smtp.port", "587");
properties.put("mail.smtp.auth", "true");
properties.put("mail.user", from);
properties.put("mail.password", pass);

//Get the Session object.// and pass username and password
javax.mail.Session ses = Session.getInstance(properties, new javax.mail.Authenticator() {
	@Override
    protected PasswordAuthentication getPasswordAuthentication() 
    {
        return new PasswordAuthentication(from, pass);
    }
});

// Used to debug SMTP issues
//ses.setDebug(true);

//compose the message  
try
{  
   MimeMessage message = new MimeMessage(ses);  
   message.setFrom(new InternetAddress(from));  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
   message.setSubject("Update on your club status by Sportify");  
   message.setContent(
           "<br>Dear Coach " + coachname + ", <br><br>" + msg + "<br><br> Sincerely, <br> <br>By Administrator, <br>Sportify Cricket Academy. <br><br> <img src = 'C:/Users/admin/Desktop/VPM/MAJOR/CCMS new/CCMSCurrent/src/main/webapp/assets/images/logo1-removebg.png' height='100'> <br><br>This is an auto generated e-mail." ,
          "text/html"
          ); 

   // Send message  
   Transport.send(message);  
   System.out.println("message sent successfully....");  

}
catch (MessagingException mex) 
{
	System.out.println(mex);
} 
 

response.sendRedirect("admin_notifications.jsp");

%>