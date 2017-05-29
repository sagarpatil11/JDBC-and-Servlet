package com.employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Emp_Delete
 */
@WebServlet("/Emp_Delete")
public class Emp_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.setContentType("text/html");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("username");
		String eid=request.getParameter("eid");
		session.setAttribute("eid", eid);
		System.out.println(eid);
		
		if(username!=null)
		 {
		 
		 
		 try 
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
			PreparedStatement preparedstatement=connection.prepareStatement("delete from employee_details where Emp_ID=?");
			preparedstatement.setString(1, eid);
			int rs=preparedstatement.executeUpdate();
			
			if(rs==1)
			{
				//request.getRequestDispatcher("EmployeeDetails").forward(request, response);
				response.sendRedirect("EmployeeDetails");
			}
			
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
	
	}

}
