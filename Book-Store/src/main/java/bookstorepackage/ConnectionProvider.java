package bookstorepackage;

//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import java.sql.*;

/**
 * Servlet implementation class ConnectionProvider
 */
//@WebServlet("/")
public class ConnectionProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public static Connection getCon() {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/bookstoredb?autoReconnect=true&useSSL=false","root","password@123");
			return con;
    	}catch(Exception e) {
    		System.out.print(e);
    		return null;
    	}
    }
}
