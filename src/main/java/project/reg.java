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
public class reg extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Random rnd = new Random();
	    int acc = rnd.nextInt(999999999);
	    int count = 0,count2=0;
		String account_num=""+acc;
		String fn=request.getParameter("register_FN");
		String ln=request.getParameter("register_LN");
		String dob=request.getParameter("register_DOB");
		String cnic=request.getParameter("register_cnic");
		String mobile=request.getParameter("register_mobile_num");
		String add=request.getParameter("register_address");
		String city=request.getParameter("register_city");
		String username=request.getParameter("register_username");
		String email=request.getParameter("register_email");
		String pass=request.getParameter("register_password");
		String amount=request.getParameter("register_amount");
		System.out.println(fn+" "+ln);
		
//		String q = "INSERT INTO user_reg VAUES('"+fn+"','"+ln+"','"+dob+"','"+cnic+"','"+mobile+"','"+add+"','"+city+"','"+username+"','"+email+"','"+pass+"','"+account_num+"')";
		 
		
		
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
		  String q ="INSERT INTO user_reg VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		  String q4 ="INSERT INTO accounts VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		  String q2="INSERT INTO login_table VALUES(?,?,?)";
		 if (con == null) { 
			 PrintWriter out=response.getWriter();
		 out.println("JDBC connection is not established");  return; 
		  
		 } else { 
			 PreparedStatement s2 = null;
			 PreparedStatement s3=null;
			 PreparedStatement s4=null;
				try {
					s2=con.prepareStatement(q4);
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
					s2.setString(11, account_num);
					s2.setString(12, amount);
					
//					s3=con.prepareStatement(q2);
//					s3.setString(1, username);
//					s3.setString(2, pass);
//					s3.setString(3, email);
//					
//					s4=con.prepareStatement(q4);
//					s4.setString(1, fn);
//					s4.setString(2, ln);
//					s4.setString(3, dob);
//					s4.setString(4, cnic);
//					s4.setString(5, mobile);
//					s4.setString(6, add);
//					s4.setString(7, city);
//					s4.setString(8, username);
//					s4.setString(9, email);
//					s4.setString(10, pass);
//					s4.setString(11, account_num);
//					s4.setString(12, amount);
				} catch (SQLException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
			 try {
				count=s2.executeUpdate();
//				count2=s3.executeUpdate();
//				int count3=s4.executeUpdate();
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
		 
		 response.sendRedirect("login_or_register.jsp");
	}

}
