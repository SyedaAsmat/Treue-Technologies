<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="parkingSystem.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="UserHeader.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Admin - Add Books</title>
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
    .booking-container{
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
	height: 30px;
	width: auto;
	font-size: 15px;
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
input[type="date"]{
    background-color: #A78295;
    padding: 15px;
    position: absolute;
    transform: translate(-50%,-50%);
    font-family: "Roboto Mono",monospace;
    font-size: 15px;
    border: none;
    outline: none;
    border-radius: 5px;
    box-sizing: border-box;
}
::-webkit-calendar-picker-indicator{
    background-color: #ffffff;
    padding: 5px;
    cursor: pointer;
    border-radius: 3px;
}
select{
	cursor: pointer;
	background-color: #A78295;
	padding: 15px;
	font-size: 15px;
    border: none;
    outline: none;
    box-sizing: border-box;
    position: relative;
}
alert{
font-size: 15px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
function validate(){
	
}
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var maxDate = year + '-' + month + '-' + day;
    
 // or instead:
    // var maxDate = dtToday.toISOString().substr(0, 10);

    //alert(maxDate);
    $('#bdate').attr('min', maxDate);
});
</script>
</head>
<body>
	<div class="booking-container">
		<div class="content-head">
    		<p class="on-head">Book Parking Slot</p>
    	</div>
    	<%
    String msg = request.getParameter("msg");
    if("booked".equals(msg)){
    	%>
    	<h4 class="alert" style="color:green;font-size:15px;">Booked for you.</h4>
    <%}%>
    <%
    if("exist".equals(msg)){
    	%>
    	<h4 class="alert" style="color:red;font-size:15px;">Already booked. Try another.</h4>
    <%}%>
    <%
    if("invalid".equals(msg)){
    	%>
    	<h4 class="alert" style="color:red;font-size:15px;">Some error occurred. Please try later.</h4>
    <%}%>
			<form method="post" action="bookNow" name="slot-booking-form" class="slot-booking-form" id="slot-booking-form" autocomplete="off">
				<table>
				<%
				int cost = 0;
				String uemail = session.getAttribute("uemail").toString();
				//System.out.println(uemail);
	    		try{
	    			Connection con = ConnectionProvider.getCon();
	    			Statement st = con.createStatement();
	    			ResultSet rs = st.executeQuery("select cost from parkcost");
	    			while(rs.next()){
	    				cost = rs.getInt(1);
	    			}
				%>
					<tr>
						<td><input type="hidden" value="<%= session.getAttribute("uemail") %>"></td>
					<tr>
					<tr>
					<th><label for="booking-date">Select Date: </label></th>
					<td><input type="date" name="bdate" id="bdate"/></td>
					</tr>
					
					<tr>
					<th><label for="park-time">Select Parking time: </label></th>
					<td>
					<select name="timeslot" id="timeslot">
						<option value="--Select Time--">--Select Time--</option>
						<option value="6">06:00</option>
						<option value="7">07:00</option>
						<option value="8">08:00</option>
						<option value="9">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
					</select>
					</tr>
					
					<tr>
					<th><label for="hour">Select Parking Hours: </label></th>
					<td>
					<select name="slothour" id="slothour">
						<option value="--Select Hours--">--Select Hours--</option>
						<option value="1">1 hrs</option>
						<option value="2">2 hrs</option>
						<option value="3">3 hrs</option>
						<option value="4">4 hrs</option>
						<option value="5">5 hrs</option>
						<option value="6">6 hrs</option>
					</select>
					</td>
					</tr>
				
					<tr>
						<th><label for="cost">Parking cost in Rupees: </label></th>
						<td><input type="text" name="cost" id="cost" value="<% out.println(cost); %>" readonly/></td>
					</tr>
					</table>

    	
					<br>
					<table border=1>
						<tr>
							<td><input type = "radio" name = "plot" value="p11"></td>
							<td><input type = "radio" name = "plot" value="p12"></td>
							<td><input type = "radio" name = "plot" value="p13"></td>
							<td><input type = "radio" name = "plot" value="p14"></td>
							<td><input type = "radio" name = "plot" value="p15"></td>
						</tr>
						<tr>
							<td><input type = "radio" name = "plot" value="p21"></td>
							<td><input type = "radio" name = "plot" value="p22"></td>
							<td><input type = "radio" name = "plot" value="p23"></td>
							<td><input type = "radio" name = "plot" value="p24"></td>
							<td><input type = "radio" name = "plot" value="p25"></td>
						</tr>
						<tr>
							<td><input type = "radio" name = "plot" value="p31"></td>
							<td><input type = "radio" name = "plot" value="p32"></td>
							<td><input type = "radio" name = "plot" value="p33"></td>
							<td><input type = "radio" name = "plot" value="p34"></td>
							<td><input type = "radio" name = "plot" value="p35"></td>
						</tr>
						<tr>
							<td><input type = "radio" name = "plot" value="p41"></td>
							<td><input type = "radio" name = "plot" value="p42"></td>
							<td><input type = "radio" name = "plot" value="p43"></td>
							<td><input type = "radio" name = "plot" value="p44"></td>
							<td><input type = "radio" name = "plot" value="p45"></td>
						</tr>
						
						
					</table>
					<% 
	    		}catch(Exception e){
    			System.out.println(e);
    		}
    		%>
					<br>
					<table>
					<tr>
					<th><label for="park-time">Select Payment Mode: </label></th>
					<td>
					<select name="pay" id="pay">
						<option value="--Select Payment Mode--">--Select Payment Mode--</option>
						<option value="Payment on arrival">Payment On Arrival</option>
						<option value="UPI">UPI</option>
					</select></td>
					</tr>
					<tr>
						<th><label for="transactionId">Enter Transaction Id:<br>Pay on: asmatabidi@sample<br>Note: Only if payed through upi </label></th>
						<td><input type="text" name="tid" id="tid"/></td>
					</tr>
					</table>
					<br>
					<table>
					<tr>
					<td></td>
						<td><input type="submit" name="book-slot" id="book-slot" class="submit-btn" value="Book Now" onclick="#"/>
						<input type="reset" name="clearup" id="clearup" class="clear-btn" value="Re-Set" /></td>
					</tr>
				</table>
				
			</form>
	</div>
</body>
</html>