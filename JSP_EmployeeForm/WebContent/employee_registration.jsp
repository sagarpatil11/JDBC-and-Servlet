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
	form {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px 30px;
   margin-left: 350px;
   margin-top: 100px;
   margin-right: 400px;
}

</style>




</head>
<body>

	<form action="EmployeeRegistration" method="post" onsubmit="return validate()">
	<table>
		<tr>
			<h2>Employee Registration</h2>
		</tr>
		<tr>
			<td>Employee Name</td>
			<td><input type="text" id="empname" name="empname" required></td>
		</tr>
		<tr>
			<td>Employee Email</td>
			<td><input type="text" id="empemail" name="empemail" required></td>
		</tr>
		
		<tr>
			<td>Address</td>
			<td><textarea rows="3" cols="33" name="address" required></textarea></td>
		</tr>
		<tr>
			<td>Company Name</td>
			<td><input type="text" id="cname" name="companyname" required></td>
		</tr>
		<tr>
			<td>Age</td>
			<td><input type="text" id="age" name="age" required></td>
		</tr>
		<tr>
			<td>Salary</td>
			<td><input type="text" id="salary" name="salary" required></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td><input type="radio" name="gender" value="male" checked="checked">Male
			<input type="radio" name="gender" value="female">Female</td>
		</tr> 
		<tr>
			<td>Specialized</td>
			<td><input type="checkbox" name="specialized" value="Java" >Java
			<input type="checkbox" name="specialized" value=".net" >.Net
			<input type="checkbox" name="specialized" value="angular">Angular
			<input type="checkbox" name="specialized" value="android">Android</td>
		</tr>
		<tr>
			<td>Language Known</td>
			<td><input type="checkbox" name="language" value="English">English
			<input type="checkbox" name="language" value="marathi">Marathi
			<input type="checkbox" name="language" value="hindi">Hindi</td>
		</tr>	
		
		<tr>
			<td><input type="submit" value="Register"></td>
			<td><input type="reset" value="reset"></td>
		</tr>
		
	</table>
	</form>
	

</body>
</html>