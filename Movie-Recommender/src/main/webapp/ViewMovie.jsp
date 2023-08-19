<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="moviePackage.ConnectionProvider" %>
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
<%
    String msg = request.getParameter("msg");
    if("removed".equals(msg)){
    	%>
    	<h4 class="alert" style="color:green;font-size:15px;">Removed Successfully</h4>
    <%}%>
    <%
    if("invalid".equals(msg)){
    	%>
    	<h4 class="alert" style="color:red;font-size:15px;">Some error occurred. Please try later.</h4>
    <%}%>
    <div class="content-head">
    	<p class="on-head">Movie List</p>
    </div>
    <div class="movie-container">
    	<form action="#">
    	<table>
    		<thead>
    			<tr>
    			<th>S. No.</th>
    				<th>Movie Name</th>
    				<th>Director</th>
    				<th>Language</th>
    				<th>Starring</th>
    				<th>Story Line</th>
    				<th></th>
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
    			ResultSet rs = st.executeQuery("select * from movies");
    			while(rs.next()){
    				sno = sno + 1;
    			//System.out.println("Mname ->"+rs.getString(1));
    		%>
    			<tr>
    				<td><% out.println(sno); %></td>
    				<td><%= rs.getString(2) %></td>
    				<td><%= rs.getString(4) %></td>
    				<td><%= rs.getString(3) %></td>
    				<td><%= rs.getString(5) %></td>
    				<td><%= rs.getString(6) %></td>
    				<td><a href="RemoveMovie.jsp?id=<%= rs.getString(1) %>">Remove</a></td>
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