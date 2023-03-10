package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class jobApply extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    int count = 0,count2=0;
		String fn=request.getParameter("job_FN");
		String ln=request.getParameter("job_LN");
		String dob=request.getParameter("job_DOB");
		String cnic=request.getParameter("job_cnic");
		String mobile=request.getParameter("job_mobile_num");
		String add=request.getParameter("job_address");
		String city=request.getParameter("job_city");
		String username=request.getParameter("job_username");
		String email=request.getParameter("job_email");
		String pass=request.getParameter("job_password");
		System.out.println(fn+" "+ln);
		
//		String q = "INSERT INTO user_reg VALUES('"+fn+"','"+ln+"','"+dob+"','"+cnic+"','"+mobile+"','"+add+"','"+city+"','"+username+"','"+email+"','"+pass+"','"+account_num+"')";
		 
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		// variables for connection 
		String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String user="root";
		String password="RHHlqv55226";
		  
		 // establish the connection 
		 Connection con = null;
		try {
			con = DriverManager.getConnection(url, user,  password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  String q ="INSERT INTO jobapply VALUES(?,?,?,?,?,?,?,?,?,?)";
		 if (con == null) { 
			 PrintWriter out=response.getWriter();
		 out.println("JDBC connection is not established");  return; 
		  
		 } else { 
			 PreparedStatement s2 = null;
				try {
					s2=con.prepareStatement(q);
					s2.setString(1, fn);
					s2.setString(2, ln);
					s2.setString(3, dob);
					s2.setString(4, cnic);
					s2.setString(5, mobile);
					s2.setString(6, add);
					s2.setString(7, city);
					s2.setString(8, username);
					s2.setString(9, email);
					s2.setString(10, pass);
				} catch (SQLException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
			 try {
				count=s2.executeUpdate();
				System.out.println(count);
			} catch (SQLException e) {
				System.out.println("\nh3");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  try {
			s2.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 } 
		 
		 response.sendRedirect("jobApplication.jsp");
	}

}
