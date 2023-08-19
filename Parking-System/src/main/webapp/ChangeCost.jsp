<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="parkingSystem.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminHeader.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Change Cost</title>
<style>
body{
    	margin: 0;
    }
    .edit-cost-container{
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
	background-color: #3F2E3E;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
	color: white;
}
input[type=submit]:focus{
	background-color: #A78295;
	color: black;
}
input[type=button]{
	text-align: center;
	background-color: #A78295;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=button]:focus{
	background-color: #3F2E3E;
	color: white;
}
</style>
<script>
function validate(){
	var cost = document.getElementById("cost").value;

	if (!cost){  
		  alert("Cost can't be blank");  
		  return false;  
		}
}
function goBack(){
	location.href="AdminHome.jsp";
}
</script>
</head>
<body>
<%
try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from parkcost");
		//System.out.println("COST -->"+rs);
		while(rs.next()){
		//System.out.println("Cost - > " + rs.getString(2));
%>
	<div class="edit-cost-container">
	
		<h2 class="form-title">Change Cost</h2>
		<%
    String msg = request.getParameter("msg");
    if("done".equals(msg)){
    	%>
    	<h4 class="alert" style="font-size:15px; color:green;">Cost Modified</h4>
    <%}%>
    <%
    if("wrong".equals(msg)){
    	%>
    	<h4 class="alert" style="font-size:15px; color:red;">Not changed</h4>
    <%}%>
			<form method="post" action="updateCost" name="edit-cost-form" class="edit-cost-form" id="edit-cost-form" autocomplete="off">
				
				<table>
					<tr>
					<th><label for="change-cost-label">Cost: </label></th>
					<td><input type="text" name="cost" id="cost" value="<%= rs.getString(2) %>" /></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="change-cost" id="change-cost" class="submit-btn" value="Sure" onclick="return validate()"/>
						<a><input type="button" name="cancel" id="cancel" class="cancel-btn" value="Cancel" onclick="return goBack()"/></a></td>
					</tr>
				</table>
			</form><%
				}
				}catch(Exception e){
					System.out.println(e);
				}%>
	</div>
</body>
</html>