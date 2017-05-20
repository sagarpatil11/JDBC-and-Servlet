package com.employee;

import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmployeeDetails
 */
@WebServlet("/EmployeeDetails")
public class EmployeeDetails extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		//PrintWriter printwriter=response.getWriter();
		

		 HttpSession session=request.getSession(false);  
		 Integer userid= (Integer) session.getAttribute("userid");
		 
		 if(userid!=null)
		 {
			 	
			// response.sendRedirect("Employee_details.jsp");
			 request.getRequestDispatcher("Employee_details.jsp").forward(request, response);
		 
		/* try 
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
			PreparedStatement preparedstatement=connection.prepareStatement("select * from employee_details where User_ID=?");
			preparedstatement.setInt(1, userid);
			ResultSet rs=preparedstatement.executeQuery();
			printwriter.println("<html>");
			printwriter.println("<head>");
			printwriter.println("<link rel='stylesheet' href='style.css' type='text/css'>");
			printwriter.println("<link href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/redmond/jquery-ui.css' rel='stylesheet' type='text/css'/>");
			printwriter.println("<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js'></script>");
			printwriter.println("<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js'></script>");
			
			printwriter.println("<script type='text/javascript'>$(document).ready(function () {");
			
            printwriter.println("$('.li2').click(function () {");
            printwriter.println("var myid = $(this).attr('id') ");
            printwriter.println("console.log(myid,' Helloo')");
         //   printwriter.println("myfuction(myid)");
			printwriter.println("$('<p>hello</p>').dialog({modal: true, height: 590, width: 1005 });");
            printwriter.println(";});});");
          //  printwriter.println(" function myfunction(var eid){ var divlog=<div>"+eid+"</div>");
           // printwriter.println("");
          //  printwriter.println("$('<p>hello</p>').dialog({modal: true, height: 590, width: 1005 });");
            printwriter.println("  </script>");
        
   
			printwriter.println("</head>");
			
			printwriter.println("<body><ul class='header_ul'><li class='header_li'><h2 style='text-align: center;'>Employee Forum</h2></li>");
			printwriter.println("<li class='header_li' style='float: right'><a href='Logout'>Logout</a></li>");
			printwriter.println("<li class='header_li' style='float: right'><a href='HomePage'>Homepage</a></li></ul>");
			
			printwriter.println("<ul class='ul2'><li class='li1'>Employee Names</li>");
			
			while(rs.next())
			{
				int eid=(int)rs.getInt(11);
				printwriter.println("<li class='li2' id="+eid+"><a>"+rs.getString(1)+"</a></li>");
				
			}
			
			
			printwriter.println("</ul>");
		//	printwriter.println("<div id='dialog' title='Employee Details'></div>");
			printwriter.println("</body></html>");
			
			
			
			printwriter.close();
			connection.close();
			
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}*/
		 }
		 else
		 {
			 response.sendRedirect("Login"); 
		 }
		
	}

}
