<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>
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
input[type=reset]{
	text-align: center;
	background-color: #9fc4ed;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=reset]:focus{
	background-color: #5e758f;
	color: white;
}
</style>
</head>
<body>
<div class="shell">
    <div class="content-head">
    	<p class="on-head">Ratings</p>
    </div>
    <div class="movie-container">
    <%
    String msg = request.getParameter("msg");
    if("added".equals(msg)){
    	%>
    	<h4 class="alert" style="fonts-size:15px; color:green;">Added to cart</h4>
    <%}%>
    <%
    if("exist".equals(msg)){
    	%>
    	<h4 class="alert" style="fonts-size:15px; color:green;">Quantity increased in cart</h4>
    <%}%>
    <%
    if("invalid".equals(msg)){
    	%>
    	<h4 class="alert" style="fonts-size:15px; color:red;">Two copies of this book are already in cart.</h4>
    <%}%>
    	<form>
    	
    	<table>
    		<thead>
    			<tr>
    			<th>S. No.</th>
    				<th>Movie Name</th>
    				<th>Genre</th>
    				<th>Rated By</th>
    				<th></th>
    			</tr>
    		</thead>
    		<tbody>
    		<%
    	try{
			int sno = 0;
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();

	    	ResultSet rs = st.executeQuery("select * from rated");
				while(rs.next()){
					//System.out.println("OKK - > " + rs);
					sno = sno + 1;
		%>
    			<tr>
    				<td><% out.println(sno); %></td>
    				<td><%= rs.getString(3) %></td>
    				<td><%= rs.getString(4) %></td>
    				<td><%= rs.getString(6) %></td>
    				<td><a href="RemoveRating.jsp?id=<%= rs.getString(1) %>&mname=<%=rs.getString(3)%>">Remove</a></td>
    			</tr>
    			<%} %>
    		</tbody>
    		
    	</table>
    	<%
    		}catch(Exception e){
						System.out.println(e);
					}
			%>
    </form>
    </div>
</div>
</body>
</html>