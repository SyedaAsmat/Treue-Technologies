<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Movie Recommender</title>
<style>
.signin-container{
	margin-left: auto;
	margin-right: auto;
	margin-top: 15%;
	width: 55%;
	box-shadow:
	0 100px 80px rgba(0, 0, 0, 0.12),
	0 22.3px 17.9px rgba(0, 0, 0, 0.072),
	0 41.8px 33.4px rgba(0, 0, 0, 0.086),
	0 100px 80px rgba(0, 0, 0, 0.12) ;
	border-radius: 10px;
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
</style>
<script>
function validate(){
	var username = document.getElementById("username").value;
	var pwd = document.getElementById("pwd").value;
	
	if (!username){  
		  alert("Username can't be blank");  
		  return false;  
		}
    if(pwd < 8) {  
        alert("Please enter the correct password!");
        document.getElementById("pwd").focus();
        return false;  
     }  
    return true;
}
</script>
</head>
<body>
	<!-- Sign in  Form -->
	<div class="signin-container">
		<div class="signin-form">
			<h2 class="form-title">Admin Log In</h2>
			<form method="post" action="admin-login" class="admin-login-form" id="admin-login-form" autocomplete="off">
				<table>
					<tr>
						<th><label for="username">Username: </label></th>
						<td><input type="text" name="username" id="username" placeholder="Your Username" /></td>
					</tr>
					
					<tr>
						<th><label for="pass">Password: </label></th>
						<td><input type="password" name="pwd" id="pwd" placeholder="Password"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="signin" id="signin" class="form-submit" value="Log in" onclick="return validate()"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>