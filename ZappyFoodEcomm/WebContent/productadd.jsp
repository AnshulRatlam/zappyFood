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
			<div class="row main">
				<div class="main-login main-center">
				<h5>Add product</h5>
					<form action="UploadProduct" method="post" enctype="multipart/form-data">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Product Name</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="pname"  id="name"  placeholder="Enter your Name"/>
								</div>
								 <span id="msg"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">product price</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="price" id="email"  placeholder="Enter price"/>
								   
								</div>
							</div>
						</div>
                     <div class="form-group">
							<label  class="cols-sm-2 control-label">Description</label>
							<div class="cols-sm-5">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<textarea class="form-control" name="des" ></textarea>
									</div>
							</div>
						</div>
                     
                     <div class="form-group" >
							<label  class="cols-sm-2 control-label" >category</label>
							
								
									<select class="form-control" name="category">
  
								    <option value="ready to cook">ready to cook</option>
								    <option value="ready to eat">ready to eat</option>
								    <option value="ready to drink">ready to drink</option>
								    
								  
								</select>
								
							
						</div>
						<div class="form-group">
						<label class="cols-sm-2 control-label" >Image</label>
                      <input   class="form-control" type="file" name="file" />
                     </div>
						

						<div class="form-group ">
							<input type="submit" id="button" value="submit" class="btn btn-primary btn-lg btn-block login-button"/>
						</div>
						
					</form>
				</div>
			</div>
		</div>


<script type="text/javascript">
$(document).ready(function(){
	$("#name").blur(function(){
	    
		var name=$("#name").val();
		//alert(email);
	var	mydata="id="+name;
		
	 $("#msg").html("<img src='assets/img/pc.gif' height='50' width='50' ><font color=gray> Checking availability...</font>");
	 
	 $.ajax({
			url:'CheckProductName',
			data:mydata,
			type:'post',
			success:function(response){
			//	alert(response);
				$("#msg").html(response);
				if(response.includes("Already Exist"))
				$("#name").val("");
			}
		 });
	});
});
</script>















</body>
</html>