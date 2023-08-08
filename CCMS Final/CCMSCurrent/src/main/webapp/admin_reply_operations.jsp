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

String send_to = request.getParameter("send_to");
String send_reply = request.getParameter("send_reply");

//calender
Calendar cal = Calendar.getInstance();
SimpleDateFormat dateformat = new SimpleDateFormat("E, MMM dd yyyy");
SimpleDateFormat timeformat = new SimpleDateFormat("h:mm a");

String to = "adunarkar2004@gmail.com";
String from = "<sender's mail>"; 
String host = "smtp.gmail.com"; //or IP address  
String pass = "<password>;

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

try
{  
   MimeMessage message = new MimeMessage(ses);  
   message.setFrom(new InternetAddress(from));  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
   message.setSubject("Update on your club status by Sportify");  
   message.setContent(
           "<br>Dear Customer, <br><br>" + send_reply + "<br><br> Explore our cricket clubs and join your favourite at <a href='http://localhost:8080/CCMSCurrent/index.jsp'> Sportify.com</a> Thankyou for reaching us out.<br> <br>By Administrator, <br>Sportify Cricket Academy." ,
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
 

response.sendRedirect("admin_notifications_contact_us.jsp");

%>