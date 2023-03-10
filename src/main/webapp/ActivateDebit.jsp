<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
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
	int i=st.executeUpdate("DELETE FROM debit_card_app WHERE Acc_num='"+id+"'");
	out.println("Data Deleted Successfully!");
	Random rnd = new Random();
	int a1 = rnd.nextInt(9999);
	int a2 = rnd.nextInt(9999);
	int a3 = rnd.nextInt(9999);
	int a4 = rnd.nextInt(9999);
	String card_num=a1+"-"+a2+"-"+a3+"-"+a4;
	i=st.executeUpdate("INSERT INTO debit_cards VALUES('"+card_num+"','"+id+"')");
	st.close();
	response.sendRedirect("ActivateDebitCard.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>