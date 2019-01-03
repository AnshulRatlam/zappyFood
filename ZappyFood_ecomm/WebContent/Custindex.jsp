
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
                
                <!--Features product area-->
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
			                                                                    <a href="#">
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
			                                                                        <ul>
			                                                                        <li><input type="hidden" name="pid" value= <%=ee.getSno()%> /></li>
			                                                                        
			                                                                       <li> <div class="cart-plus-minus">
			                                                                       
                                                                    <input type="text" value="02" name="quantity" class="cart-plus-minus-box">
                                                                </div></li>
                                                                                          <li><a href="./addtocart"><i class="ion-android-cart"></i></a></li>
			                                                                            <li><a class="cart-fore" href="#" data-toggle="modal" data-target="#my_modal"  title="Quick View" ><i class="ion-android-open"></i></a></li>
			                                                                            <li><a href="product-details.html"><i class="ion-clipboard"></i></a></li>
			                                                                        </ul>
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
			                                                                    <a href="#">
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
			                                                                        <ul>
                                                            <li><a href="./addtocart"><i class="ion-android-cart"></i></a></li>
			                                                                            <li><a class="cart-fore" href="#" data-toggle="modal" data-target="#my_modal"  title="Quick View" ><i class="ion-android-open"></i></a></li>
			                                                                            <li><a href="product-details.html"><i class="ion-clipboard"></i></a></li>
			                                                                        </ul>
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
                                    <h3> Ready To cook  </h3>
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
			                                                                    <a href="#">
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
			                                                                        <ul>
                                                   <li><a href="#"><i class="ion-android-cart"></i></a></li>
			                                                                            <li><a class="cart-fore" href="#" data-toggle="modal" data-target="#my_modal"  title="Quick View" ><i class="ion-android-open"></i></a></li>
			                                                                            <li><a href="product-details.html"><i class="ion-clipboard"></i></a></li>
			                                                                        </ul>
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
           
             <!-- modal area start --> 
           <div class="modal fade" id="my_modal" tabindex="-1" role="dialog"  aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="modal-body shop">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-5 col-md-5 col-sm-12">
                                        <div class="product-flags madal">  
                                            <div class="tab-content" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="imgeone" role="tabpanel" >
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="assets/img/cart/nav12.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="imgetwo" role="tabpanel">
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="assets/img/cart/nav11.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="imgethree" role="tabpanel">
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="assets/img/cart/nav13.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="products_tab_button  modals">    
                                                <ul class="nav product_navactive" role="tablist">
                                                    <li >
                                                        <a class="nav-link active" data-toggle="tab" href="#imgeone" role="tab" aria-controls="imgeone" aria-selected="false"><img src="assets/img/cart/nav.jpg" alt=""></a>
                                                    </li>
                                                    <li>
                                                         <a class="nav-link" data-toggle="tab" href="#imgetwo" role="tab" aria-controls="imgetwo" aria-selected="false"><img src="assets/img/cart/nav1.jpg" alt=""></a>
                                                    </li>
                                                    <li>
                                                       <a class="nav-link button_three" data-toggle="tab" href="#imgethree" role="tab" aria-controls="imgethree" aria-selected="false"><img src="assets/img/cart/nav2.jpg" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>    
                                        </div>  
                                    </div> 
                                    <div class="col-lg-7 col-md-7 col-sm-12">
                                        <div class="modal_right">
                                            <div class="shop_reviews">
                                                <div class="demo_product">
                                                    <h2>Sprite Yoga Straps1</h2> 
                                                </div>
                                                <div class="current_price">
                                                    <span class="regular">$64.99</span>    
                                                    <span class="regular_price" >$78.99</span>    
                                                </div>
                                                <div class="product_information product_modal">
                                                    <div id="product_modal_content">
                                                        <p>Short-sleeved blouse with feminine draped sleeve detail.</p>    
                                                    </div>
                                                    <div class="product_variants">
                                                        <div class="product_variants_item modal_item">
                                                            <span class="control_label">Size</span>
                                                            <select id="group_1">
                                                                <option value="1">S</option>
                                                                <option value="2" selected="selected">M</option>
                                                                <option value="3">L</option>
                                                            </select>    
                                                        </div>   
                                                        
                                                       <div class="quickview_plus_minus">
                                                            <span class="control_label">Quantity</span>
                                                            <div class="quickview_plus_minus_inner">
                                                                <div class="cart-plus-minus">
                                                                    <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                                                </div>
                                                               <div class="add_button add_modal">
                                                                    <button type="submit"> Add to cart</button> 
                                                                </div>
                                                            </div>    
                                                        </div> 
                                                        
                                                        <div class="cart_description">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</p>    
                                                        </div> 
                                                    </div>
                                                </div>   
                                            </div>    
                                        </div>    
                                    </div>    
                                </div>
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
