<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%	String uid=(String)session.getAttribute("uid");
String m = (String)request.getAttribute("msg") ; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@include file="custheadlink.jsp" %>
</head>
<body>
<%@include file="Custhead.jsp"  %>


  <div class="page_login_section">
                <div class="container">
                    ${msg}
                    <div class="row">
                        <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-10 offset-sm-1">
                            <div class="login_page_form">
                                <form action="./custloginchek" method="post">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="input_text">
                                            	<label for="name">Username or email <span>*</span></label>
                                            	<input name="name" id="name" type="text">    
                                            </div>
                                        </div>
                                         <div class="col-12">
                                            <div class="input_text">
												<label for="password">Passwords <span>*</span></label>
												<input name="psw" id="password" type="password"> 
											</div>   
                                        </div>
                                        <div class="col-12">
                                            <div class="login_submit">
                                            	<input class="inline" value="Login" name="Login" type="submit">
												<label class="inline" for="rememberme">
													<input id="rememberme" type="checkbox">
													Remember me	
												</label>   
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