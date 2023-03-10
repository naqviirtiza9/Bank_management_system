<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Bank Management System</title>
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
					<li><a href="EmpLogin.jsp">Log Out</a></li>
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
				<p>
				Welcome to our bank management system. this is a project for our SCD/DB. We ensure your data is <strong>Safe</strong> here
				</p>
			</div>
			<div class="box" id="content-box2">
				<h3>Employee ID: <%out.println((String)session.getAttribute("emp_id")); %></h3>
				
			</div>
			<br class="clearfix" />
		</div>
		<div id="sidebar">
			<div class="box">
				
			</div>
			<div class="box">
				
			</div>
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