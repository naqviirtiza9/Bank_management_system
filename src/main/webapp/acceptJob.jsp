<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import= "java.util.Random" %>
<%
String user=request.getParameter("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
    String username="root";
    String password="RHHlqv55226";
    Connection conn=DriverManager.getConnection(url, username, password);
	Statement st=conn.createStatement();
	Statement st2=conn.createStatement();
	Random rnd = new Random();
	String query="SELECT * FROM jobapply";
	String q2="INSERT INTO employees VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	ResultSet rs=st.executeQuery(query);
    int E_id = rnd.nextInt(9999);
    String e_id=""+E_id;
    String fn=null;
	String ln=null;
	String dob=null;
	String cnic=null;
	String mobile=null;
	String add=null;
	String city=null;
	String us=null;
	String email=null;
	String pass=null;
	while(rs.next()){
		fn=rs.getString("first_name");
		ln=rs.getString("last_name");
		dob=rs.getString("DOB");
		cnic=rs.getString("CNIC");
		mobile=rs.getString("mobile");
		add=rs.getString("address");
		city=rs.getString("city");
		us=rs.getString("username");
		email=rs.getString("email");
		pass=rs.getString("password");
		if(user==us){
			break;
		}
	}
	PreparedStatement sq=null;
	sq=conn.prepareStatement(q2);
	sq.setString(1,fn);
	sq.setString(2,ln);
	sq.setString(3,dob);
	sq.setString(4,cnic);
	sq.setString(5,mobile);
	sq.setString(6,add);
	sq.setString(7,city);
	sq.setString(8,us);
	sq.setString(9,email);
	sq.setString(10,pass);
	sq.setString(11,e_id);
	System.out.print(cnic);
	rs.close();
	int count=sq.executeUpdate();
	conn.close();
	response.sendRedirect("viewApplication.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>