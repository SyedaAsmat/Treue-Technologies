<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Online Book Store</title>
<style>
.signup-container{
	margin-left: auto;
	margin-right: auto;
	margin-top: 5%;
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
input[type=reset]{
	text-align: center;
	background-color: #A78295;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=reset]:focus{
	background-color: #3F2E3E;
	color: white;
}
h3, p{
	font-size: 10px;
}
/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
}

</style>
<script type="text/javascript">
	function validate(){
		var uname = document.getElementById("uname").value;
		var uemail = document.getElementById("uemail").value;
		var pwd = document.getElementById("pwd").value;
		var uadd = document.getElementById("uadd").value;
		//console.log(" - > ", uname);
		//console.log(" - > ", uadd);
		if (!uname){  
			  alert("Name can't be blank");  
			  return false;  
			}
		
		//console.log1("ADD - > ", uadd)
	  	   if(!uadd){  
			  alert("Address can't be blank");  
			  return false;  
			}
		
		atpos = uemail.indexOf("@");
        dotpos = uemail.lastIndexOf(".");
        if (atpos < 1 || ( dotpos - atpos < 2 )) {
           alert("Please enter correct email Id");
           document.getElemetById("uemail").focus() ;
           return false;
        }
        //alert("Valid email Id!");
        if(pwd == "") {  
            alert("Fill the password please!");
            document.getElementById("pwd").focus();
            return false;  
         }  
        
        var phoneno = /^\d{10}$/;
  	  	if(ucontact.value.match(phoneno))
  	  	{
  	      return true;
  	  	}
  	  	else
  	  	{
  	    	 alert("Not a valid Phone Number");
  	     	return false;
  	  	}
  	  	return true;
	}
	function password_validator() {
		let pwd = document.getElementById("pwd");
		//console.log("OKKK - > ", pwd, pwd.value);
		
		// Validate lowercase letters
        let lowerCaseLetters = /[a-z]/g;
        if(pwd.value.match(lowerCaseLetters)) {  
          letter.classList.remove("invalid");
          letter.classList.add("valid");
        } else {
          letter.classList.remove("valid");
          letter.classList.add("invalid");
        }
		
		// Validate capital letters
        let upperCaseLetters = /[A-Z]/g;
        if(pwd.value.match(upperCaseLetters)) {  
          capital.classList.remove("invalid");
          capital.classList.add("valid");
        } else {
          capital.classList.remove("valid");
          capital.classList.add("invalid");
        }
		
		// Validate numbers
        var numbers = /[0-9]/g;
        if(pwd.value.match(numbers)) {  
          number.classList.remove("invalid");
          number.classList.add("valid");
        } else {
          number.classList.remove("valid");
          number.classList.add("invalid");
        }
        
        
        // Validate length
        let length = document.getElementById("length");
        if(pwd.value.length >= 8) {
          length.classList.remove("invalid");
          length.classList.add("valid");
        } else {
          length.classList.remove("valid");
          length.classList.add("invalid");
        }
        return true;
	}
</script>
</head>
<body>
	<div class="signup-container">
		<div class="signup-form">
			<h2 class="form-title" style="">Sign up</h2>
			<form method="post" action="signup" name="register-form" class="register-form" id="register-form" autocomplete="off">
				<table>
					<!--<tr>
						<td></td>
						<td><input type="text" name="uid" id="uid"/></td>
					</tr>-->
					
					<tr>
					<th><label for="name">Name: </label></th>
					<td><input type="text" name="uname" id="uname" placeholder="Your Name" /></td>
					</tr>
					
					<tr>
					<th><label for="email">Email: </label></th>
					<td><input type="email" name="uemail" id="uemail" placeholder="Your Email" /></td>
					</tr>
					
					<tr>
					<th><label for="pass">Password: </label></th>
					<td><input type="password" name="pwd" id="pwd" placeholder="Password" oninput="password_validator()" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td>
							<div id="message">
  								<h3>Password must contain the following:</h3>
  								<p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  								<p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  								<p id="number" class="invalid">A <b>number</b></p>
  								<p id="length" class="invalid">Minimum <b>8 characters</b></p>
							</div>
						</td>
					</tr>
					
					<tr>
					<th><label for="contact">Contact Number: </label></th>
					<td><input type="text" name="ucontact" id="ucontact" placeholder="Contact no" maxlength="10"/></td>
					</tr>
					
					<tr>
					<th><label for="address">Address: </label></th>
					<td><input type="text" name="uadd" id="uadd" placeholder="Your Address" maxlength="30"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" name="signup" id="signup" class="submit-btn" value="Register" onclick="return validate()"/>
						<input type="reset" name="clearup" id="clearup" class="clear-btn" value="Re-Set" /></td>
					</tr>
					
					<tr>
						<td></td>
						<td><a href="login.jsp" class="login-link">I am already member</a></td>
					</tr>
				</table>
			</form>
		</div>
			
	</div>
</body>
</html>