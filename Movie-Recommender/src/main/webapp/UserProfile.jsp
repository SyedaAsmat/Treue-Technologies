<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="moviePackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="UserHeader.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
body{
    	margin: 0;
    }
    .content-head{
    padding-top: 20px;
    text-align: center;
    }
    .content-head .on-head{
    	font-size: 35px;
    	color: #70797d;
    }
    .profile-container{
    	padding-top: 70px;
    	text-align: center;
    	font-size: 40px;
    }
table{
	margin-left: auto;
	margin-right: auto;
	font-size: 22px;
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
input[type=button]{
	text-align: center;
	background-color: #bf8040;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=button]:focus{
	background-color: #4d3319;
	color: white;
}
</style>
<script>
function goTo(){
	location.href="editPassword.jsp";
}
</script>
</head>
<body>
<% 
String uemail = session.getAttribute("uemail").toString();
try{
	int sno = 0;
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where uemail = '"+uemail+"'");
		while(rs.next()){
		%>
	<div class="profile-container">
		<div class="content-head">
    		<p class="on-head">Your Profile</p>
    	</div>
				<table>
					<tr>
    					<th>Name: </th>
    					<td><%= rs.getString(2) %></td>
    				</tr>
    				<tr>
    					<th>Email: </th>
    					<td><%= rs.getString(3) %></td>
    				</tr>
    				<tr>
    					<th>Password: </th>
    					<td><%= rs.getString(4) %></td>
    					<td><a><input type="button" name="edit" id="edit" class="edit-btn" value="Edit Password" onclick="return goTo();"/></a></td>
					
    				</tr>
				</table>
				<%
				}
				}catch(Exception e){
					System.out.println(e);
				}%>
	</div>
</body>
</html>