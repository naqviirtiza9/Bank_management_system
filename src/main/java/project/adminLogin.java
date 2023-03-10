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
public class adminLogin extends HttpServlet {
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
		  String u=request.getParameter("admin_us");
		  String p=request.getParameter("admin_pa");
		  System.out.println(u+" "+p);
		  
		 // establish the connection 
		 Connection con = null;
			try {
				con = DriverManager.getConnection(url, user,  password);
				String admin_id=null;
				String fn = null,ln=null,dob=null,CNIC=null,phone=null,Address=null,City=null,username=null,email=null,pass=null,e_id=null,Amount=null;
				Statement ss=con.createStatement();
				ResultSet sw=ss.executeQuery("SELECT admin_id,UPPER(admin_name) as name,username,email,password,phone FROM administration WHERE Username='"+u+"' OR email='"+u+"' AND password='"+p+"'");
				while(sw.next()) {
					admin_id=sw.getString(1);
					fn=sw.getString(2);
					username=sw.getString(3);
					email=sw.getString(4);
					pass=sw.getString(5);
					phone=sw.getString(6);
				}
				session.setAttribute("admin_fn", fn);
				session.setAttribute("admin_phone", phone);
				session.setAttribute("admin_username", username);
				session.setAttribute("admin_email", email);
				session.setAttribute("admin_password", pass);
				session.setAttribute("admin_id", admin_id);
				
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		  
		 // display status message 
		 if (con == null) { 
			 PrintWriter out=response.getWriter();
		 out.println("JDBC connection is not established");  return; 
		  
		 } else { 
			 String q="SELECT * FROM administration WHERE username='"+u+"' OR email='"+u+"' AND password='"+p+"'";
			 
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
					if(rs.getString("username").equals(u)|| rs.getString("email").equals(u) && rs.getString("password").equals(p)) {
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
				response.sendRedirect("AdminLogin.jsp");
			}
			else {
				response.sendRedirect("AdminHome.jsp");
			}
		 } 
	}

}
