<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String uemail = session.getAttribute("uemail").toString();
String uadd = request.getParameter("uadd");
String ucontact = request.getParameter("ucontact");
String pay_mode = request.getParameter("payment_mode");
String tid = "";
tid = request.getParameter("transactionId");
String status = "bill";

try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("update users set uadd = ?, ucontact = ? where uemail = ?");
	pst.setString(1, uadd);
	pst.setString(2, ucontact);
	pst.setString(3, uemail);
	
	pst.executeUpdate();
	
	
	PreparedStatement pst1 = con.prepareStatement("update cart set uadd = ?, ucontact = ?, orderDate = now(), deliveryDate = DATE_ADD(orderDate, INTERVAL 7 DAY),  paymentMethod = ?, transactionId = ?, status = ? where uemail = ? and uadd is NULL");
	
	pst1.setString(1, uadd);
	pst1.setString(2, ucontact);
	pst1.setString(3, pay_mode);
	pst1.setString(4, tid);
	pst1.setString(5, status);
	pst1.setString(6, uemail);
	pst1.executeUpdate();
	
	response.sendRedirect("Bill.jsp");
}catch(Exception e){
	System.out.println(e);
}


%>