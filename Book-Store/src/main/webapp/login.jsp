<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Online Book Store</title>
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
</style>
<script>
function validate(){
	var uemail = document.getElementById("uemail").value;
	var pwd = document.getElementById("pwd").value;
	//console.log(" Email- > ", uemail);
	//console.log(" Pass- > ", pwd);
	
	atpos = uemail.indexOf("@");
    dotpos = uemail.lastIndexOf(".");
    if (atpos < 1 || ( dotpos - atpos < 2 )) {
       alert("Please enter correct email Id");
       document.getElemetById("uemail").focus() ;
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
			<h2 class="form-title">Log In</h2>
			<form method="post" action="signin" class="login-form" id="login-form" autocomplete="off">
				<table>
					<tr>
						<th><label for="uemail">Email: </label></th>
						<td><input type="text" name="uemail" id="uemail" placeholder="Your Email" /></td>
					</tr>
					
					<tr>
						<th><label for="pass">Password: </label></th>
						<td><input type="password" name="pwd" id="pwd" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="signin" id="signin" class="form-submit" value="Log in" onclick="return validate()"/></td>
					</tr>
					
					<tr>
						<td><a href="Admin-Login.jsp" class="Admin-login-link">Admin Login</a></td>
						<td><a href="registration.jsp" class="signup-link">Create an account</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>