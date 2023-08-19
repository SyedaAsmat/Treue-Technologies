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
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class BookSlot
 */
@WebServlet("/bookNow")
public class BookSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 /*here we use name attribute of input tag*/
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("uemail");
		String bdate = request.getParameter("bdate");
		String timeslot = request.getParameter("timeslot");
		String slothour = request.getParameter("slothour");
		String cost = request.getParameter("cost");
		String plot = request.getParameter("plot");
		String pay = request.getParameter("pay");
		String tid = request.getParameter("tid");
		int z = 0;
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/parkingsystemdb?autoReconnect=true&useSSL=false","root","password@123");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from bookings where uemail='" + uemail + "' and bdate = '"+bdate+"' and timeslot = '"+timeslot+"' and slothour = '"+slothour+"' and plot = '"+plot+"'");
			while (rs.next()) {
				z = 1;
			}
			if(z == 1) {
				response.sendRedirect("Booking.jsp?msg=exist");
			}
			if(z == 0) {
			PreparedStatement pst = con.prepareStatement("insert into bookings (uemail,bdate,timeslot,slothour,price,plot,pay,tid) values (?,?,?,?,?,?,?,?)");
			pst.setString(1, uemail);
			pst.setString(2, bdate);
			pst.setString(3, timeslot);
			pst.setString(4, slothour);
			pst.setString(5, cost);
			pst.setString(6, plot);
			pst.setString(7, pay);
			pst.setString(8, tid);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("Booking.jsp?msg=booked");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				dispatcher = request.getRequestDispatcher("Booking.jsp?msg=invalid");
			}
		}
	}

}
