<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User Login</title>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
    background-color:  #d5d8dc ;
    padding: 20px;
    margin:130px 400px 100px 400px
}

.container{
	border-radius: 5px;
    background-color:  #d5d8dc ;
  	width: 310px;
	margin-top: 100px;
}
.form-group{
	padding: 5px;
}
#reg_link{
	text-align:center;
	padding-bottom: 10px;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:  #2e94c3 ;
	position:fixed;
    top:0;
    width:100%;
}

li {
    float: left;
    color:white
}

body{
	background-color:   #cdecfb  ;
}

</style>

</head>
<body>
	<ul >
  		<li><h2 style="text-align: center;">Employee Forum</h2></li>
  		
  	</ul>
<div class="container">
	
		
				
  					<h2 style="text-align: center;">Login</h2>
  						<form class="form-horizontal" action="UserHome" method="post" onsubmit="return validate()">
    				
    						<div class="form-group">
      							<input type="text" class="form-control" id="email" placeholder="Enter email" name="email" required>
    						</div>
    				
    						<div class="form-group">
      							<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password"  required>
    						</div>
   							
   							<div class="form-group">
 		   						<button type="submit" class="btn btn-primary btn-block">Login</button><br>
    						</div>
    						<div class="form group" id="reg_link">
    							New User?<a href="User_Reg"> Register</a>
							</div>  						
  						</form>
  				
  			
	
</div>
	
</body>
</html>