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
	int i=st.executeUpdate("DELETE FROM employees WHERE employee_id='"+id+"'");
out.println("Data Deleted Successfully!");
	response.sendRedirect("add_or_remove_employees.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>