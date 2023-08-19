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
<title>Edit Passwords</title>
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
    .edit-pwd-container{
    	padding-top: 50px;
    	text-align: center;
    	font-size: 40px;
    }
.form-title{
	color: black; 
	text-align: center;
	font-size: 40px;
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
	background-color: #4d3319;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
	color: white;
}
input[type=submit]:focus{
	background-color: #bf8040;
	color: black;
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
function validate(){
	var pwd = document.getElementById("pwd").value;

	if (!pwd){  
		  alert("Password can't be blank");  
		  return false;  
		}
}
function goBack(){
	location.href="UserProfile.jsp";
}
</script>
</head>
<body>
<% 
String uemail = session.getAttribute("uemail").toString();
try{
	int total = 0;
	int sno = 0;
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where uemail = '"+uemail+"'");
		while(rs.next()){
		%>
	<div class="edit-pwd-container">
		<div class="content-head">
    		<p class="on-head">Change Your Password</p>
    	</div>
			<form method="post" action="updatePwd" name="edit-password-form" class="edit-password-form" id="edit-password-form" autocomplete="off">
				<table>
					<tr>
					<th><label for="book-name">password: </label></th>
					<td><input type="text" name="pwd" id="pwd" value="<%= rs.getString(4) %>" /></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="add-book" id="add-book" class="submit-btn" value="Sure" onclick="return validate()"/>
						<a><input type="button" name="cancel" id="cancel" class="cancel-btn" value="Cancel" onclick="return goBack()"/></a></td>
					</tr>
				</table>
			</form>
			<%
				}
				}catch(Exception e){
					System.out.println(e);
				}%>
	</div>
</body>
</html>