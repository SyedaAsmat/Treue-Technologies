<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="parkingSystem.ConnectionProvider" %>
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
    .show-container{
    	padding-top: 70px;
    	text-align: center;
    	font-size: 40px;
    }
table{
	margin-left: auto;
	margin-right: auto;
	font-size: 30px;
}
th, td{
	padding: 10px;
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
try{
	int sno = 0;
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from parkcost");
		while(rs.next()){
		%>
	<div class="show-container">
		<div class="content-head">
    		<p class="on-head">A <b>Special</b> Cost only For You</p>
    	</div>
				<table>
					<tr>
    					<th>Cost: </th>
    					<td><%= rs.getString(2) %></td>
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