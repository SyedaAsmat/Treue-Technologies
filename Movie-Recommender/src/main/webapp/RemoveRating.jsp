<%@page import="moviePackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String id = request.getParameter("id");
System.out.println("ID-->"+id);
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from rated where id='"+id+"'");
	response.sendRedirect("ViewSuggestions.jsp?msg=removed");
}catch(Exception e){
	System.out.println(e);
}
%>