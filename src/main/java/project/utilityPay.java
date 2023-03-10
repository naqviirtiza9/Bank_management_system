package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Resultset;

@MultipartConfig
public class utilityPay extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		try {
			String e;
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
			String username="root";
			String password="RHHlqv55226";
		       Connection conn=DriverManager.getConnection(url, username, password);
			
		      
		       
			Random rnd = new Random();
		    int t_id = rnd.nextInt(99999);
			String T_id="t"+t_id;
			
			   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			   LocalDateTime now = LocalDateTime.now();  
			   
			   String fromAcc=null;
			   String am=null;
			   String cat=null;
			   fromAcc=(String)session.getAttribute("biller_acc");
			   am=(String)session.getAttribute("biller_amount");
			   cat=(String)session.getAttribute("biller_cat");
			   
			   System.out.println(fromAcc);
			   
			   
			   String u1="INSERT INTO transactions VALUES( '"+T_id+"' ,'"+fromAcc+"' , '"+am+"' , '"+"-"+"' ,'"+dtf.format(now)+"' , '"+"-"+"', '"+cat+" Bill Payment"+"')";
			   Statement st=conn.createStatement();
			   ResultSet r= st.executeQuery("SELECT * from accounts where Acc_num="+fromAcc);
			   int balance=0;
			   while(r.next()) {
				   balance=Integer.parseInt(r.getString("Amount"));
			   }
			   if(balance>=Integer.parseInt(am)) {
				   balance-=Integer.parseInt(am);
				   e="Bill Payment Successful";
				   Statement s1=conn.createStatement();
				   String u2="UPDATE user_reg SET Amount='"+balance+"' WHERE Acc_num='"+fromAcc+"'";
				   String u3="UPDATE accounts SET Amount='"+balance+"' WHERE Acc_num='"+fromAcc+"'";
				   int i=s1.executeUpdate(u1);
				   i=s1.executeUpdate(u2);
				   i=s1.executeUpdate(u3);
				   s1.close();
				   session.setAttribute("user_Amount", ""+balance);
			   }
			   else {
				   e="Not Enough balance to pay bill";
			   }
			   st.close();
			   response.sendRedirect("debitAppChe.jsp?id="+e);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
