package parkingSystem;

import jakarta.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Servlet implementation class ConnectionProvider
 */
public class ConnectionProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public static Connection getCon() {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc is package name and Driver.java is class name
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/parkingsystemdb?autoReconnect=true&useSSL=false","root","password@123");
			return con;
    	}catch(Exception e) {
    		System.out.print(e);
    		return null;
    	}
    }
}