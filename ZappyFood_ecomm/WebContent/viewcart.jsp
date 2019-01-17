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


<% if (m!=null)
{
	%> 
                
	<div class="alert alert-success alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><%= m %></strong> 
  </div>
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
                                         int i=0;
                                                      for(cart_bean ee:list)
														   {
                                                    	      
															  %>
                                        <tbody>
                                            <tr>
                                                <td class="product-thumbnail"><img src="imgupload/<%=ee.getFilename()%>" style="width:50%" alt=""></td>
                                                <td class="product-name"><a href="#"><%=ee.getProductname() %></a></td>
                                                <td class="product-price"><span  class="amount"><input type="text" id="amountid<%=i%>" value=<%=ee.getProductprice() %> readonly></span></td>
                                         
                                         <td class="product-quantity">
                                                    <div class="quickview_plus_minus quick_cart">
                                                        <div class="quickview_plus_minus_inner">
                                                            <div class="cart-plus-minus cart_page">
                                                                <input type="hidden" id="cartid<%=i%>" value=<%=ee.getCartid()%>>
                                                                <input type="text" id="Quantityid<%=i%>" onkeyup="updatequantity(<%=i%>)" value=<%=ee.getQuantity() %> name="quantity" class="cart-plus-minus-box" >
                                                           </div>
                                                        </div>    
                                                    </div> 
                                                </td>
                                       
                                                <td class="product-subtotal" ><input  id="total<%=i%>" value=<%=ee.getProductprice()*ee.getQuantity()%> name="total" readonly></td>
                                                <td class="product-remove"><a href="dleteccartitem?pid=<%=ee.getCartid()%>">X</a></td>
                                            </tr>
                                        </tbody>
                                              <% i++;
                                              } %>                  
                                    </table>
                                </div>
                                <div class="row table-responsive_bottom">
                                    <div class="col-lg-7 col-sm-7 col-md-7">
                                       <div class="buttons-carts">
                                        
                                            <a href="index.jsp">Continue Shopping</a>   
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
                                               <div id="gtot"> <span> <strong ><%=ee.getTotal() %></strong> </span></div>
                                            </div>
                                            <%} %>
                                             </form> 
                                                <form action="checkServlet" method="post">
                                            
                                            <div class="order-total">
                                                <span><strong>Adress</strong> </span> <br/>         
                                              <textarea name="Adress" rows="" cols=""></textarea>
                                            </div>
                                            
                                            <div class="buttons-carts">
                                          <%--   <a>  <input type="submit" value="" />proceed to Checkout</a>--%> 
                                           <input type="submit"  value="proceed to Checkout">
                                            </div>
                                            </form>
                                         </div>    
                                    </div>    
                                </div>
                            
                            
                        </div>    
                    

<%@include file="custfooter.jsp" %>

<script >
function updatequantity(i)
{
			var cid = document.getElementById('cartid'+i).value;
			var quan = document.getElementById('Quantityid'+i).value;
			var pri = document.getElementById('amountid'+i).value;
			document.getElementById('total'+i).value=pri*quan;
			
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST","UpdateViewCart?cid="+cid+"&q="+quan,true);
			xhttp.send();
			xhttp.onreadystatechange  = function () {
				if (this.readyState == 4 && this.status==200){
					document.getElementById("gtot").innerHTML=this.responseText;
				}
			};
	}


</script>
</body>
</html>