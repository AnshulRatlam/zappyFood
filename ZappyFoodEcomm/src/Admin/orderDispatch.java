package Admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Order_Bean;
import dao.my_dao;

/**
 * Servlet implementation class orderDispatch
 */
@WebServlet("/orderDispatch")
public class orderDispatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderDispatch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oid = request.getParameter("oid");
		String Action = request.getParameter("action");
		my_dao d = new my_dao();
		if(Integer.parseInt(Action)==1)
		{
			int x = d.dispatch(Integer.parseInt(oid));
			if(x==1)
			{
				 ArrayList<Order_Bean> list= d.vieworder();
				 String to="itsme.anshul09@gmail.com";
 			     String sub="Thankyou For Shopping";
 			    String msg="Wel-Come ZappyFood your order is Dispatch Your oid is "
 			    		+ ""+oid;
 			    sendMail(to,sub,msg);
			      RequestDispatcher rd=request.getRequestDispatcher("viewpendingorder.jsp");
			      request.setAttribute("msg", "item dispatch Successfully...");
			      request.setAttribute("LIST", list);
			      rd.forward(request, response);
			}
		}
		
		else
		{
			int x = d.notavlaible(Integer.parseInt(oid));
			if(x==1)
			{
				
				ArrayList<Order_Bean> list= d.vieworder();
				String to="itsme.anshul09@gmail.com";
 			     String sub="Thankyou For Shopping";
 			    String msg="Wel-Come ZappyFood your order is not avlaible Your oid is"+oid;
 			    sendMail(to,sub,msg);

			      RequestDispatcher rd=request.getRequestDispatcher("viewpendingorder.jsp");
			      request.setAttribute("msg", "item is not avaliable..");
			      request.setAttribute("LIST", list);
			      rd.forward(request, response);
			}
			

		}
		
	}
	


public void sendMail(String to,String sub,String msg)
{

	String from = "project.chayan@gmail.com";
    final String usename =  "project.chayan@gmail.com";//change accordingly
    final String pasd = "Chayan1234";//change accordingly

    // Assuming you are sending email through relay.jangosmtp.net
    String host = "smtp.gmail.com";

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", "587");

    // Get the Session object.
    Session session = Session.getInstance(props,
    new javax.mail.Authenticator() {
       protected PasswordAuthentication getPasswordAuthentication() {
          return new PasswordAuthentication(usename, pasd);
       }
    });

    try {
       // Create a default MimeMessage object.
       Message message = new MimeMessage(session);

       // Set From: header field of the header.
       message.setFrom(new InternetAddress(from));

       // Set To: header field of the header.
       message.setRecipients(Message.RecipientType.TO,
       InternetAddress.parse(to));

       // Set Subject: header field
       message.setSubject(sub);

       // Now set the actual message
       message.setText(msg);

       // Send message
       
       Transport.send(message);
       } catch (MessagingException e) {
  	  e.printStackTrace();
  	     }		
}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


