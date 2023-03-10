package project;

import java.io.IOException;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.sql.Statement;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@MultipartConfig
public class login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session=request.getSession();
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		// variables for connection 
		// final String url = "jdbc:mysql:///db_project";
		int count=0;
		String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String user="root";
		String password="RHHlqv55226";
		  String u=request.getParameter("login_us");
		  String p=request.getParameter("login_pa");
		  System.out.println(u+" "+p);
		  
		 // establish the connection 
		 Connection con = null;
			try {
				con = DriverManager.getConnection(url, user,  password);
				String fn = null,ln=null,dob=null,CNIC=null,phone=null,Address=null,City=null,username=null,email=null,pass=null,Acc_num=null,Amount=null;
				Statement ss=con.createStatement();
				ResultSet sw=ss.executeQuery("SELECT * FROM accounts WHERE Username='"+u+"' OR email='"+u+"' AND password='"+p+"'");
				while(sw.next()) {
					fn=sw.getString("first_name");
					ln=sw.getString("last_name");
					dob=sw.getString("Date_of_birth");
					CNIC=sw.getString("CNIC");
					phone=sw.getString("phone");
					Address=sw.getString("Address");
					City=sw.getString("City");
					username=sw.getString("Username");
					email=sw.getString("email");
					pass=sw.getString("Password");
					Acc_num=sw.getString("Acc_num");
					Amount=sw.getString("Amount");
				}
				session.setAttribute("user_fn", fn);
				session.setAttribute("user_ln", ln);
				session.setAttribute("user_dob", dob);
				session.setAttribute("user_cnic", CNIC);
				session.setAttribute("user_phone", phone);
				session.setAttribute("user_Address", Address);
				session.setAttribute("user_City", City);
				session.setAttribute("user_username", username);
				session.setAttribute("user_email", email);
				session.setAttribute("user_password", pass);
				session.setAttribute("user_Acc_num", Acc_num);
				session.setAttribute("user_Amount", Amount);
				
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		  
		 // display status message 
		 if (con == null) { 
			 PrintWriter out=response.getWriter();
		 out.println("JDBC connection is not established");  return; 
		  
		 } else { 
			 String q="SELECT * FROM accounts WHERE Username='"+u+"' OR email='"+u+"' AND password='"+p+"'";
			 
			 Statement s1 = null;
			try {
				s1 = con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 
			 try {
				rs = s1.executeQuery(q);
				while(rs.next()) {
					if(rs.getString("Username").equals(u)|| rs.getString("email").equals(u) && rs.getString("password").equals(p)) {
						count=1;
					}
					else {
						count=0;
					}
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		  try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  if(count==0) {
				response.sendRedirect("login_or_register.jsp");
			}
			else {
				response.sendRedirect("home.jsp");
			}
		 } 
	}

}
