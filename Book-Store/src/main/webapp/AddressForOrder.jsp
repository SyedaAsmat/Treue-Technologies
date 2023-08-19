<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<html>
<head>
<title>Online Book Store</title>
<meta charset="UTF-8">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    /* styling navlist */
    body{
    	margin: 0;
    }
    .content-head{
    padding-top: 10px;
    text-align: center;
    }
    .content-head .on-head{
    	font-size: 30px;
    	color: #70797d;
    }
    .content-body .on-head{
    	color: #70797d;
    	font-size: 20px;
    	text-align: center;
    }
    table{
	margin-left: auto;
	margin-right: auto;
	font-size: 18px;
}
th, td{
	padding: 10px;
}
label{
	text-decoration: bold;
}
input{
	height: 25px;
	width: auto;
}
input[type=text]:focus{
	border: 3px solid #555;
}
a{
	color: red;
	text-decoration: none;
}
input[type=submit]{
	text-align: center;
	background-color: #4aa1ff;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=submit]:focus{
	background-color: #1e4e82;
	color: white;
}
input[type=button]{
	text-align: center;
	background-color: #9fc4ed;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=button]:focus{
	background-color: #5e758f;
	color: white;
}
    </style>
    <script>
    function goBack(){
    	location.href="MyCart.jsp";
    }
    function goTo(){
    	location.href="#.jsp";
    }
    if(window.history.forward(1) != null)
    	window.history.forward(1)
    </script>
</head>
<body>
<div class="shell">
    <div class="content-head">
    	<p class="on-head"><b>Need</b> Some Details</p>
    </div>
    <div class="content-body">
    	<p class="on-head">To send your books to <b>You</b>.</p>
    </div>
    <div class="book-container">
    <%
    String msg = request.getParameter("msg");
    if("notPossible".equals(msg)){
    	%>
    	<h4 class="alert">One item only. So Click on remove</h4>
    <%}%>
    <%
    if("inc".equals(msg)){
    	%>
    	<h4 class="alert">Quantity increased successfully</h4>
    <%}%>
    <%
    if("dec".equals(msg)){
    	%>
    	<h4 class="alert">Quantity decreased successfully</h4>
    <%}%>
    <%
    if("removed".equals(msg)){
    	%>
    	<h4 class="alert">Book successfully removed</h4>
    <%}%>
    	
    	<table>
    		<thead>
    		<%
    		int total = 0;
    		int sno = 0;
    		String uemail = (String) session.getAttribute("uemail");
    		try{
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs = st.executeQuery("select sum(total) from cart where uemail='"+uemail+"'");
    			while(rs.next()){
    				total = rs.getInt(1);
    			}
    		%>
    			<tr>
    				<th>S. No.</th>
    				<th>Book Name</th>
    				<th>Genre</th>
    				<th>Price</th>
    				<th>Quantity</th>
    				<th>Sub Total</th>
    			</tr>
    		</thead>
    		<tbody>
    		<%
    		ResultSet rs1 = st.executeQuery("select * from books inner join cart on books.id = cart.bid and cart.uemail = '"+uemail+"'");
    		while(rs1.next()){
    		%>
    			<tr>
    			<% sno = sno + 1; %>
    				<td><% out.println(sno); %></td>
    				<td><%= rs1.getString(2) %></td>
    				<td><%= rs1.getString(4) %></td>
    				<td><%= rs1.getString(5) %></td>
    				<td><%= rs1.getString(9) %></td>
    				<td><%= rs1.getString(11) %></td>
    			</tr>
    			<%}
    		ResultSet rs2 = st.executeQuery("select * from users where uemail = '"+uemail+"'");
    		while(rs2.next()){
    		%>
    		</tbody>
    	</table>
    	<br><br>
    	<form method="post" action="PaymentAction.jsp">
    	<table>
    		<tr>
					<th><label for="user-address">Address: </label></th>
					<td><input class="input-style" type="text" name="uadd" id="uadd" value="<%= rs2.getString(6) %>" maxlength="50" required/></td>
					</tr>
					
					<tr>
					<th><label for="genre">Contact Number: </label></th>
					<td><input class="input-style" type="text" name="ucontact" id="ucontact" value="<%= rs2.getString(5) %>" maxlength="10" required/></td>
					</tr>
					
					<tr>
					<th><label for="mode-of-payment">Mode of Payment: </label></th>
					<td>
					<select class="input-style" name="payment_mode">
						<option value="Cash On Delivery (COD)">Cash On Delivery (COD)</option>
						<option value="Online Payment">Online Payment</option>	
					</select></td>
					</tr>
					<tr>
					<td>
					<h5>Pay online on this upi:<br> asmatabidi@pay.com<br></h5>
					<h5>Note: If transaction id entered wrong,<br> order will be cancelled.</h5></td>
					<td><input type="text" name="transactionId" id="transactionId" placeholder="Transaction Id"/></td>
					</tr>
    	</table>
    	<br><br>
    	<%}
    	}catch(Exception e){
    			System.out.println(e);
    		}
    		%>
    	<table>
    		<tr>
    			<td>Total Amount: Rs. <% out.println(total); %></td>
    			<td>
    			<%if(total > 0) {%>
    			<input type="submit" name="order" id="order" class="submit-btn" value="Check Out"/>
    			<a><input type="button" name="cancel" id="cancel" class="cancel-btn" value="Cancel" onclick="return goBack()"/></a></td>
				<%} %></td>
    		</tr>
    	</table><br>
    </form>
    
    </div>
</div>
</body>
</html>