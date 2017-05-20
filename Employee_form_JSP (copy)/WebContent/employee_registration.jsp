<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Integer userid=(Integer)session.getAttribute("userid"); 
	if(userid!=null)
	{
		
%>
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

<script >
function validate()
{
	var email_regex=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; 
	var email=document.getElementById("empemail").value;	
	
	var name_regex=/^[a-zA-Z ]{2,30}$/;
	var ename=document.getElementById("empname").value;	
	var cname=document.getElementById("cname").value;
	
	var number_regex=/^[0-9]\d*$/;
	var age=document.getElementById("age").value;
	var salary=document.getElementById("salary").value;
	
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
	if(!salary.match(number_regex))
	{
		alert("Please enter valid Salary");
		return false;
	}
	return true;
}


</script>


<style type="text/css">

table{
		


}
th,td{
	padding: 10px;

}


	.form2 {
    border-radius: 5px;
    background-color: #d5d8dc;
    padding: 20px 30px;
   margin-left: 400px;
   margin-top: 50px;
   margin-right: 400px;
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
	<ul>
  		<li><h2>Employee Forum</h2></li>
  		<li style="float: right;"><a href="Logout">Logout</a></li>
  		<li style="float: right;"><a href="HomePage">Homepage</a></li>
  		
  	</ul>
	
	<form action="EmployeeRegistration" class="form2" method="post" onsubmit="return validate()">
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
			<th>Specialized</th>
			<td><input type="checkbox" name="specialized" value="Java" >Java &nbsp &nbsp
			<input type="checkbox" name="specialized" value=".net" >.Net &nbsp &nbsp
			<input type="checkbox" name="specialized" value="angular">Angular &nbsp &nbsp
			<input type="checkbox" name="specialized" value="android">Android</td>
		</tr>
		<tr>
			<th>Language Known</th>
			<td><input type="checkbox" name="language" value="English">English &nbsp &nbsp
			<input type="checkbox" name="language" value="marathi">Marathi &nbsp &nbsp
			<input type="checkbox" name="language" value="hindi">Hindi</td> 
		</tr>	
		
		<tr>
			<td><input type="submit" value="Register" class="btn btn-success"></td>
			<td><input type="reset" value="reset" class="btn btn-primary"></td>
		</tr>
		
	</table>
	</form>
	
		

</body>
</html>
<%
	}
	else
	{
		response.sendRedirect("Login");
	}
%>
