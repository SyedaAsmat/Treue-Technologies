package parkingSystem;

import jakarta.servlet.RequestDispatcher;
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
import java.sql.ResultSet;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/admin-login")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/parkingsystemdb?autoReconnect=true&useSSL=false","root","password@123");
			PreparedStatement pst = con.prepareStatement("select * from parkadmin where username = ? and pwd = ?");
			
			pst.setString(1, username);
			pst.setString(2, pwd);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("username", rs.getString("username"));
				dispatcher = request.getRequestDispatcher("AdminHome.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("AdminLogin.jsp");
			}
			dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
