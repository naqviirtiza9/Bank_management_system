package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Statement;
import java.util.Random;


public class checkApply extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String acc=(String)session.getAttribute("user_Acc_num");
		try {
			ResultSet r1=null;
			String a=null;
			Class.forName("com.mysql.jdbc.Driver");
		    String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String username="root";
		String password="RHHlqv55226";
		    Connection conn=DriverManager.getConnection(url, username, password);
		    int count1=0,count2=0;
		    Statement st=conn.createStatement();
		    Statement st2=conn.createStatement();
		    Statement st3=conn.createStatement();
		    String q1="SELECT * FROM checkbooks WHERE Acc_num='"+acc+"'";
		    r1=st.executeQuery(q1);
		    System.out.println(count1);
		    if(r1.next()) {
		    	a="You already have a checkBook, Cannot create new One";
		    }
		    else
		    {
		    	Random rnd = new Random();
			    int ID = rnd.nextInt(99999999);
			    String id=""+ID;
		    	int count3=st3.executeUpdate("INSERT INTO checkbooks VALUES('"+id+"','"+acc+"')");
		    	a="Congratulations you have Successfully issued a Checkbook, Please Collect it from the Bank";
		    }
		    st.close();
		    st2.close();
		    r1.close();
		    response.sendRedirect("debitAppChe.jsp?id="+a);
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
