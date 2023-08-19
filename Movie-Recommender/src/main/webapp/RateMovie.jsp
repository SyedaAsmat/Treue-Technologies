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
<title>Rate Movie</title>
<style>
body{
    	margin: 0;
    }
    .rate-container{
    	padding-top: 50px;
    	text-align: center;
    	font-size: 40px;
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
	border: none;
	font-size: 18px;
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
	color: white;
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
.rating-box .stars{
	display: flex;
	gap: 15px;
	align-items: center;
	font-size: 25px;
	
}
.star-input {
  display: none;
  
}

.star {
  color: gold;
  cursor: pointer;
}

.star-input:checked + .star ~ .star {
  color: white;
}
</style>
<script>
function validate(){
	const form = document.querySelector('form');
	form.addEventListener('submit', event => {
		  const formData = new FormData(event.target);
		  const rating = formData.get('rating');
		  //console.log(rating);
		  event.preventDefault();
		});
}
function goBack(){
	location.href="UserHome.jsp";
}
</script>
</head>
<body>
	<div class="rate-container">
		<div class="content-head">
    	<p class="on-head">Movie Details</p>
    </div>
			<form method="post" action="addrating" name="rate-movie-form" class="rate-movie-form" id="rate-movie-form" autocomplete="off">
			<%
			
			String id = request.getParameter("id");
			String uemail = (String) session.getAttribute("uemail");
    		try{
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();

    			ResultSet rs = st.executeQuery("select * from movies where id='" + id + "'");
    			while(rs.next()){%>
				<input type="hidden" name="mid" id="id" value="<%= rs.getString("id") %>" />
				<table>
					<tr>
						<th><label for="movie-name">Movie Name: </label></th>
							<td><input type="text" name="mname" value="<%= rs.getString("mname") %>" readonly/></td>
					</tr>
					<tr>
						<th><label for="Director">Director: </label></th>
							<td><input type="text" name="director" value="<%= rs.getString("director") %>" readonly/></td>
					</tr>
					<tr>
						<th><label for="stars">Stars: </label></th>
							<td><input type="text" name="stars" value="<%= rs.getString("stars") %>" readonly/></td>
					</tr>
					<tr>
						<th><label for="genre">Genre: </label></th>
							<td><input type="text" name="genre" value="<%= rs.getString("genre") %>" readonly/></td>
					</tr>
					
					<tr>
						<th><label for="language">Language: </label></th>
							<td><input type="text" name="language" value="<%= rs.getString("lang") %>" readonly/></td>
					</tr>
					<tr>
						<th><label for="story">Story: </label></th>
							<td style="text-align: justify"><input type="text" name="story" value="<%= rs.getString("story") %>" readonly/></td>
					</tr>
					<%}
    			ResultSet rs1 = st.executeQuery("select uemail from users where uemail = '"+uemail+"'");
        		while(rs1.next()){
        			String email = rs1.getString("uemail");
        			//System.out.println("Email -->" +email);
					%>
				</table>
				<input type="hidden" name="uemail" value="<%= rs1.getString("uemail") %>">
				<div class="content-body">
    				<p class="on-head">How was the <b>Movie?</b></p>
    			</div>
						<table class="rating-box">
						<tr>
						<td></td>
							<td>
							<div class="stars">
								<input type="radio" class="star-input" name="rating" id="star-1" value="1">
  								<label for="star-1" class="star"><i class="fa fa-star"></i></label>
  								
  								<input type="radio" class="star-input" name="rating" id="star-2" value="2">
  								<label for="star-2" class="star"><i class="fa fa-star"></i></label>
  								
  								<input type="radio" class="star-input" name="rating" id="star-3" value="3">
  								<label for="star-3" class="star"><i class="fa fa-star"></i></label>
  								
  								<input type="radio" class="star-input" name="rating" id="star-4" value="4">
  								<label for="star-4" class="star"><i class="fa fa-star"></i></label>
  								
  								<input type="radio" class="star-input" name="rating" id="star-5" value="5" checked>
  								<label for="star-5" class="star"><i class="fa fa-star"></i></label>
							</div>
							</td>
						</tr>
				<tr>
				<td></td>
					<td><input type="submit" name="add-rate" id="add-rate" class="submit-btn" value="Sure" onclick="return validate()"/>
					<a><input type="button" name="cancel" id="cancel" class="cancel-btn" value="Cancel" onclick="return goBack()"/></a></td>
				</tr>
			</table>
			<%
        		}	
    		}catch(Exception e){
						System.out.println(e);
					}
			%>
		</form>
	</div>