<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Order_Bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <%@include file="custheadlink.jsp" %>
</head>
<body>

 <% 
	  	String uid1=(String)session.getAttribute("uid");
    String m1 = (String)request.getAttribute("msg") ;
   
        if(uid1==null)
       {%>
        
 
 
	    <%@include file="login.jsp" %>
  
       <%
       }
	   %>
	   <%if(uid1!=null) 
	   
	   {%>
	   
	   <%@include file="Custheaduser.jsp" %>
        <%} %>
<section class="main-content-area my-account ptb-100">
				<div class="container">
	                <div class="account-dashboard">
	                    <div class="row">
	                        <div class="col-sm-12 col-md-3 col-lg-3">
	                            <!-- Nav tabs -->
	                            <ul role="tablist" class="nav flex-column dashboard-list">
	                                <li><a href="#dashboard" data-toggle="tab" class="nav-link active">Dashboard</a></li>
	                                <li> <a href="#orders" data-toggle="tab" class="nav-link">Orders</a></li>
	                                <li><a href="#downloads" data-toggle="tab" class="nav-link">Order History</a></li>
	                               <%--  <li><a href="#address" data-toggle="tab" class="nav-link">Addresses</a></li>
	                                <li><a href="#account-details" data-toggle="tab" class="nav-link">Account details</a></li>
	                                <li><a href="login.html" class="nav-link">logout</a></li>--%>
	                            </ul>
	                        </div>
	                        <div class="col-sm-12 col-md-9 col-lg-9">
	                            <!-- Tab panes -->
	                            <div class="tab-content dashboard-content">
	                                <div class="tab-pane fade show active" id="dashboard">
	                                    <h3>Dashboard </h3>
	                                    <h4>Welcome  <%=uid1%></h4>
	                                    <p>From your account dashboard. you can easily check &amp; view your <a href="#">recent orders</a>, manage your <a href="#">shipping and billing addresses</a> and <a href="#">Edit your password and account details.</a></p>
	                                </div>
	                                <div class="tab-pane fade" id="orders">
	                                    <h3>Orders</h3>
	                                    <div class="organic-table-area table-responsive">
	                                        <table class="table">
	                                            <thead>
	                                                <tr>
	                                                     <th>S.no</th>
	                                                    <th>Order ID</th>
	                                                    <th>Date</th>
	                                                    <th>Status</th>
	                                                    <th>Total</th>
	                                                    	 	 	 	
	                                                </tr>
	                                            </thead>
	                                            
								                 <% 
								 ArrayList<Order_Bean> list=(ArrayList<Order_Bean>)request.getAttribute("LIST");
								 int x =1;
								
														   for(Order_Bean ee:list)
														   {
															   
															   
															  %>
	                                            <tbody>
	                                               
	                                                <tr>
	                                                    <td><%=x %></td>
	                                                    <td><%=ee.getOid() %></td>
	                                                    <td><%=ee.getDateo() %></td>
	                                                    <td><%
	                     if (ee.getStatus()==2)
	                      { %>
	                    	 <span class="text-danger"> <% out.println("out of Stock");%></span>
	                    <% }
	                                                    if (ee.getStatus()==1)
	                          	                      { %>
	                          	                    	 <span class="text-success"> <% out.println("Compeletd");%></span>
	                          	                    <% }                           
	                     else
	                     {%>
	                    	 <span class="text-primary"> <% out.println("Processing");%></span> 
	                    <% }
	                    	 
	                    	 %></td>
	                                                    <td><%=ee.getPrice()*ee.getQuantity() %> </td>
	                                                  
	                                                </tr>
	                                              
	                                               
	                                            </tbody>
	                                              <%
	                                             x++; } %>
	                                        </table>
	                                    </div>
	                                </div>
	                                <div class="tab-pane fade" id="downloads">
	                                    <h3>Downloads</h3>
	                                    <div class="organic-table-area table-responsive">
	                                        <table class="table">
	                                            <thead>
	                                                <tr>
	                                                    <th>Product</th>
	                                                    <th>Downloads</th>
	                                                    <th>Expires</th>
	                                                    <th>Download</th>	 	 	 	
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td>Shopnovilla - Free Real Estate PSD Template</td>
	                                                    <td>May 10, 2018</td>
	                                                    <td><span class="danger">Expired</span></td>
	                                                    <td><a href="#" class="view">Click Here To Download Your File</a></td>
	                                                </tr>
	                                                <tr>
	                                                    <td>Organic - ecommerce html template</td>
	                                                    <td>Sep 11, 2018</td>
	                                                    <td>Never</td>
	                                                    <td><a href="#" class="view">Click Here To Download Your File</a></td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                                <%-- 
	                                <div class="tab-pane" id="address">
	                                   <p>The following addresses will be used on the checkout page by default.</p>
	                                    <h4 class="billing-address">Billing address</h4>
	                                    <a href="#" class="view">Edit</a>
	                                    <p><strong>Bobby Jackson</strong></p>
	                                    <address>
	                                    	House #15<br>
	                                    	Road #1<br>
	                                    	Block #C <br>
	                                    	Banasree <br>
	                                    	Dhaka <br>
	                                    	1212
	                                    </address>
	                                    <p>Bangladesh</p>   
	                                </div>
	                                <div class="tab-pane fade" id="account-details">
	                                    <h3>Account details </h3>
	                                    <div class="login">
	                                        <div class="login-form-container">
	                                            <div class="account-login-form">
	                                                <form action="#">
	                                                    <p>Already have an account? <a href="#">Log in instead!</a></p>
	                                                    <div class="input-radio">
	                                                        <span class="custom-radio"><input type="radio" value="1" name="id_gender"> Mr.</span>
	                                                        <span class="custom-radio"><input type="radio" value="1" name="id_gender"> Mrs.</span>
	                                                    </div> <br>
	                                                    <label>First Name</label>
	                                                    <input type="text" name="first-name">
	                                                    <label>Last Name</label>
	                                                    <input type="text" name="last-name">
	                                                    <label>Email</label>
	                                                    <input type="text" name="email-name">
	                                                    <label>Password</label>
	                                                    <input type="password" name="user-password">
	                                                    <label>Birthdate</label>
	                                                    <input type="text" placeholder="MM/DD/YYYY" value="" name="birthday">
	                                                    <span class="example">
	                                                      (E.g.: 05/31/1970)
	                                                    </span>
	                                                    <span class="custom-checkbox">
	                                                        <input type="checkbox" value="1" name="optin">
	                                                        <label>Receive offers from our partners</label>
	                                                    </span>
	                                                    <span class="custom-checkbox">
	                                                        <input type="checkbox" value="1" name="newsletter">
	                                                        <label>Sign up for our newsletter<br><em>You may unsubscribe at any moment. For that purpose, please find our contact info in the legal notice.</em></label>
	                                                    </span>
	                                                    <div class="save-button primary-btn default-button">
	                                                        <a href="#">Save</a>
	                                                    </div>
	                                                </form>
	                                            </div>
	                                        </div>
			                            </div>
	                                </div>--%>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>       	
            </section>		
            <%@include file="custfooter.jsp" %>	
</body>
</html>