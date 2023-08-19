<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="UserHeader.jsp"%>
<%
String uemail = session.getAttribute("uemail").toString();
String bid = request.getParameter("id");
//System.out.println("OKK - > " + bid);
int quantity = 1;
int price = 0;
int book_total = 0;
int cart_total = 0;

int z = 0;
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from books where id = '" + bid + "'");
	while (rs.next()) {
		price = rs.getInt(5);
		book_total = price;
	}
	ResultSet rs1 = st.executeQuery("select * from cart where bid = '" + bid + "' and uemail='" + uemail + "'");
	while (rs1.next()) {
		cart_total = rs1.getInt(6);
		cart_total = cart_total + book_total;
		quantity = rs.getInt(4);
		quantity = quantity + 1;
		z = 1;
	}
	if (z == 1) {
		st.executeUpdate("update cart set total='" + cart_total + "', quantity='" + quantity + "' where bid='" + bid
		+ "' and uemail='" + uemail + "'");
		response.sendRedirect("UserHome.jsp?msg=exist");
	}
	//System.out.println("BID - > " + bid);
	if (z == 0) {
		PreparedStatement pst = con
		.prepareStatement("insert into cart (uemail,bid,quantity,price,total) values (?,?,?,?,?)");
		pst.setString(1, uemail);
		pst.setString(2, bid);
		pst.setInt(3, quantity);
		pst.setInt(4, price);
		pst.setInt(5, book_total);
		pst.executeUpdate();
		response.sendRedirect("UserHome.jsp?msg=added");
	}
} catch (Exception e) {
	System.out.print(e);
	response.sendRedirect("UserHome.jsp?msg=invalid");
}
%>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	margin: 0;
}
</style>
</head>
<body>
</body>
</html>