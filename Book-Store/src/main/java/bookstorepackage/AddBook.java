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

/**
 * Servlet implementation class AddBook
 */
@WebServlet("/addbook")
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*PrintWriter out = response.getWriter();
		out.print("Working");*/
		
		String bname = request.getParameter("bname"); /*here we use name attribute of input tag*/
		String genre = request.getParameter("genre");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		
		/*PrintWriter out = response.getWriter();
		out.print(uname);
		out.print(uemail);
		out.print(pwd);
		out.print(ucontact);
		out.print(uadd);*/
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/bookstoredb?autoReconnect=true&useSSL=false","root","password@123");
			PreparedStatement pst = con.prepareStatement("insert into books (bname,genre,author,price) values (?,?,?,?)");
			pst.setString(1, bname);
			pst.setString(2, genre);
			pst.setString(3, author);
			pst.setString(4, price);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("AddBooks.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
