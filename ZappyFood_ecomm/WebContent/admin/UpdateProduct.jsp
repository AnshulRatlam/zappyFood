<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	  	String uid=(String)session.getAttribute("uid");
       if(uid==null)
  		 response.sendRedirect("index.jsp");
	   %>
	<center><font color=red><h1>Welcome,<%=uid%></h1></font><hr/>
	
	</center>
	
<% String m=(String)request.getAttribute("msg"); 
    if(m!=null)
    {
  %>	
	<div class="alert alert-success alert-dismissible">
  <strong><%=m%></strong> 
</div>
<%
}
    %>


	<div class="container">
	<div class="col-sm-3">
 
 <%@page import="Bean.MY_BEAN" %>
 <%
MY_BEAN e=(MY_BEAN)request.getAttribute("pid");
 %>
 
    <form action="./UploadProductservlet" method="post">
 
  <div class="form-group">
    <label for="email">Product ID:</label>
    <input type="text"  value="<%=e.getSno()%>" readonly  class="form-control" name="pid" id="email">
  </div>
 
  <div class="form-group">
    <label for="pwd">Product Name:</label>
    <input type="text"  value="<%=e.getProductname()%>"  class="form-control" id="pwd" name="pname" />
  </div>
  
  <div class="form-group">
    <label for="pwd">Select Category:</label>
    
                           <select class="form-control" value="<%=e.getProductname()%>"  name="category">
  
								    <option value="ready to cook">ready to cook</option>
								    <option value="ready to eat">ready to eat</option>
								    <option value="ready to drink">ready to drink</option>
								    
								  
								</select>
    
  </div>
  
  <div class="form-group">
    <label for="email">Product Price:</label>
    <input type="text" class="form-control"  value="<%=e.getProductprice()%>"  name="price" id="email">
  </div>
 
  <div class="form-group">
    <label for="email">Discription:</label>
    <textarea name="des" class="form-control" > <%=e.getProductdesc()%> </textarea>
  </div>
 
  <button type="submit" class="btn btn-default">Update</button>
</form>
</div>
</div></body>
</html>