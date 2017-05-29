<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Registration</title>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script >
function validate()
{
	/* var email_regex=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;  */
	var email_regex=/^[a-zA-Z0-9_\.\]\+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; 
	var email=document.getElementById("empemail").value;	
	
	var name_regex=/^[a-zA-Z ]{2,30}$/;
	var ename=document.getElementById("empname").value;	
	var cname=document.getElementById("cname").value;
	
	var age_regex=/^(100)|[1-9]\d?$/;
	var age=document.getElementById("age").value;
	
	var number_regex=/^[0-9]\d*$/;
	var salary=document.getElementById("salary").value;
	
	var specialized[]=document.getElementById("specialized").value;
	
	if(!email.match(email_regex))
	{
		alert("Please enter valid Email");
		return false;
	}
	if(!ename.match(name_regex))
	{
		alert("Please enter valid Name");
		return false;
	}
	if(!cname.match(name_regex))
	{
		alert("Please enter valid company Name");
		return false;
	}
	if(!age.match(number_regex))
	{
		alert("Please enter valid Age");
		return false;
	}
	if(age<18 || age>80 )
	{
		alert("Please enter valid Age");
		return false;
	}
	if(!salary.match(number_regex))
	{
		alert("Please enter valid Salary");
		return false;
	}
	
	/* if(document.getElementById("specialized1").checked == false ||
			document.getElementById("specialized2").checked == false ||
			document.getElementById("specialized3").checked== false ||
			document.getElementById("specialized4").checked == false) */
	/* if(specialized==null)		
	{
		alert("Please choose your specialization");
		return false;
	}  */
	return true;
}


</script>


<style type="text/css">

.container{
	border-radius: 5px;
    background-color:  #d5d8dc ;
  	width: 450px;
	margin-top: 90px;
}
.navbar-toggle:hover {
    background-color: #a3e6ece6;
}
.navbar-toggle {
	padding: 10px 10px;
	margin-top: 19px;
}

	.navbar-inverse .navbar-nav > li > a {
    color: #eaeff3;
}
a{
	color:#eaeff3;
}
h1{
	color:#eaeff3;
}
th,td{
	padding: 10px;

}


	
input[type=text]{
	width: 300px;
	background-color: #FFFFFF
	
}
input[type=checkbox],input[type=radio]{
	padding-right: 10px;
}

 

</style>
<link rel='stylesheet' href='style.css' type='text/css'>

</head>
<body>

	<nav class="navbar navbar-fixed-top navbar-inverse">
	  	<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>                    
      			</button>
      			<h1>Employee Forum</h1>
    		</div>
   		 	<div class="collapse navbar-collapse" id="myNavbar">
      			<ul class="nav navbar-nav">
      				 <li><a href="EmployeeDetails">Employee Details</a></li>
     		 	</ul>
      			<ul class="nav navbar-nav navbar-right">
       
        			<li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
     			 </ul>
    		</div>
 		 </div>
	</nav>

	<!-- <nav class="navbar navbar-default">
  		<div class="container-fluid">
			<ul class='header_ul'>
  				<li class='header_li' id="li_h"><h2>Employee Forum</h2></li>
  				<li class='header_li'><a href="EmployeeDetails">Employee Details</a></li>
  				<li class='header_li' style="float: right;"><a href="Logout">Logout</a></li>
  		
  		
  			</ul>
  		</div>
  </nav> -->
	<div class="container">
		<form action="EmployeeRegistration" method="post" onsubmit="return validate())">
			<div class="table-responsive">
				<table>
					<tr>
						<center><h2>Employee Registration</h2></center>
					</tr>
					<tr>
						<th>Employee Name</th>
						<td><input type="text" id="empname" name="empname" required></td>
					</tr>
					<tr>
						<th>Employee Email</th>
						<td><input type="text" id="empemail" name="empemail" required></td>
					</tr>
		
					<tr>
						<th>Address</th>
						<td><textarea rows="3" cols="34" name="address" required></textarea></td>
					</tr>
					<tr>
						<th>Company Name</th>
						<td><input type="text" id="cname" name="companyname" required></td>
					</tr>
					<tr>
						<th>Age</th>
						<td><input type="text" id="age" name="age" required></td>
					</tr>
					<tr>
						<th>Salary</th>
						<td><input type="text" id="salary" name="salary" required></td>
					</tr>
					<tr>
						<th>Gender</th>
						<td><input type="radio" name="gender" value="male" checked="checked">Male &nbsp &nbsp
						<input type="radio" name="gender" value="female">Female</td>
					</tr> 
					<tr>
						<th>Specialization</th>
						<td><input type="checkbox" id="specialized" name="specialized" value="Java" checked="checked" >Java &nbsp &nbsp
							<input type="checkbox" id="specialized" name="specialized" value=".Net" >.Net &nbsp &nbsp
							<input type="checkbox" id="specialized" name="specialized" value="Angular">Angular &nbsp &nbsp
							<input type="checkbox" id="specialized" name="specialized" value="Android">Android</td>
					</tr>
					<tr>
						<th>Language Known</th>
						<td><input type="checkbox" name="language" value="English" checked="checked">English &nbsp &nbsp
						<input type="checkbox" name="language" value="Marathi">Marathi &nbsp &nbsp
						<input type="checkbox" name="language" value="Hindi">Hindi</td> 
					</tr>	
		
					<tr>
						<td></td>
						<td><input type="submit" value="Register" class="btn btn-success">
						<input type="reset" value="reset" class="btn btn-primary"></td>
					</tr>
		
				</table>
			</div>
		</form>
	
	</div>	
	
</body>
</html>