<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head_link.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">
 <% 
	  	String uid=(String)session.getAttribute("uid");
 if(uid==null)
 {
 
	 response.sendRedirect("index.jsp");
 
}
	   %>
	<center><font color=red><h1>Welcome,<%=uid%></h1></font><hr/>
	</center>
 
  <h3>Admin Panel</h3>
  <p>Bank Policy and Admin Panel Detail</p>
</div>


</body>
</html>