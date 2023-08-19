package moviePackage;

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
@WebServlet("/addrating")
public class addRating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String genre = request.getParameter("genre");
		String stars = request.getParameter("stars");
		String uemail = request.getParameter("uemail");
		String rating = request.getParameter("rating");
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/moviedb?autoReconnect=true&useSSL=false","root","password@123");
			PreparedStatement pst = con.prepareStatement("insert into rated (mid,mname,genre,stars,uemail,rate) values (?,?,?,?,?,?)");
			pst.setString(1, mid);
			pst.setString(2, mname);
			pst.setString(3, genre);
			pst.setString(4, stars);
			pst.setString(5, uemail);
			pst.setString(6, rating);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("RateMovie.jsp?msg='done'");
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
				dispatcher = request.getRequestDispatcher("RateMovie.jsp?msg='invalid'");
			}
		}
	}

}
