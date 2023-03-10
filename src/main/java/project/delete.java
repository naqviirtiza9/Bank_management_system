package project;

import java.sql.*;

import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet ;
import java.sql.Statement; 
 import java.sql.Connection ;
import java.sql.DriverManager; 
public class delete extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res) {
		String id=req.getParameter("id");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		    String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String username="root";
		String password="RHHlqv55226";
		    Connection conn=DriverManager.getConnection(url, username, password);
			Statement st=conn.createStatement();
			int i=st.executeUpdate("DELETE FROM user_reg WHERE Acc_num="+id);
		    
			res.sendRedirect("add_remove_accounts.jsp");
		}
		catch(Exception e)
		{
		System.out.println(e);
		e.printStackTrace();
		}
	}
}