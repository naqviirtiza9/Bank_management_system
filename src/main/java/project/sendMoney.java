package project;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Types;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;   
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@MultipartConfig
public class sendMoney extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String moneyToSend=request.getParameter("sendYourAm");
		HttpSession session=request.getSession();
		String bal=null;
		String AccToSend=request.getParameter("sendToAcc");
		String fromAcc=(String)session.getAttribute("user_Acc_num");
	    String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String username="root";
		String password="RHHlqv55226";
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url, username, password);
			String q1="SELECT * FROM accounts WHERE Acc_num='"+fromAcc+"'";
			String q2="SELECT * FROM accounts WHERE Acc_num='"+AccToSend+"'";
			String e="Sorry not sufficient balance";
			int ec=0;
			Statement s1=conn.createStatement();
			Statement s2=conn.createStatement();
			ResultSet rs1=s1.executeQuery(q1);
			
			ResultSet rs2=s2.executeQuery(q2);
//			if(!rs1.next()) {
//				 e="Sorry account number "+fromAcc+" not found";
////				response.sendRedirect("notFound.jsp?id="+e2);
//				ec++;
//			}
//			if(!rs2.next()) {
//				e="Sorry account number "+AccToSend+" not found";
////				response.sendRedirect("notFound.jsp?id="+e2);
//				ec++;
//			}
			
			
			int balance = 0;
			int am=Integer.parseInt(moneyToSend);
				System.out.println("hi");
			while(rs1.next())
			{
				String v1=rs1.getString("Acc_num");
				if(v1.equals(fromAcc)) {
					balance=Integer.parseInt(rs1.getString("Amount"));
				}
			}
			
			if(balance<am)
			{
				response.sendRedirect("notFound.jsp?id="+e);
				ec++;
			}
			else {
				balance-=am;
				int am2=0;
				while(rs2.next()) {
					String v1=rs2.getString("Acc_num");
					System.out.print(v1);
					if(v1.equals(AccToSend))
					{
						am2=Integer.parseInt(rs2.getString("Amount"));
						System.out.print(am2);
					}
				}
			
				String s=null;
				CallableStatement cs=conn.prepareCall("{? = call getAmount(?)}");
				cs.registerOutParameter(1, Types.VARCHAR);
				cs.setString(2, fromAcc);
				cs.execute();
				s=cs.getNString(1);
				int ss=Integer.parseInt(s);
				ss-=am;
				s=""+ss;
				
				
				
				am2+=am;
				bal=""+balance;
				String am2v2=""+am2;
//				String u1="UPDATE user_reg SET Amount='"+bal+"' WHERE Acc_num='"+fromAcc+"'";
				String u2="UPDATE accounts SET Amount='"+bal+"' WHERE Acc_num='"+fromAcc+"'";
				
//				String u3="UPDATE user_reg SET Amount='"+am2v2+"' WHERE Acc_num='"+AccToSend+"'";
				String u4="UPDATE accounts SET Amount='"+am2v2+"' WHERE Acc_num='"+AccToSend+"'";
				
				Random rnd = new Random();
			    int t_id = rnd.nextInt(99999);
				String T_id="t"+t_id;
				int t_id2 = rnd.nextInt(99999);
				String T_id2="t"+t_id2;
				
				 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				   LocalDateTime now = LocalDateTime.now();  
				   
				
				String u5="INSERT INTO transactions VALUES( '"+T_id+"' ,'"+fromAcc+"' , '"+am+"' , '"+"-"+"' ,'"+dtf.format(now)+"' , '"+"-"+"', '"+"WithDrawal"+"')";
				String u6="INSERT INTO transactions VALUES( '"+T_id2+"' , '"+AccToSend+"' , '"+"-"+"' , '"+am+"' , '"+"-"+"' ,'"+dtf.format(now)+"', '"+"Deposit"+"' )";
//				int count3=s2.executeUpdate(u1);
				int count4=s2.executeUpdate(u2);
//				int count5=s2.executeUpdate(u3);
				int count6=s2.executeUpdate(u4);
				int count7=s2.executeUpdate(u5);
				int count8=s2.executeUpdate(u6);
				rs1.close();
				rs2.close();
				s1.close();
				s2.close();
//				if(ec==0) {
//					response.sendRedirect("notFound.jsp?id="+e);
//				}
				session.setAttribute("user_Amount", bal);
				response.sendRedirect("MoneyTransferStatus.jsp?id="+s);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block\
			System.out.println("\n\n\n\n\nMy name is irti\n\n\n\n");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
