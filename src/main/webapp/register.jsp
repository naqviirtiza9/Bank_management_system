<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!-- 
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
				<h2>Account Creation</h2>
				
				
				
<div class="body-content">
<form class="form" action="reg" style="width:100%;" method="post" autocomplete="off">
      
      First Name: <input type="text" placeholder="First Name" name="register_FN" required /><br>
      last Name: <input type="text" placeholder="Last Name" name="register_LN" required /><br>
      Date Of Birth: 
      <input type="date" name="register_DOB" required /><br><br>
      CNIC: <input type="text" pattern="^[0-9]{5}-[0-9]{7}-[0-9]{1}" placeholder="e.g 42101-8889567-3" name="register_cnic" required /><br>
      Mobile Number:
      <input type="tel" id="mobile_num" name="register_mobile_num" pattern="[0-9]{4}-[0-9]{7}"><br><br>
      Address: <input type="text" placeholder="Address" name="register_address" required /><br>
      
      City: 
      <input list="city" name="register_city" class="datalist-input" />
    <datalist id="city">
        <option value="Karachi" />
        <option value="Lahore" />
        <option value="islamabad" />
        <option value="Peshawar" />
        <option value="Quetta" />
    </datalist><br><br>
      
      Username: <input type="text" placeholder="User Name" name="register_username" required /><br>
      email: <input type="email" placeholder="Email" name="register_email" required /><br>
      Password: <input type="password" placeholder="Password" name="register_password" autocomplete="new-password" onkeyup='check();'  required /><br>
      Confirm-Password: <input type="password" placeholder="Confirm Password" name="register_confirmpassword" autocomplete="new-password" onkeyup='check();'required /><br>
      Starting amount: <input type="text" placeholder="000000" name="register_amount" required /><br>
      <span id='message'></span>
      <input type="submit" value="Register" name="register" class="registering btn btn-block btn-primary" />
    </form>
  </div>
  <script>
  document.querySelector('.registering').onclick=function(){
	  var pass=document.querySelector('register_password').value,
	      cpass=document.querySelector('register_confirmpassword').value;
	  if(pass==""){
		  alert("the password cannot be empty")
		  return false;
	  }
	  if(cpass==""){
		  alert("the confirm password cannot be empty");
		  return false;
	  }
	  else if(pass!=cpass){
		  alert("The passwords donot match");
		  return false;
	  }
	  else if(pass==cpass){
		  return true;
	  }
  }
  </script>
		
				
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

-->































<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
<link rel="stylesheet" href="style2.css">
<link href="//db.onlinewebfonts.com/c/a4e256ed67403c6ad5d43937ed48a77b?family=Core+Sans+N+W01+35+Light" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="form.css" type="text/css">
<link rel="stylesheet" href="register.css">
</head>
<body>
<div class="body-content">

<form class="form" action="reg" method="post" autocomplete="off">
      <div class="alert alert-error"></div>
      First Name: <input type="text" placeholder="First Name" name="register_FN" required />
      last Name: <input type="text" placeholder="Last Name" name="register_LN" required />
      Date Of Birth: 
      <input type="date" name="register_DOB" required /><br><br>
      CNIC: <input type="text" pattern="^[0-9]{5}-[0-9]{7}-[0-9]{1}" placeholder="e.g 42101-8889567-3" name="register_cnic" required /><br>
      Mobile Number:
      <input type="tel" id="mobile_num" name="register_mobile_num" pattern="[0-9]{4}-[0-9]{7}"><br><br>
      Address: <input type="text" placeholder="Address" name="register_address" required />
      
      City: 
      <input list="city" name="register_city" class="datalist-input" />
    <datalist id="city">
        <option value="Karachi" />
        <option value="Lahore" />
        <option value="islamabad" />
        <option value="Peshawar" />
        <option value="Quetta" />
    </datalist><br><br>
      
      Username: <input type="text" placeholder="User Name" name="register_username" required />
      email: <input type="email" placeholder="Email" name="register_email" required />
      Password: <input type="password" placeholder="Password" name="register_password" autocomplete="new-password" onkeyup='check();'  required />
      Confirm-Password: <input type="password" placeholder="Confirm Password" name="register_confirmpassword" autocomplete="new-password" onkeyup='check();'required />
      Starting amount: <input type="text" placeholder="000000" name="register_amount" required />
      <span id='message'></span>
      <input type="submit" value="Register" name="register" class="btn btn-block btn-primary" />
    </form>
  </div>
  <script>
  document.querySelector('.registering').onclick=function(){
	  var pass=document.querySelector('register_password').value,
	      cpass=document.querySelector('register_confirmpassword').value;
	  if(pass==""){
		  alert("the password cannot be empty")
		  return false;
	  }
	  if(cpass==""){
		  alert("the confirm password cannot be empty");
		  return false;
	  }
	  else if(pass!=cpass){
		  alert("The passwords donot match");
		  return false;
	  }
	  else if(pass==cpass){
		  return true;
	  }
  }
  </script>

</div>
</body>
</html>




















