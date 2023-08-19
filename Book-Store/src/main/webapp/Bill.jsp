<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Pay for Books</title>
<style>
body{
    	margin: 0;
    }
    .edit-book-container{
    	padding-top: 20px;
    	text-align: center;
    	font-size: 40px;
    }
.form-title{
	color: black; 
	text-align: center;
	font-size: 30px;
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
	color: blue;
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
</head>
<body>
<%
String uemail = session.getAttribute("uemail").toString();
try{
	int total = 0;
	int sno = 0;
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select sum(total) from cart where uemail='"+uemail+"' and status='bill'");
		while(rs.next()){
			total = rs.getInt(1);
		}
		ResultSet rs1 = st.executeQuery("select * from users inner join cart where cart.uemail = '"+uemail+"' and cart.status = 'bill'");
		while(rs1.next()){
		%>
	<div class="edit-book-container">
		<h2 class="form-title" style="">Online Book Store<br>Invoice</h2>
			<form method="post" action="continueToShop" name="bill-form" class="bill-form" id="bill-form" autocomplete="off">
				<table>
					<tr>
						<th><label for="user-name">Name: </label></th>
							<td><%= rs1.getString(2) %></td>
						<th><label for="ucontact">Contact No.: </label></th>
							<td><%= rs1.getString(5) %></td>
					</tr>
					<tr>
						<th><label for="uemail">Email: </label></th>
							<td><% out.println(uemail); %></td>
						<th><label for="udd">Address: </label></th>
							<td><%= rs1.getString(6) %></td>
					</tr>
					
					<tr>
						<th><label for="orderDate">Order Date: </label></th>
							<td><%= rs1.getString(15) %></td>
						<th><label for="expectedDelivery">Expected Delivery: </label></th>
							<td><%= rs1.getString(16) %></td>
					</tr>
					<tr>
						<th><label for="paymentMode">Payment Mode: </label></th>
							<td><%= rs1.getString(17) %></td>
						<th><label for="transactionId">Transaction Id: </label></th>
							<td><%= rs1.getString(18) %></td>
					</tr>
				</table>
				<% break;
				}%>
				<hr>
				<table>
					<tr>
    					<th>S. No.</th>
    					<th>Book Name</th>
    					<th>Genre</th>
    					<th>Price</th>
    					<th>Quantity</th>
    					<th>Sub Total</th>
    				</tr>
    				<%
    				ResultSet rs2 = st.executeQuery("select * from cart inner join books where cart.bid = books.id and cart.uemail = '"+uemail+"' and cart.status = 'bill'");
    				//System.out.println("UID: ->"+uemail);
    				while(rs2.next()){
    					sno = sno + 1;
    					
    				%>
    				<tr>
						<td><% out.println(sno); %></td>
						<td><%= rs2.getString(15) %></td>
						<td><%= rs2.getString(16) %></td>
						<td><%= rs2.getString(18) %></td>
						<td><%= rs2.getString(4) %></td>
						<td><%= rs2.getString(6) %></td>
    				</tr>
    				<%
    				}
    				%>
					</table>
					<hr>
					<table>
					<tr>
					<td>Total Amount: Rs. <% out.println(total); %></td>
						<td><input type="submit" name="continue" id="continue" class="submit-btn" value="Continue Shopping"/>
						<a><input type="button" name="print" id="print" class="print-btn" value="Print" onclick="window.print();"/></a></td>
					<%}catch(Exception e){
						System.out.println(e);
					}
					%></tr>
				</table>
			</form>
	</div>
</body>
</html>