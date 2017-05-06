<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>User Login</title>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
crossorigin="anonymous"></script>

<script >
function validate()
{
	var email_regex=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; 
	var email=document.getElementById("email").value;	
	
	if(!email.match(email_regex))
	{
		alert("Please enter valid Email");
		return false;
	}
	return true;
}


</script>


<style type="text/css">
.form_bg {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    margin:100px 400px 200px 400px
}


</style>

</head>

<body>
	<div align="center">
	<div class="container">
	<div class="form_bg">
  <h2>Login</h2>
  <form action="UserHome" method="post" onsubmit="return validate()">
    <div class="form-group">
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email" style="width: 300px">
    </div>
    <div class="form-group">
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" style="width: 300px" required>
    </div>
    
    <button type="submit" class="btn btn-primary btn-block">Submit</button><br>
    New User?<a href="user_registration.jsp"> Register</a>
  </form>
  </div>
</div>
</div>
</body>
</html>