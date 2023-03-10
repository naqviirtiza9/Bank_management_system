<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="style2.css">
<link href="//db.onlinewebfonts.com/c/a4e256ed67403c6ad5d43937ed48a77b?family=Core+Sans+N+W01+35+Light" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="form.css" type="text/css">
<link rel="stylesheet" href="register.css">
</head>
<body>
<div class="body-content">
  <div class="module">
    <h1>Apply for a Job</h1>
    <form class="form" action="jobApply" method="post" autocomplete="off">
      <div class="alert alert-error"></div>
      First Name: <input type="text" placeholder="First Name" name="job_FN" required />
      last Name: <input type="text" placeholder="Last Name" name="job_LN" required />
      Date Of Birth: 
      <input type="date" name="job_DOB" required /><br><br>
      CNIC: <input type="text" pattern="^[0-9]{5}-[0-9]{7}-[0-9]{1}" placeholder="e.g 42101-8889567-3" name="job_cnic" required /><br>
      Mobile Number:
      <input type="tel" id="mobile_num" name="job_mobile_num" pattern="[0-9]{4}-[0-9]{7}"><br><br>
      Address: <input type="text" placeholder="Address" name="job_address" required />
      
      City: 
      <input list="city" name="job_city" class="datalist-input" />
    <datalist id="city">
        <option value="Karachi" />
        <option value="Lahore" />
        <option value="islamabad" />
        <option value="Peshawar" />
        <option value="Quetta" />
    </datalist><br><br>
      
      Username: <input type="text" placeholder="User Name" name="job_username" required />
      email: <input type="email" placeholder="Email" name="job_email" required />
      Password: <input type="password" placeholder="Password" name="job_password" autocomplete="new-password" onkeyup='check();'  required />
      Confirm-Password: <input type="password" placeholder="Confirm Password" name="job_confirmpassword" autocomplete="new-password" onkeyup='check();'required />
      <span id='message'></span>
      <input type="submit" value="Apply" name="Apply" class="btn btn-block btn-primary" />
    </form>
  </div>
  <script>
  document.querySelector('.Apply').onclick=function(){
	  var pass=document.querySelector('job_password').value,
	      cpass=document.querySelector('job_confirmpassword').value;
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