<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet"

import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpSession"
    %>
 
 <% 
	session=request.getSession(false);
	Integer userid= (Integer) session.getAttribute("userid");
	 if(userid!=null)
	 {
	 
	 
	 try 
	 {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
		PreparedStatement preparedstatement=connection.prepareStatement("select * from employee_details where User_ID=?");
		preparedstatement.setInt(1, userid);
		ResultSet rs=preparedstatement.executeQuery();
	//	int eid1=0;
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee Details</title>

<link rel="stylesheet" href="style.css" type="text/css">
	
	 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/redmond/jquery-ui.css" rel="stylesheet" type="text/css"/> 
	
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> -->
	
	 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
			crossorigin="anonymous">

	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
			crossorigin="anonymous"></script> 
 
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	<!-- /* emp_details(eid,ename,email,add,cname,age,gender,specialized,lang,sal)
	{
		/* var divtag="<div><table><tr><td>Employee ID</td></tr></table></div>"; */
		
		/* $("<div><table><tr><td>Employee ID</td></tr></table></div>").dialog({modal: true, height: 590, width: 1005 }); */
//	}  -->
	<script>
	 $(document).ready(function () 
	{
		$(".li2").click(function () 
		{
			/* 
			var eid = $(this).attr("id");
			
			var enm = $(this).attr("empname");
			var email = $(this).attr("empemail");
			var add = $(this).attr("address");
			var cnm = $(this).attr("cname");
			var age = $(this).attr("age");
			var gender = $(this).attr("gender");
			var special = $(this).attr("special");
			var lang = $(this).attr("lang");
			var sal = $(this).attr("sal");
			console.log(eid,enm);
			 
			var divtag="<div><table>"
						"<tr><td>Employee ID</td></tr></table></div>";
			
			$(divtag).dialog({modal: true, height: 300, width: 1005 }); 
			$("<div class='container' id='popup'><div class='row'><div class='col-lg-4 col-md-3 col-sm-2'></div><div class='col-lg-4 col-md-6 col-sm-8'><div title='Employee Details'><form><table class='table' ><tr class='row1'><td>Employee ID</td><td>Employee Name</td><td>Employee Email</td><td>Address</td><td>Company Name</td><td>Age</td><td>Gender</td><td>Specialized</td><td>languages</td><td>Salary</td></tr><tr class='row2'><td>"+eid+"</td><td>"+enm+"</td><td>"+email+"</td><td>"+add+"</td><td>"+cnm+"</td><td>"+age+"</td><td>"+gender+"</td><td>"+special+"</td><td>"+lang+"</td><td>"+sal+"</td></tr></table><br><div class='form-group'><button name='eid' value='"+eid+"' formaction='Employee_Update' formmethod='post' class='btn btn-primary'>Update</button><button name='eid' value='"+eid+"' formaction='Emp_Delete' formmethod='post' class='btn btn-danger'>Delete</button></div></form></div></div><div class='col-lg-4 col-md-3 col-sm-2'></div></div></div>")
				.dialog({modal: true, height: 300, width: 1050 });  */
			
				$("#eid").val($(this).attr("id"));
				$("#ename").val($(this).attr("empname"));
				$("#email").val($(this).attr("empemail"));
				$("#address").val($(this).attr("address"));
				$("#company").val($(this).attr("cname"));
				$("#age").val($(this).attr("age"));
				$("#gender").val($(this).attr("gender"));
				$("#specialized").val($(this).attr("special"));
				$("#language").val($(this).attr("lang"));
				$("#salary").val($(this).attr("sal"));
				
				 $("#myModal").modal();
		})
	}); 
	
	
	</script> 
	<style type="text/css">
	
	#popup{
		margin-top: 30px;
		text-align: center;
	
	}
	
	 .container{
		    width: 300px;
	 		 padding-right: 38px;
	 		 margin-top: 100px;
	    	padding-left: 0px;
	   	 	margin-right: auto;
	   		margin-left: auto; 
	   		border-radius: 5px;
    background-color:  #cdecfb ;
		}
	.navbar{
	background-color:  #2e94c3 ;
}
	.navbar-inverse .navbar-toggle {
    border-color: #eaeff3;
}
.navbar-inverse .navbar-toggle:hover {
    background-color: #d9edf7;
}
.navbar-toggle {
	padding: 10px 10px;
	margin-top: 19px;
}

	.navbar-inverse .navbar-nav > li > a {
    color: #eaeff3;
}
 	.a1{
 		color:black;
 	}
	h1{
	color:#eaeff3;
	}
	body{
		background-color:  #cdecfb ;
		margin-top: 130px;
	}
	</style>
	


</head>
<body>

	<nav class="navbar navbar-fixed-top navbar-inverse ">
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
       							<li><a class="nav_a" href="Employee_Registration">Employee Registration</a></li>
        						
      					</ul>
      					<ul class="nav navbar-nav navbar-right">
        					 
       					 	<li><a class="nav_a" href="Logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
     				 	</ul>
    				 </div>
  				</div>
			</nav>
			<!-- <ul class="header_ul">
			<li class="header_li"><h2>Employee Forum</h2></li>
			<li class="header_li"><a href="Employee_Registration">Employee Registration</a></li>
			<li class="header_li" style="float: right"><a href="Logout">Logout</a></li>
			
			</ul> -->
		<div class="container">	
			<ul><li class="li1"><h3>Employee Names</h3></li>
			<% 
				while(rs.next())
				{
					//eid1=rs.getInt(11);
					String enm=rs.getString(1);
			%>
					<li class="li2" id=<%=rs.getInt(11)%> empname='<%=enm%>' empemail=<%=rs.getString(2)%> address='<%=rs.getString(3)%>'
					cname='<%=rs.getString(4)%>' age=<%=rs.getInt(5)%> gender=<%=rs.getString(6)%> special='<%=rs.getString(7)%>'
					lang='<%=rs.getString(8)%>' sal=<%=rs.getString(9)%>><a class="a1"><%=rs.getString(1)%></a></li>
			<% 			
				}
			%>
			
			</ul>
		</div>	
	<%
			connection.close();
	
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 %>
	<div class="container">
		<div class="modal fade" id="myModal" role="dialog">
    		<div class="modal-dialog">
    
      	<!-- Modal content-->
   		   		<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
          				<h4 class="modal-title">Employee Details</h4>
        			</div>
        			<div class="modal-body">
          					<table>
          						<tr>
          							<th>Employeee Id</th>
          							<td><input type="text" id="eid" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Employee Name</th>
          							<td><input type="text" id="ename" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Employeee Email</th>
          							<td><input type="text" id="email" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Address</th>
          							<td><input type="text" id="address" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Company Name</th>
          							<td><input type="text" id="company" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Age</th>
          							<td><input type="text" id="age" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Salary</th>
          							<td><input type="text" id="salary" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Gender</th>
          							<td><input type="text" id="gender" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Speialization</th>
          							<td><input type="text" id="specialized" readonly="readonly"></td>
          						</tr>
          						<tr>
          							<th>Language</th>
          							<td><input type="text" id="language" readonly="readonly"></td>
          						</tr>
          					
          					</table>
        			</div>
        			<div class="modal-footer">
        				<form action="Employee_Update" method="post">
        					<input type="hidden" id="eid" readonly="readonly">
          					<button class="btn btn-default" data-dismiss="modal">Close</button>
          					<input type="submit" class='btn btn-primary' value="Update">
          				</form>	
       		 		</div>
      			</div>
      
    		</div>
  		</div>
  
	</div>
	
	
	 
</body>
</html>

<%
		}
		 else
		 {
			 response.sendRedirect("Login");
		 }
	%>
