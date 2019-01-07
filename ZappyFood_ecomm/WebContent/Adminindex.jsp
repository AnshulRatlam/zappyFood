<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<%@include file="head_link.jsp" %>
    <link rel="stylesheet" href="style.css">
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
</head>
<body>



<body id="LoginForm">

  <div style="margin-top:10%;">
  <% 
String m = (String)request.getAttribute("msg") ;
if (m!=null)
{
	%>
	<div class="alert alert-danger alert-dismissible col-xs-4">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><%= m %></strong> 
  </div>
	<% 
	
}

 
%>
  </div>
  
<div class=" main-login main-center panel">
   <h2>Admin Login</h2>
   <p>Please enter your email and password</p>
   </div>
   
  
   
<div class="main-login main-center container">
<h1 class="form-heading">login</h1>
<div class="login-form">
<div class="main-div">
      <form id="Login" method="post" action="AdminLogin">

        <div class="form-group">


            <input type="text" class="form-control" id="inputEmail" name="name" placeholder="Email Address">

        </div>

        <div class="form-group">

            <input type="password" class="form-control" name="psw" id="inputPassword" placeholder="Password">

        </div>
        <div class="forgot">
        <a href="reset.html">Forgot password?</a>
</div>
        <button type="submit" class="btn btn-primary">Login</button>

    </form>
    </div>
<p class="botto-text"> Designed by Anshul Sharma</p>
</div></div>


</html>