<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet"

	import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,
			javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpSession"
    
 %>
 
 <% 
	session=request.getSession(false);
	Integer userid= (Integer) session.getAttribute("userid");
	String empid=(String)session.getAttribute("eid");
	 if(userid!=null)
	 {
	 
	 
	 try 
	 {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
		PreparedStatement preparedstatement=connection.prepareStatement("select * from employee_details where Emp_ID=?");
		preparedstatement.setString(1,empid);
		ResultSet rs=preparedstatement.executeQuery();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update Employee</title>

<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 -->
 
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 
<script >
function validate()
{
	var email_regex=/^[a-zA-Z0-9_\.\]\+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; 
	var email=document.getElementById("empemail").value;	
	
	var name_regex=/^[a-zA-Z ]{2,30}$/;
	var ename=document.getElementById("empname").value;	
	var cname=document.getElementById("cname").value;
	
	var age_regex=/^(100)|[1-9]\d?$/;
	var age=document.getElementById("age").value;
	
	var number_regex=/^[0-9]\d*$/;
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
	if(age<18 || age>80)
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

.container{
	border-radius: 5px;
    background-color:  #d5d8dc ;
  	width: 450px;
	margin-top: 100px;
}

.navbar-toggle {
	padding: 10px 10px;
	margin-top: 19px;
}

	.navbar-inverse .navbar-nav > li > a {
    color: #eaeff3;
}

.navbar-inverse .navbar-toggle {
    border-color: #eaeff3;
}

.navbar-inverse  .navbar-toggle:hover {
    background-color: #d9edf7;
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

<% 
	while(rs.next())
	{

%>

<body>
	<nav class="navbar  navbar-fixed-top navbar-inverse">
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
       				<li><a class="nav_a" href="Employee_Registration">Employee Registration</a></li>
      			</ul>
     			 <ul class="nav navbar-nav navbar-right">
       
       				 <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      			</ul>
   			  </div> 
  		</div>
	</nav>
		<!-- <ul class='header_ul'>
  			<li class='header_li'><h2>Employee Forum</h2></li>
  			<li class='header_li'><a href="EmployeeDetails">Employee Details</a></li>
  			<li class='header_li' style="float: right;"><a href="Logout">Logout</a></li>
  		
  		
  		</ul>
 -->	
 	<div class="container">
		<form action="Update_Emp" class="form2" method="post" onsubmit="return validate()">
		<div>
			<table>
				<tr>
					<center><h2>Update Employee</h2></center>
				</tr>
				<tr>
					<th>Employee Name</th>
					<td><input type="text" id="empname" name="empname" value="<%=rs.getString(1)%>" required></td>
				</tr>
				<tr>
					<th>Employee Email</th>
					<td><input type="text" id="empemail" name="empemail" value="<%=rs.getString(2)%>" required></td>
				</tr>
		
				<tr>
					<th>Address</th>
					<td><textarea rows="3" cols="34" name="address" required><%=rs.getString(3)%></textarea></td>
				</tr>
				<tr>
					<th>Company Name</th>
					<td><input type="text" id="cname" name="companyname" value="<%=rs.getString(4)%>" required></td>
				</tr>
				<tr>
					<th>Age</th>
					<td><input type="text" id="age" name="age" value="<%=rs.getInt(5)%>" required></td>
				</tr>
				<tr>
					<th>Salary</th>
					<td><input type="text" id="salary" name="salary" value="<%=rs.getInt(9)%>" required></td>
				</tr>
				<tr>
						<th>Gender</th>
				<%if(rs.getString(6).equals("male"))
					{ %>
						<td><input type="radio" name="gender" value="male" checked="checked">Male &nbsp &nbsp
							<input type="radio" name="gender" value="female">Female</td>
				<% }
					else
					{ %>
						<td><input type="radio" name="gender" value="male" >Male &nbsp &nbsp
							<input type="radio" name="gender" value="female" checked="checked">Female</td>
				<%  }%>
			
				</tr> 
				<tr>
					<th>Specialized</th>
					<td><input type="text" id="special" name="specialized" value="<%=rs.getString(7)%>" required></td>
				</tr>
				<tr>
					<th>Language Known</th>
					<td><input type="text" id="language" name="language" value="<%=rs.getString(8)%>" required></td> 
				</tr>	
		
				<tr>
					<td></td>
					<td><input type="submit" value="Update" class="btn btn-success">
						<button formaction="EmployeeDetails" class="btn btn-danger">Cancel</button></td>
			
				</tr>
	
		</table>
		</div>
	</form>
</div>	
<%
	}	
%>
</body>
</html>

<%
			connection.close();
	
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 else
	 {
		 response.sendRedirect("Login");
	 }
 %>