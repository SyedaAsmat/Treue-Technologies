package bookstorepackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 * Servlet implementation class continueShopping
 */
@WebServlet("/continueToShop")
public class continueShopping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uemail = session.getAttribute("uemail").toString();
		String status = "processing";
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/bookstoredb?autoReconnect=true&useSSL=false","root","password@123");
			PreparedStatement pst = con.prepareStatement("update cart set status = ? where uemail = ? and status = 'bill'");
			pst.setString(1, status);
			pst.setString(2, uemail);
			pst.executeUpdate();
			response.sendRedirect("UserHome.jsp");
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
