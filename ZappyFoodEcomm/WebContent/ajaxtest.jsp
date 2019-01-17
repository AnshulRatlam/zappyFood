<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList,Bean.cart_bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<h1>Sucess your order is place plese wait for</h1>
<%-- 
<form action="" method="get">
  quantity: <input type="Number" name="country" id='quantity' value="1" ><br>
  cartid: <input type="text" name="cart" id='cartid' value="09" ><br>
  amount: <input type="text" name="amount" id='amountid' value="90" readonly><br>
  <input type="submit" value="Submit">
</form>
<script >
$(document).ready(function(){
	$("#quantity").keyup(function(){
	    
		var cartid=$("#cartid").val();
		var quantity = $("#quantity").val();
		var amount = $("#amountid").val();
		//alert(email);
	var	mydata="id="+Quantityid &cart="id"=+cartid &amount="id"=+amount;
	
	$.post("OrderService",
	        {
	        itemId : '1',
	        itemName: 'item1',
	        cost : '100'
	    }, function(response, status) {
	        // notify user that his order is successfull
	        }
	);
		
	 $("#msg").html("<img src='assets/img/pc.gif' height='50' width='50' ><font color=gray> Checking availability...</font>");
	 
	 $.ajax({
			url:'google.com',
			data:mydata,
			type:'get',
			success:function(response){
			//	alert(response);
				//$("#msg").html(response);
				//if(response.includes("Already Exist"))
				//$("#name").val("");
			}
		 });
	});
});

</script>


<h1>Hello: <span style="color:red" id="showMyName"></span></h1>

<form method="post" action="cartupdateservlet" id="myForm">
    <input type="text" name="myName" value= ${ msg } />           
    
    quantity: <input type="Number" name="quantityid" id='quantity' value="1" ><br>
  cartid: <input type="text" name="cart" id='cartid' value="09" readonly><br>
  amount: <input type="text" name="amount" id='amountid' value="90" readonly><br> 
</form>
<button id="ajaxSubmit" type="submit">SEND</button>

<script >
     $(document).ready(function() {
        $('#quantity').on('keyup', function() {
        // To simplify things, wrap what you can in a form and serialize                      
        // it to send to the server.
            var myForm = $('#myForm');
            $.get(myForm.attr('action'), myForm.serialize(), function(data) {
                $('#showMyName').text(data);
            });
        });
    });
</script>--%>
<%-- 
<script type="text/javascript">
$(document).ready(function(){
	$('#quantity').on('keyup', function(){
	    
		var myForm = $('#myForm');
		//alert(email);
	var	mydata="id="+myForm;
		
	// $("#msg").html("<img src='assets/img/pc.gif' height='50' width='50' ><font color=gray> Checking availability...</font>");
	 
	 $.ajax({
			url:'cartupdateservlet',
			data:mydata,
			type:'post',
			success:function(response){
			//	alert(response);
		 $.get( myForm.serialize(), function(data) {
                $('#showMyName').text(data);
            });
			//	$("#msg").html(response);
				//if(response.includes("Already Exist"))
			//	$("#R_N4").val("");
			}
		 });
	});
});
</script>--%>




<%--


 <% 
 ArrayList<cart_bean> list=(ArrayList<cart_bean>)request.getAttribute("LIST");
 
 %>
 
 <%
   for(cart_bean ee:list)
   {
	  %>
   	   pid: <input  value=<%=ee.getSno()%> ><br>
  user: <input  value=<%=ee.getUser() %> readonly><br>
  quantity: <input  value=<%=ee.getQuantity()  %>readonly><br> 
   
	 <%
	 }
  %>
	 
	  
 --%>






</body>
</html>