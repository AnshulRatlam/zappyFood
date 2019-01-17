<%@page import="Bean.Order_Bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList,Bean.Order_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head_link.jsp" %>
    <link rel="stylesheet" href="style.css">
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

</head>
<body>

<%@include file="header.jsp" %>
<% 
	  	String uid=(String)session.getAttribute("uid");
     if(uid==null)
      {
      
    	 response.sendRedirect("index.jsp");
      
     }
	   %>

       ${msg}

	  <div class="container">
	  <table class="table table-striped">
	  <tr>
	  <th scope="col">S.no</th>
	  <th scope="col">Quantity</th>
	  <th scope="col">Price</th>
	  <th scope="col">User</th>
	  <th scope="col">Address</th>
	  <th scope="col">Status</th>
	  <th scope="col">Dispatch</th>
	  <th scope="col">Not Available</th>
	  
	  </tr>
	 
	 <% 
 ArrayList<Order_Bean> list=(ArrayList<Order_Bean>)request.getAttribute("LIST");
 
 %>
 
 <%
   for(Order_Bean ee:list)
   {
	  %>
   	 <tr>
   	<td scope="row"> <%=ee.getOid()%> </td>
	<td scope="row"> <%=ee.getQuantity() %>  </td>
	 <td scope="row"><%=ee.getPrice()  %> </td>
	 <td scope="row"><%=ee.getUser() %></td>
	 <td scope="row"><%=ee.getAddress() %> </td>
	 <td scope="row"><%
	 
	 if(ee.getStatus()==0)
	 {
	    out.println("Pending");	 
	 }
	 %> </td>
	 
	 <td><a href="orderDispatch?oid=<%=ee.getOid()%>&action=1" class="glyphicon glyphicon-edit"></a></td>
	 
	 <td><a href="orderDispatch?oid=<%=ee.getOid()%>&action=2" class="glyphicon glyphicon-remove-sign" onClick="return confirm('Do you really want to delete this record?')"></a></td>
	 <tr/>
	 <%
	 }
  %>
	 
	  </table>
	  </div>
	  
	  

</body>
</html>