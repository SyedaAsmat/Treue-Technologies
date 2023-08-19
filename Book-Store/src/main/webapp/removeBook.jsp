<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String uemail = session.getAttribute("uemail").toString();
String id = request.getParameter("id");
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from cart where uemail = '"+uemail+"' and bid='"+id+"' and uadd is NULL");
	response.sendRedirect("MyCart.jsp?msg=removed");
}catch(Exception e){
	System.out.println(e);
}
%>