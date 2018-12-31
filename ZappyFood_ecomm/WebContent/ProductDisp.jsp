<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList,Bean.MY_BEAN" %>
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
	  <th scope="col">Category</th>
	  <th scope="col">PNAME</th>
	  <th scope="col">PRICE</th>
	  <th scope="col">DESCRIPTION</th>
	  <th scope="col">IMAGE</th>
	  <th scope="col">Update</th>
	  <th scope="col">Delete</th>
	  <th scope="col">IMAGE Update</th>
	  </tr>
	 
	 <% 
 ArrayList<MY_BEAN> list=(ArrayList<MY_BEAN>)request.getAttribute("LIST");
 
 %>
 
 <%
   for(MY_BEAN ee:list)
   {
	  %>
   	 <tr>
   	<td scope="row"> <%=ee.getSno()%> </td>
	<td scope="row"> <%=ee.getCategory() %>  </td>
	 <td scope="row"><%=ee.getProductname()  %> </td>
	 <td scope="row"><%=ee.getProductprice() %></td>
	 <td scope="row"><%=ee.getProductdesc() %> </td>
	 <td><img src="imgupload/<%=ee.getFilename()%>" height="100" width="100"/> </td>
	 <td > <a href="ProductUpdate?pid=<%=ee.getSno()%>" class="glyphicon glyphicon-edit"></a></td>
	 <td><a href="deleteProduct?pid=<%=ee.getSno()%>" class="glyphicon glyphicon-remove-sign" onClick="return confirm('Do you really want to delete this record?')"></a></td>
	 <td><a href="productUpdateImage?pid=<%=ee.getSno()%>" class="glyphicon glyphicon-camera"></a></td>
	 <tr/>
	 <%
	 }
  %>
	 
	  </table>
	  </div>
	  
	  

</body>
</html>