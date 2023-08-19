package parkingSystem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class updatePassword
 */
@WebServlet("/updatePwd")
public class updatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("uemail");
		
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/parkingsystemdb?autoReconnect=true&useSSL=false","root","password@123");
			Statement st = con.createStatement();
			st.executeUpdate("update users set pwd='"+pwd+"' where uemail='"+uemail+"'");
			
			response.sendRedirect("UserProfile.jsp?msg=done");
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("editPassword.jsp?msg=wrong");
			}
		}
	}
}