<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="custheadlink.jsp"  %>
</head>
<body>

<%@include file="Custhead.jsp"  %>

<% 
String m = (String)request.getAttribute("msg") ;
String m1 = (String)request.getAttribute("msg1") ;
if (m!=null)
{
	%>
	<div class="alert alert-success alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><%= m %></strong> 
  </div>
	<% 
	
}
if (m1!=null)
{
	%>
	<div class="alert alert-success alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><%= m1 %></strong> 
  </div>
	<% 
	
}
 
%>
 <div class="page_login_section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="register_page_form">
                                <form method="post" action="./custinsert">
                                    <div class="row">
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <div class="input_text">
												<label for="R_N">First Name <span>*</span></label>
												
												
												<input name="fname" id="R_N" type="text"> 
                                            </div>   
                                        </div>
                                         <div class="col-lg-6 col-sm-6 col-md-6">
                                            <div class="input_text">
												<label for="R_N2">Last Name <span>*</span></label>
												<input name="lname" id="R_N2" type="text">    
											</div>
                                        </div>
                                       
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <div class="input_text">
												<label for="R_N4">Email Address <span>*</span></label>
												<input name="email" id="R_N4" type="text"> 
											</div>   
                                        </div>
                                         <div class="col-lg-6 col-sm-6 col-md-6">
											<div class="input_text">
												<label for="R_N5">Phone<span>*</span></label>
												<input name="mobile" id="R_N5" type="text">  
											</div>  
                                        </div>
                                        
                                        <div class="col-12">
                                            <div class="input_text">
                                            	<label for="R_N7">Address<span>*</span></label>
                                            	<input name="Add" id="R_N7" placeholder="Street address" type="text">    
                                            </div>
                                        </div> 
                                       
                                        <div class="col-12">
                                            <div class="input_text">
												<label for="R_N11">Account password<span>*</span></label>
												<input name="password" id="R_N11" type="text">    
											</div>
                                        </div>
                                        <div class="col-12">
                                            <div class="input_text">
												<label for="R_N12">Confirm password<span>*</span></label>
												<input id="R_N12" type="text"> 
											</div>   
                                        </div>
                                        <div class="col-12">
                                            <div class="input_text">
												<input id="rememberme" type="checkbox"> 
												<label for="rememberme">I agree Terms & Condition</label>   
											</div>
                                        </div>
                                        <div class="col-12">
                                            <div class="login_submit">
                                            	<input value="register" type="submit">
                                            </div>
                                        </div>    
                                    </div>
                                </form>    
                            </div>    
                        </div>    
                    </div>    
                </div>  
            </div>
            
            <!--login section end-->






<%@include file="custfooter.jsp"  %>




</body>
</html>