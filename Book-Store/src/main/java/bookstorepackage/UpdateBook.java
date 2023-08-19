package bookstorepackage;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class UpdateBook
 */
@WebServlet("/updatebook")
public class UpdateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); /*here we use name attribute of input tag*/
		String bname = request.getParameter("bname");
		String genre = request.getParameter("genre");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/bookstoredb?autoReconnect=true&useSSL=false","root","password@123");
			Statement st = con.createStatement();
			st.executeUpdate("update books set bname='"+bname+"', genre='"+genre+"', author='"+author+"', price='"+price+"' where id='"+id+"'");
			
			response.sendRedirect("ViewBooks.jsp?msg=done");
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("ViewBooks.jsp?msg=wrong");
			}
		}
	}
}
