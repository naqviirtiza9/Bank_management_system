<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Bank management system</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style33.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="jquery/jquery.slidertron-1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#menu > ul').dropotron({
			mode: 'fade',
			globalOffsetY: 11,
			offsetY: -15
		});
		$('#slider').slidertron({
			viewerSelector: '.viewer',
			indicatorSelector: '.indicator span',
			reelSelector: '.reel',
			slidesSelector: '.slide',
			speed: 'slow',
			advanceDelay: 4000
		});
	});
</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#">Bank Management System</a></h1>
		</div>
		
	</div>
	<div id="menu">
		<ul>
			<li class="first">
				<span class="opener">Services<b></b></span>
				<ul>
					<li><a href="empHome.jsp">Home</a></li>
					<li><a href="viewMyEmp.jsp">View My Details</a></li>
					<li><a href="add_remove_accounts.jsp">Add or remove Accounts</a></li>
				</ul>
			</li>
			<li>
				<span class="opener">Team<b></b></span>
				<ul>
					<li><a href="#">20k-0408 Irtiza</a></li>
					<li><a href="#">20k-0277 Hanzala</a></li>
					<li><a href="#">20p-0469 Saad Khan</a></li>
				</ul>
			</li>
		</ul>
		<br class="clearfix" />
	</div>
	<div id="slider">
		<div class="viewer">
			<div class="reel">
				<div class="slide">
					<img src="images/slide01.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide02.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide03.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide04.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide05.jpg" alt="" />
				</div>
			</div>
		</div>
		<div class="indicator">
			<span>1</span>
			<span>2</span>
			<span>3</span>
			<span>4</span>
			<span>5</span>
		</div>
	</div>
	<div id="page">
		<div  class="content2">
			<div class="box">
				<h2><%out.print((String)session.getAttribute("emp_fn")+" "+(String)session.getAttribute("emp_ln")); %></h2>
				
			<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<form method="get">
<div style="overflow-x:auto;">
<table class="Tabl" border="1" style="border:4px solid white;margin-left:auto;margin-right:auto; overflow-x: scroll;">
   <tr>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>First Name</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Last Name</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>DOB</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>CNIC</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>phone Number</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Address</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>City</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Username</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>email</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Account Number</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Actions</b></td>
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String username="root";
		String password="RHHlqv55226";
       String query="select * from accounts";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
           <tr><td><%=rs.getString("first_name")%></td>
           <td><%=rs.getString("Last_name") %></td>
           <td><%=rs.getString("date_of_birth") %></td>
           <td><%=rs.getString("CNIC") %></td>
           <td><%=rs.getString("phone") %></td>
           <td><%=rs.getString("Address") %></td>
           <td><%=rs.getString("City") %></td>
           <td><%=rs.getString("username") %></td>
           <td><%=rs.getString("email") %></td>
           <td><%=rs.getString("Acc_num") %></td>
           <td><a href="delete.jsp?id=<%=rs.getString("Acc_num")%>"><button type="button" class="delete registering">Remove</button></a></td></tr>
   <%
       }
   %>
  
   </table>
   <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
    </div>
</form>

				
			</div>
			
			<br class="clearfix" />
		</div>
		
		<br class="clearfix" />
	</div>
	<div id="page-bottom">
		<div id="page-bottom-content">
			
		</div>
		<div id="page-bottom-sidebar">
			
		</div>
		<br class="clearfix" />
	</div>
</div>
<div id="footer">
	&copy; Untitled. All rights reserved. Designed by <a href="#" rel="nofollow">S M Irtiza Aqa Naqvi</a>.
</div>
</body>
</html>
