<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
 
<%
String id=request.getParameter("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String username="root";
		String password="RHHlqv55226";
    Connection conn=DriverManager.getConnection(url, username, password);
	Statement st=conn.createStatement();
	int i=st.executeUpdate("DELETE FROM loan_app WHERE Acc_num='"+id+"'");
	out.println("Data Deleted Successfully!");
	Random rnd = new Random();
	int a1 = rnd.nextInt(9999);
	String loan_num="t_"+a1;
	String amount=(String)session.getAttribute("loanAmount");
	i=st.executeUpdate("INSERT INTO loans VALUES('"+loan_num+"','"+amount+"','"+id+"')");
	String amount2=null;
	int a  = 0;
	Statement st2=conn.createStatement();
	ResultSet r=st2.executeQuery("SELECT * from accounts where Acc_num="+id);
	while(r.next()){
		amount2=r.getString("Amount");
	}
	int a2=Integer.parseInt(amount2);
	a=Integer.parseInt(amount);
	a2+=a;
	String fa=""+a2;
	int w=st.executeUpdate("UPDATE accounts set Amount='"+fa+"' where Acc_num="+id);
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
	   LocalDateTime now = LocalDateTime.now();  
	   
	    int t_id = rnd.nextInt(99999);
		String T_id="t"+t_id;
	   
	int y=st.executeUpdate("INSERT INTO transactions VALUES( '"+T_id+"' , '"+id+"' , '"+"-"+"' , '"+amount+"' , '"+"-"+"' ,'"+dtf.format(now)+"', '"+"Loan Amount Deposit"+"' )");
	st.close();
	response.sendRedirect("AcceptLoan.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>