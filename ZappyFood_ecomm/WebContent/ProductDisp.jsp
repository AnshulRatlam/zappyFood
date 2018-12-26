<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
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

try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

	  PreparedStatement ps=con.prepareStatement("select  * from itemcollection");
	  ResultSet rs=ps.executeQuery();
	  %>
	  <div class="container">
	  <table class="table table-striped">
	  <tr>
	  <th scope="col">S.no</th>
	  <th scope="col">Category</th>
	  <th scope="col">PNAME</th>
	  <th scope="col">PRICE</th>
	  <th scope="col">DESCRIPTION</th>
	  <th scope="col">IMAGE</th>
	  </tr>
	  <%
	  while(rs.next())
	  {
		  %>
		      <tr scope="row">
		      <td ><%=rs.getString("Sno")%></td>
		        <td><%=rs.getString("Category")%></td>
		        <td><%=rs.getString("Product_name")%></td>
		        <td><%=rs.getString("price")%></td>
		         <td><%=rs.getString("Discription")%></td>
		        <td><img src="imgupload/<%=rs.getString("image")%>" height="100" width="100"/></td>
		        </tr>
		  <%
	  }
	  %>
	  </table>
	  </div>
	  <%
	  
	  con.close();
}catch(Exception e)
{
	  System.out.println(e);
}

%>

</body>
</html>