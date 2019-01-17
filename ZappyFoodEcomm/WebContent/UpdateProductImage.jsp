<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div style="margin-top:10%;">
  <% 
String m = (String)request.getAttribute("msg") ;
if (m!=null)
{
	%>
	<div class="alert  alert-success col-xs-4">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><%= m %></strong> 
  </div>
	<% 
	
}

 
%>
  </div>


<!-- <form action="UploadProduct" method="post" enctype="multipart/form-data">
 
 <select name="category">
  
    <option value="ready to cook">ready to cook</option>
    <option value="ready to eat">ready to eat</option>
    <option value="ready to drink">ready to drink</option>
    
  
</select>
 
 
 PName         <input type="text" name="pname" />
 Price         <input type="number" name="price" />
 Description   <textarea name="des" ></textarea>
 Image         <input type="file" name="file" />
              
              <input type="submit" value="Save" />
  
 </form>-->
 

<div class="container">
<%@page import="Bean.MY_BEAN" %>
 <%
MY_BEAN e=(MY_BEAN)request.getAttribute("pid");
 %>
			<div class="row main">
				<div class="main-login main-center">
				<h5>Update Image</h5>
					<form action="productUpdateImage" method="post" enctype="multipart/form-data">
					<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Product ID:</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" value="<%=e.getSno()%>" readonly  class="form-control" name="pid"  id="name"  />
								</div>
							</div>
						</div>
					
 
						
							<div class="form-group">
						<label class="cols-sm-2 control-label" >Image</label>
                        <img src="imgupload/<%=e.getFilename() %>" height="100" width="100"/> 
                     </div>	
						
						
						<div class="form-group">
						<label class="cols-sm-2 control-label" >Update Image</label>
                      <input   class="form-control"  type="file" name="file" />
                     </div>
						

						<div class="form-group ">
							<input type="submit" id="button" value="update" class="btn btn-primary btn-lg btn-block login-button"/>
						</div>
						
					</form>
				
			</div>
			</div>
			</div>
		
















</body>
</html>