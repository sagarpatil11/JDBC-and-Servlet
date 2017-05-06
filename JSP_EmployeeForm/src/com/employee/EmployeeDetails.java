package com.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter printwriter=response.getWriter();
		

		 HttpSession session=request.getSession(false);  
		 int userid= (int) session.getAttribute("userid");
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
			PreparedStatement preparedstatement=connection.prepareStatement("select * from employee_details where User_ID=?");
			preparedstatement.setInt(1, userid);
			ResultSet rs=preparedstatement.executeQuery();
			printwriter.println("<html><body>");
			printwriter.println("<table border=1><tr>");
			printwriter.println("<td>Employee name</td><td>Employee email</td><td>Address</td><td>Company name</td>");
			printwriter.println("<td>Age</td><td>Gender</td><td>Specialized</td><td>Languages</td><td>Salary</td></tr>");
			while(rs.next())
			{
				printwriter.println("<br><tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td>");
				printwriter.println("<td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td>");
				printwriter.println("<td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td></tr>");
			}
			
			printwriter.println("<br><br><a href='HomePage'>HomePage</a>");
			
			
			printwriter.println("</table></body></html>");
			
			
			
			printwriter.close();
			connection.close();
			
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
