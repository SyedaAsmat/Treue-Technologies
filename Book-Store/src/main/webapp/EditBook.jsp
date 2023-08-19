<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminHeader.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Edit Books</title>
<style>
body{
    	margin: 0;
    }
    .edit-book-container{
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
function validate(){
	var bname = document.getElementById("bname").value;
	var genre = document.getElementById("genre").value;
	var author = document.getElementById("author").value;
	var price = document.getElementById("price").value;

	if (!bname){  
		  alert("Book Name can't be blank");  
		  return false;  
		}
	
	if(!genre){  
		  alert("Genre can't be blank");  
		  return false;  
		}

	if(!author){  
		  alert("Author Name can't be blank");  
		  return false;  
		}
	
	if(!price){  
		  alert("Price of Book can't be blank");  
		  return false;  
		}
}
function goBack(){
	location.href="ViewBooks.jsp";
}
</script>
</head>
<body>
	<div class="edit-book-container">
		<h2 class="form-title" style="">Edit Book Details</h2>
			<form method="post" action="updatebook" name="edit-book-form" class="edit-book-form" id="edit-book-form" autocomplete="off">
				<%
					String id = request.getParameter("id");
    					try{
    						Connection con = ConnectionProvider.getCon();
    						Statement st = con.createStatement();
    						ResultSet rs = st.executeQuery("select * from books where id='" + id + "'");
    						while(rs.next()){
    				%>
				<input type="hidden" name="id" id="id" value="<%= rs.getString("id") %>" />
				<table>
					<!--<tr>
						<td></td>
						<td><input type="text" name="uid" id="uid"/></td>
					</tr>-->
					
					<tr>
					<th><label for="book-name">Book Name: </label></th>
					<td><input type="text" name="bname" id="bname" value="<%= rs.getString("bname") %>" /></td>
					</tr>
					
					<tr>
					<th><label for="genre">Genre: </label></th>
					<td><input type="text" name="genre" id="genre" value="<%= rs.getString("genre") %>" /></td>
					</tr>
					
					<tr>
					<th><label for="author">Author: </label></th>
					<td><input type="text" name="author" id="author" value="<%= rs.getString("author") %>" /></td>
					</tr>
					
					<tr>
					<th><label for="pass">Price: </label></th>
					<td><input type="text" name="price" id="price" value="<%= rs.getString("price") %>"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="add-book" id="add-book" class="submit-btn" value="Sure" onclick="return validate()"/>
						<a><input type="button" name="cancel" id="cancel" class="cancel-btn" value="Cancel" onclick="return goBack()"/></a></td>
					</tr>
    				<%
    					}
    				}catch(Exception e){
    					System.out.println(e);
    				}
    				%>
				</table>
			</form>
	</div>
</body>
</html>