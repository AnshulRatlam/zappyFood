<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList,Bean.cart_bean,dao.Dao_Customer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <%@include file="custheadlink.jsp" %>
</head>
<body>

<!-- SELECT itemcollection.Sno,view_cart.quantity, itemcollection.Product_name, itemcollection.price
FROM itemcollection INNER JOIN view_cart
ON view_cart.pid=itemcollection.Sno WHERE view_cart.user= 'the';
 -->
 <% 
	  	String uid=(String)session.getAttribute("uid");
    String m = (String)request.getAttribute("msg") ;
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





 <div class="cart_main_area">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                        <% 
 ArrayList<cart_bean> list=(ArrayList<cart_bean>)request.getAttribute("LIST");
 
 %>
  <% 
 ArrayList<cart_bean> listTotal=(ArrayList<cart_bean>)request.getAttribute("LISTTotal");
  %>
                                                    
                            <form action="#">  
                                <div class="table-content table-responsive">
                                    <table>
                                     
                                        <thead>
                                            <tr>
                                                <th class="img-thumbnail">Image</th>
                                                <th class="product-name">Product</th>
                                                 <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-subtotal">Total</th>
                                                <th class="product-remove">Remove</th>
                                            </tr>
                                        </thead>
                                         <% 
                                                      for(cart_bean ee:list)
														   {
															  %>
                                        <tbody>
                                            <tr>
                                                <td class="product-thumbnail"><img src="imgupload/<%=ee.getFilename()%>" style="width:50%" alt=""></td>
                                                <td class="product-name"><a href="#"><%=ee.getProductname() %></a></td>
                                                <td class="product-price"><span class="amount"><%=ee.getProductprice() %></span></td>
                                                <td class="product-quantity">
                                                    <div class="quickview_plus_minus quick_cart">
                                                        <div class="quickview_plus_minus_inner">
                                                            <div class="cart-plus-minus cart_page">
                                                                <input type="text" value=<%=ee.getQuantity() %> name="quantity" class="cart-plus-minus-box">
                                                            </div>
                                                        </div>    
                                                    </div> 
                                                </td>
                                                <td class="product-subtotal"><%=ee.getProductprice()*ee.getQuantity()%></td>
                                                <td class="product-remove"><a href="#">X</a></td>
                                            </tr>
                                        </tbody>
                                              <%} %>                  
                                    </table>
                                </div>
                                <div class="row table-responsive_bottom">
                                    <div class="col-lg-7 col-sm-7 col-md-7">
                                       <div class="buttons-carts">
                                            <input value="Update Cart" type="submit"> 
                                            <a href="#">Continue Shopping</a>   
                                        </div> 
                                        <div class="buttons-carts coupon">
                                            <h3>Coupon</h3>
                                            <p>Enter your coupon code if you have one.</p>
                                            <input placeholder="Coupon code" type="text"> 
                                            <input value="Apply Coupon" type="submit">     
                                        </div>
                                    </div> 
                                    <div class="col-lg-5 col-sm-5 col-md-5">
                                         <div class="cart_totals  text-right">
                                            <h2>Cart Totals</h2>
                                            <% 
                                            for(cart_bean ee:listTotal)
														   {
															  %>
                                            
                                            <div class="order-total">
                                                <span><strong>Total</strong> </span>          
                                                <span><strong><%=ee.getTotal() %></strong> </span>
                                            </div>
                                            <%} %>
                                            <div class="wc-proceed-to-checkout">
                                                <a href="#">Proceed to Checkout</a>
                                            </div>
                                         </div>    
                                    </div>    
                                </div>
                            </form>   
                            
                        </div>    
                    </div>    
                </div>   
            </div>

<%@include file="custfooter.jsp" %>


</body>
</html>