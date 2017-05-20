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

	<link rel="stylesheet" href="style.css" type="text/css">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/redmond/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
			crossorigin="anonymous">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
			crossorigin="anonymous"></script> -->
	
	
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
			/* 
			var divtag="<div><table>"
						"<tr><td>Employee ID</td></tr></table></div>";
			
			$(divtag).dialog({modal: true, height: 300, width: 1005 }); */
			$("<div style='text-align:center' title='Employee Details'><form><table class='table1' border='2 solid black'><tr class='row1'><td>Employee ID</td><td>Employee Name</td><td>Employee Email</td><td>Address</td><td>Company Name</td><td>Age</td><td>Gender</td><td>Specialized</td><td>languages</td><td>Salary</td></tr><tr class='row2'><td>"+eid+"</td><td>"+enm+"</td><td>"+email+"</td><td>"+add+"</td><td>"+cnm+"</td><td>"+age+"</td><td>"+gender+"</td><td>"+special+"</td><td>"+lang+"</td><td>"+sal+"</td></tr></table><br><button name='eid' value='"+eid+"' formaction='Employee_Update' formmethod='post' class='btn btn-primary'>Update</button><button name='eid' value='"+eid+"' formaction='Emp_Delete' formmethod='post' class='btn btn-danger'>Delete</button></form></div>")
				.dialog({modal: true, height: 300, width: 1050 }); 
		})
	}); 
	
	</script> 
	<title>Employee Details</title>
	</head>
	<body>
			<ul class="header_ul">
			<li class="header_li"><h2 style="text-align: center;">Employee Forum</h2></li>
			<li class="header_li" style="float: right"><a href="Logout">Logout</a></li>
			<li class="header_li" style="float: right"><a href="HomePage">Homepage</a></li>
			</ul>
			
			<ul class="ul2"><li class="li1">Employee Names</li>
			<% 
				while(rs.next())
				{
					//eid1=rs.getInt(11);
					String enm=rs.getString(1);
			%>
					<li class="li2" id=<%=rs.getInt(11)%> empname='<%=enm%>' empemail=<%=rs.getString(2)%> address='<%=rs.getString(3)%>'
					cname='<%=rs.getString(4)%>' age=<%=rs.getInt(5)%> gender=<%=rs.getString(6)%> special='<%=rs.getString(7)%>'
					lang='<%=rs.getString(8)%>' sal=<%=rs.getString(9)%>><a><%=rs.getString(1)%></a></li>
			<% 			
				}
			%>
			
			</ul>
	<%
			connection.close();
	
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 %>
	 
	</body>
	</html>
	<%
		}
		 else
		 {
			 response.sendRedirect("Login");
		 }
	%>