<%@page import="parkingSystem.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String uemail = session.getAttribute("uemail").toString();
String id = request.getParameter("id");
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from bookings where uemail = '"+uemail+"' and id='"+id+"'");
	response.sendRedirect("UserBookings.jsp?msg=removed");
}catch(Exception e){
	System.out.println(e);
}
%>