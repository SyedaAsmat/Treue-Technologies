<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String uemail = session.getAttribute("uemail").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price = 0;
int total = 0;
int quantity = 0;
int final_total = 0;

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where uemail = '"+uemail+"' and bid='"+id+"' and uadd is NULL");
	while(rs.next()){
		price = rs.getInt(5);
		total = rs.getInt(6);
		quantity = rs.getInt(4);
	}
	if(quantity == 1 && incdec.equals("dec"))
		response.sendRedirect("MyCart.jsp?msg=notPossible");
	else if(quantity != 1 && incdec.equals("dec")){
		total = total - price;
		quantity = quantity - 1 ;
		st.executeUpdate("update cart set total = '"+total+"', quantity = '"+quantity+"' where uemail = '"+uemail+"' and bid = '"+id+"' and uadd is NULL" );
		response.sendRedirect("MyCart.jsp?msg=dec");
	}
	else{
		total = total + price;
		quantity = quantity + 1 ;
		st.executeUpdate("update cart set total = '"+total+"', quantity = '"+quantity+"' where uemail = '"+uemail+"' and bid = '"+id+"' and uadd is NULL" );
		response.sendRedirect("MyCart.jsp?msg=inc");
	}
}catch(Exception e){
	System.out.println(e);
}
%>