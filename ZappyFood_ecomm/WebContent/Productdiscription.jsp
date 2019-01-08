<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.ArrayList,Bean.MY_BEAN" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
 <div >
 <% 
 ArrayList<MY_BEAN> list=(ArrayList<MY_BEAN>)request.getAttribute("LIST");
 
 %>
 
 <%
														   for(MY_BEAN ee:list)
														   {
															  %>

${msg}
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        
                        <div class="modal-body shop">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-5 col-md-5 col-sm-12">
                                        <div class="product-flags madal">  
                                            <div class="tab-content" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="imgeone" role="tabpanel" >
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="imgupload/<%=ee.getFilename()%>" style="width:100%;" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="imgetwo" role="tabpanel">
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="imgupload/<%=ee.getFilename()%>" style="width:100%;" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="imgethree" role="tabpanel">
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="imgupload/<%=ee.getFilename()%>" style="width:100%;" alt=""></a>    
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="products_tab_button  modals">    
                                                <ul class="nav product_navactive" role="tablist">
                                                    <li >
                                                        <a class="nav-link active" data-toggle="tab" href="#imgeone" role="tab" aria-controls="imgeone" aria-selected="false"><img src="imgupload/<%=ee.getFilename()%>" alt=""></a>
                                                    </li>
                                                    <li>
                                                         <a class="nav-link" data-toggle="tab" href="#imgetwo" role="tab" aria-controls="imgetwo" aria-selected="false"><img src="imgupload/<%=ee.getFilename()%>" alt=""></a>
                                                    </li>
                                                    <li>
                                                       <a class="nav-link button_three" data-toggle="tab" href="#imgethree" role="tab" aria-controls="imgethree" aria-selected="false"><img src="imgupload/<%=ee.getFilename()%>" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>    
                                        </div>  
                                    </div> 
                                    <div class="col-lg-7 col-md-7 col-sm-12">
                                        <div class="modal_right">
                                            <div class="shop_reviews">
                                                <div class="demo_product">
                                                    <h2><%=ee.getProductname() %></h2> 
                                                </div>
                                                <div class="current_price">
                                                    <span class="regular">4.99</span>    
                                                    <span class="regular_price" ><%=ee.getProductprice() %></span>    
                                                </div>
                                                <div class="product_information product_modal">
                                                    <div id="product_modal_content">
                                                        <p></p>    
                                                    </div>
                                                    <div class="product_variants">
                                                        <div class="product_variants_item modal_item">
                                                            <span class="control_label">Category</span>
                                                           <p><%=ee.getCategory() %></p>
                                                                
                                                               
                                                        </div>   
                                                        
                                                      <form  action="./addtocart_by_discription">
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
                                                        
                                                        <div class="cart_description">
                                                            <p><%=ee.getProductdesc() %></p>    
                                                        </div> 
                                                    </div>
                                                </div>   
                                            </div>    
                                        </div>    
                                    </div>    
                                </div>
                                <%} %>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="social-share">
                                            <h3>Share this product</h3>
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>    
                                        </div>    
                                    </div>    
                                </div>     
                            </div>
                        </div>    
                    </div>
                </div>
            </div> 
            
    
          <!-- modal area end --> 
          
		<%@include file="custfooter.jsp" %> 
           
</body>
</html>