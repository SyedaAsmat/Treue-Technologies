<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="AdminHeader.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Admin - Add Books</title>
<style>
body{
    	margin: 0;
    }
    .users-container{
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
</script>
</head>
<body>
	<div class="users-container">
		<h2 class="form-title" style="">Add New Book</h2>
			<form method="post" action="addbook" name="add-book-form" class="add-book-form" id="add-book-form" autocomplete="off">
				<table>
					<!--<tr>
						<td></td>
						<td><input type="text" name="uid" id="uid"/></td>
					</tr>-->
					
					<tr>
					<th><label for="book-name">Book Name: </label></th>
					<td><input type="text" name="bname" id="bname" placeholder="Book Name" /></td>
					</tr>
					
					<tr>
					<th><label for="genre">Genre: </label></th>
					<td><input type="text" name="genre" id="genre" placeholder="Genre" /></td>
					</tr>
					
					<tr>
					<th><label for="author">Author: </label></th>
					<td><input type="text" name="author" id="author" placeholder="Author Name" /></td>
					</tr>
					
					<tr>
					<th><label for="pass">Price: </label></th>
					<td><input type="text" name="price" id="price" placeholder="Price of Book"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="add-book" id="add-book" class="submit-btn" value="Add to Collection" onclick="return validate()"/>
						<input type="reset" name="clearup" id="clearup" class="clear-btn" value="Re-Set" /></td>
					</tr>
				</table>
			</form>
	</div>
</body>
</html>