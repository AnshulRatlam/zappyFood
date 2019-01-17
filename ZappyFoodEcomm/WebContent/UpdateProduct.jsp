<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  		 response.sendRedirect("index.jsp");
	   %>
	
	
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


	
 <%@page import="Bean.MY_BEAN" %>
 <%
MY_BEAN e=(MY_BEAN)request.getAttribute("pid");
 %>
 
 <div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h5>Add product</h5>
					<form action="./UploadProductservlet" method="post">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Product ID</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input  type="text"  value="<%=e.getSno()%>" readonly  class="form-control" name="pid" id="email">
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Product Name</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text"  value="<%=e.getProductname()%>"  class="form-control" id="pwd" name="pname" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">product price</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control"  value="<%=e.getProductprice()%>"  name="price" id="email">
								</div>
							</div>
						</div>
                     <div class="form-group">
							<label  class="cols-sm-2 control-label">Description</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<textarea name="des" class="form-control" > <%=e.getProductdesc()%> </textarea>
									</div>
							</div>
						</div>
                     
                     <div class="form-group" >
							<label  class="cols-sm-2 control-label" >category</label>
							
								
								  <select class="form-control" value="<%=e.getCategory()%>"  name="category">
  
								    <option value="ready to cook">ready to cook</option>
								    <option value="ready to eat">ready to eat</option>
								    <option value="ready to drink">ready to drink</option>
								    
								  
								</select>
								
							
						</div>
						
						

						<div class="form-group ">
							<input type="submit" id="button" value="submit" class="btn btn-primary btn-lg btn-block login-button"/>
						</div>
						
					</form>
				</div>
			</div>
		</div>
 
 
 <%---- 
 
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
    
                           <select class="form-control" value="<%=e.getCategory()%>"  name="category">
  
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
</div> --%>
</body>
</html>