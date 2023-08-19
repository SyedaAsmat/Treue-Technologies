<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="AdminHeader.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Admin - Add Movies</title>
<style>
body{
    	margin: 0;
    }
    .movie-container{
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
}
input[type=submit]:focus{
	background-color: #bf8040;
	color: white;
}
input[type=reset]{
	text-align: center;
	background-color: #bf8040;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=reset]:focus{
	background-color: #4d3319;
	color: white;
}
</style>
<script>
function validate(){
	var mname = document.getElementById("mname").value;
	var lang = document.getElementById("lang").value;
	var genre = document.getElementById("genre").value;
	var director = document.getElementById("director").value;
	var stars = document.getElementById("stars").value;
	var story = document.getElementById("story").value;

	if (!mname){  
		  alert("Movie Name can't be blank");  
		  return false;  
		}
	
	if(!lang){  
		  alert("Language can't be blank");  
		  return false;  
		}
	if(!genre){  
		  alert("Genre can't be blank");  
		  return false;  
		}

	if(!director){  
		  alert("Directors can't be blank");  
		  return false;  
		}
	
	if(!stars){  
		  alert("Movie stars can't be blank");  
		  return false;  
		}
	if(!story){  
		  alert("Story line can't be blank");  
		  return false;  
		}
}
</script>
</head>
<body>
<%
    String msg = request.getParameter("msg");
    if("done".equals(msg)){
    	%>
    	<h4 class="alert" style="color:green;font-size:15px;">Inserted</h4>
    <%}%>
    <%
    if("invalid".equals(msg)){
    	%>
    	<h4 class="alert" style="color:red;font-size:15px;">Some error occurred. Please try later.</h4>
    <%}%>
	<div class="movie-container">
		<h2 class="form-title" style="">Add New Movie</h2>
			<form method="post" action="addmovie" name="add-movie-form" class="add-movie-form" id="add-movie-form" autocomplete="off">
				<table>
					<!--<tr>
						<td></td>
						<td><input type="text" name="uid" id="uid"/></td>
					</tr>-->
					
					<tr>
					<th><label for="movie-name">Movie Name: </label></th>
					<td><input type="text" name="mname" id="mname" placeholder="Movie Name" /></td>
					</tr>
					
					<tr>
					<th><label for="lang">language: </label></th>
					<td><input type="text" name="lang" id="lang" placeholder="Language" /></td>
					</tr>
					
					<tr>
					<th><label for="genre">Genre: </label></th>
					<td><input type="text" name="genre" id="genre" placeholder="Genre" /></td>
					</tr>
					
					<tr>
					<th><label for="director">Director: </label></th>
					<td><input type="text" name="director" id="director" placeholder="Director Name" /></td>
					</tr>
					
					<tr>
					<th><label for="stars">Starring: </label></th>
					<td><input type="text" name="stars" id="stars" placeholder="Starring"/></td>
					</tr>
					
					<tr>
					<th><label for="story">Story: </label></th>
					<td><input type="text" name="story" id="story" placeholder="Story"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="add-movie" id="add-movie" class="submit-btn" value="Add" onclick="return validate()"/>
						<input type="reset" name="clearup" id="clearup" class="clear-btn" value="Re-Set" /></td>
					</tr>
				</table>
			</form>
	</div>
</body>
</html>