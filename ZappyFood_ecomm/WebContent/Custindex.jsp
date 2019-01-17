
<%@page import="java.util.ArrayList,Bean.MY_BEAN" %>





<%-- comment <% response.sendRedirect("./viewproductIndex"); %> --%>
<%-- <jsp:include page="./viewproductIndex" />--%>
<html lang="zxx">
    <head>
         <%@include file="custheadlink.jsp" %>
    </head>
    <body>
    <% 
	  	String uid=(String)session.getAttribute("uid");
    String m = (String)request.getAttribute("msg") ;
    String count = (String)request.getAttribute(" count");
        if(uid==null)
       {%>
         <!-- Add your site or application content here -->
            
            <!--organicfood wrapper start--> 
            
                <!--Header end-->
                
                <!--Slider start-->
                
                <!--Slider end-->
                
 
 
	    <%@include file="Custhead.jsp" %>
  
       <%
       }
	   %>
	   <%if(uid!=null) 
	   
	   {%>
	   
	   <%@include file="Custheaduser.jsp" %>
        <%} %>
              <!--Banner area start-->
                <div class="banner_area home1_banner mt-30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner">
                                    <a href="#">
                                        <img src="assets/img/banner/1.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner">
                                    <a href="#">
                                        <img src="assets/img/banner/2.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner banner_three">
                                    <a href="#">
                                        <img src="assets/img/banner/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Banner area end-->
                
              <% if (m!=null)
{
	%> 
                
	<div class="alert alert-success alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><%= m %></strong> 
  </div>
	<%} %>
                
                <!--Features product area-->
                                <div class="features_product pt-90">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="section_title text-center">
                                    <h3> Ready To Cook  </h3>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="features_product_active owl-carousel">

                 <% 
 ArrayList<MY_BEAN> list1=(ArrayList<MY_BEAN>)request.getAttribute("LIST1");
 
 %>
 
 <%
														   for(MY_BEAN ee:list1)
														   {
															  %>
															 
															   <div class="single__product">
			                                                            <div class="single_product__inner">
			                                                                <span class="new_badge">new</span>
			                                                                <div class="product_img">
			                                                                    <a href="productdiscriptionservlet?pid=<%=ee.getSno()%>">
			                                                                        <img style=" padding:20%; " src="imgupload/<%=ee.getFilename()%>" alt="">
			                                                                    </a>
			                                                                </div>
			                                                                <div class="product__content text-center">
			                                                                    <div class="produc_desc_info">
			                                                                        <div class="product_title">
			                                                                            <h4><a href="product-details.html"><%=ee.getProductname() %></a></h4>
			                                                                        </div>
			                                                                        <div class="product_price">
			                                                                            <p><%=ee.getProductprice() %></p>
			                                                                        </div>
			                                                                    </div>
			
			                                                                    <div class="product__hover">
			                                                                        
			                                                                         <form  action="./addtocart">
			                                                                        <div class="quickview_plus_minus">
			                                                                        <input type="hidden" name="pid" value=<%=ee.getSno()%> />
                                                            <span class="control_label">Quantity</span>
                                                            <div class="quickview_plus_minus_inner">
                                                                <div class="cart-plus-minus">
                                                                    <input type="text" value="1" name="quantity" class="cart-plus-minus-box">
                                                                </div>
                                                               <div class="add_button add_modal">
                                                                    <button type="submit"> Add to cart</button> 
                                                                </div>
                                                            </div>    
                                                        </div> 
			                                                          </form>              
			                                                                        
			                                                                    </div>
			                                                                </div>
			                                                            </div>
			                                                        </div> 
				                                           
	                                                   <%     											
														 }
													  %>
                

                                
                               

                                
                            </div>
                        </div>
                    </div>
                </div>
                <!--Features product end-->
                
               
            
               <!--Features read to drink area-->
                                <div class="features_product pt-90">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="section_title text-center">
                                    <h3> Ready To Drink </h3>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="features_product_active owl-carousel">

                 <% 
 ArrayList<MY_BEAN> list2=(ArrayList<MY_BEAN>)request.getAttribute("LIST2");
 
 %>
 
 <%
														   for(MY_BEAN ee:list2)
														   {
															  %>
															 
															   <div class="single__product">
			                                                            <div class="single_product__inner">
			                                                                <span class="new_badge">new</span>
			                                                                <div class="product_img">
			                                                                 <a href="productdiscriptionservlet?pid=<%=ee.getSno()%>">
			                                                                 
			                                                                        <img src="imgupload/<%=ee.getFilename()%>" alt="">
			                                                                    </a>
			                                                                </div>
			                                                                <div class="product__content text-center">
			                                                                    <div class="produc_desc_info">
			                                                                        <div class="product_title">
			                                                                            <h4><a href="product-details.html"><%=ee.getProductname() %></a></h4>
			                                                                        </div>
			                                                                        <div class="product_price">
			                                                                            <p><%=ee.getProductprice() %></p>
			                                                                        </div>
			                                                                    </div>
			
			                                                                    <div class="product__hover">
			                                                                        
			                                                                         <form  action="./addtocart">
			                                                                        <div class="quickview_plus_minus">
			                                                                        <input type="hidden" name="pid" value=<%=ee.getSno()%> />
                                                            <span class="control_label">Quantity</span>
                                                            <div class="quickview_plus_minus_inner">
                                                                <div class="cart-plus-minus">
                                                                    <input type="text" value="1" name="quantity" class="cart-plus-minus-box">
                                                                </div>
                                                               <div class="add_button add_modal">
                                                                    <button type="submit"> Add to cart</button> 
                                                                </div>
                                                            </div>    
                                                        </div> 
			                                                          </form>         
			                                                                    </div>
			                                                                </div>
			                                                            </div>
			                                                        </div> 
				                                           
	                                                   <%     											
														 }
													  %>
                

                                
                               

                                
                            </div>
                        </div>
                    </div>
                </div>
                <!--Features product end-->
                
                <!--Features ready to cook-->
                                <div class="features_product pt-90">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="section_title text-center">
                                    <h3> Ready To Eat  </h3>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="features_product_active owl-carousel">

                 <% 
 ArrayList<MY_BEAN> list3=(ArrayList<MY_BEAN>)request.getAttribute("LIST3");
 
 %>
 
 <%
														   for(MY_BEAN ee:list3)
														   {
															  %>
															 
															   <div class="single__product">
			                                                            <div class="single_product__inner">
			                                                                <span class="new_badge">new</span>
			                                                                <div class="product_img">
			                                                                  <a href="productdiscriptionservlet?pid=<%=ee.getSno()%>">
			                                                                        <img style=" padding:20%; " src="imgupload/<%=ee.getFilename()%>" alt="">
			                                                                    </a>
			                                                                </div>
			                                                                <div class="product__content text-center">
			                                                                    <div class="produc_desc_info">
			                                                                        <div class="product_title">
			                                                                            <h4><a href="product-details.html"><%=ee.getProductname() %></a></h4>
			                                                                        </div>
			                                                                        <div class="product_price">
			                                                                            <p><%=ee.getProductprice() %></p>
			                                                                        </div>
			                                                                    </div>
			
			                                                                    <div class="product__hover">
			                                                                       
			                                                                         <form  action="./addtocart">
			                                                                        <div class="quickview_plus_minus">
			                                                                        <input type="hidden" name="pid" value=<%=ee.getSno()%> />
                                                            <span class="control_label">Quantity</span>
                                                            <div class="quickview_plus_minus_inner">
                                                                <div class="cart-plus-minus">
                                                                    <input type="text" value="1" name="quantity" class="cart-plus-minus-box">
                                                                </div>
                                                               <div class="add_button add_modal">
                                                                    <button type="submit"> Add to cart</button> 
                                                                </div>
                                                            </div>    
                                                        </div> 
			                                                          </form>         
			                                                                    </div>
			                                                                </div>
			                                                            </div>
			                                                        </div> 
				                                           
	                                                   <%     											
														 }
													  %>
                

                                
                               

                                
                            </div>
                        </div>
                    </div>
                </div>
                <!--Features product end-->
           
           
           
            
    
            
  
		
		
		<%@include file="custfooter.jsp" %>
    </body>
</html>
