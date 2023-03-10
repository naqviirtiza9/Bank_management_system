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
					<li><a href="home.jsp">Home</a></li>
					<li><a href="viewAccount.jsp">View Account Details</a></li>
					<li><a href="debitCardApply.jsp">Activate Debit Card</a></li>
					<li><a href="issueCheckBook.jsp">Issue Check Book</a></li>
					<li><a href="registerComplaint.jsp">Register Complaint</a></li>
					<li><a href="sendMoney.jsp">Send Money</a></li>
					<li><a href="UtilityBillPayment.jsp">Pay Utility Bills</a></li>
					<li><a href="viewMytransactions.jsp">View My Transactions</a></li>
					<li><a href="loanApply.jsp">Loan Application</a></li>
					<li><a href="login_or_register.jsp">Log Out</a></li>
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
				<h2><%out.print((String)session.getAttribute("user_fn")+" "+(String)session.getAttribute("user_ln")); %></h2>
				
				
				
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.Types" %>

<form method="get">
<div style=" height:860px; overflow:auto">
<table class="Tabl" border="1" style="border:4px solid white;margin-left:auto;margin-right:auto;">
   <tr>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Transaction ID</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Account Number</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Amount withdrawn</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Amount Deposited</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Withdraw time</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Deposit time</b></td>
        <td style="margin-left:auto;margin-right:auto; color: green; background-color: white"><b>Type</b></td>
   </tr>
   <%
   try
   {
	   String acc=(String)session.getAttribute("user_Acc_num");
       Class.forName("com.mysql.jdbc.Driver");
       String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String username="root";
		String password="RHHlqv55226";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       //ResultSet rs=stmt.executeQuery(query);
       ResultSet rs=null;
       CallableStatement cs=null;
       cs = conn.prepareCall("call getMyTransactions(?)");
		cs.setString(1, acc);
		rs = cs.executeQuery();
       while(rs.next())
       {
   %>
           <tr><td><%=rs.getString("t_id")%></td>
           <td><%=rs.getString("Acc_num") %></td>
           <td><%=rs.getString("AmtWith") %></td>
           <td><%=rs.getString("AmtDep") %></td>
           <td><%=rs.getString("withTime") %></td>
           <td><%=rs.getString("depTime") %></td>
           <td><%=rs.getString("type") %></td>
          </tr>
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
