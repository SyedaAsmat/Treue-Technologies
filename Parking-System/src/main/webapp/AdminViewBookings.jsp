<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="parkingSystem.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminHeader.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    /* styling navlist */
    body{
    	margin: 0;
    }
    .content-head{
    padding-top: 60px;
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
a{
color: red;
}
    </style>
</head>
<body>
<div class="shell">
    <div class="content-head">
    	<p class="on-head">User Bookings</p>
    </div>
    <div class="content-body">
    	<p class="on-head">Yours spot is <b>Waiting</b> for you.</p>
    </div>
    <div class="content-body">
    	<p class="on-head"><b>NOTE: </b>In case of cancelling a refund will be made within <b>7 days</b></p>
    </div>
    <div class="book-container">
    	<form action="#">
    	<table>
    		<thead>
    			<tr>
    			<th>S. No.</th>
    				<th>Booking Date</th>
    				<th>Time Slot</th>
    				<th>Slot Hour</th>
    				<th>Price to Pay</th>
    				<th>Booked Plot</th>
    				<th>Payment Mode</th>
    				<th>Transaction Id</th>
    			</tr>
    		</thead>
    		<tbody>
    		<%
    		int sno = 0;
    		String username = (String) session.getAttribute("username");
    		//System.out.println("Email ->"+uemail);
    		try{
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs = st.executeQuery("select * from bookings");
    			while(rs.next()){
    				sno = sno + 1;
    				//System.out.println("Id ->"+rs.getString(1));
    		%>
    			<tr>
    				<td><% out.println(sno); %></td>
    				<td><%= rs.getString(3) %></td>
    				<td><%= rs.getString(4) %></td>
    				<td><%= rs.getString(5) %></td>
    				<td><%= rs.getString(6) %></td>
    				<td><%= rs.getString(7) %></td>
    				<td><%= rs.getString(8) %></td>
    				<td><%= rs.getString(9) %></td>
    			</tr>
    			<%
    			}
    		}catch(Exception e){
    			System.out.println(e);
    		}
    			%>
    		</tbody>
    	</table>
    </form>
    </div>
</div>
</body>
</html>