package com.employee;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Update_Emp
 */
@WebServlet("/Update_Emp")
public class Update_Emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.setContentType("text/html");
		
		HttpSession session=request.getSession();
		String eid=(String)session.getAttribute("eid");
		
		
		if(eid!=null)
		{
			String empname=request.getParameter("empname");
			String empemail=request.getParameter("empemail");
			String address=request.getParameter("address");
			String companyname=request.getParameter("companyname");
			String age=request.getParameter("age");
			String gender=request.getParameter("gender");
			String special=request.getParameter("specialized");
			String lang=request.getParameter("language");
			String salary=request.getParameter("salary");
			
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				PrintWriter printwriter=response.getWriter();
				
				Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
				System.out.println("connected1");
				PreparedStatement preparedstatement=connection.prepareStatement("update employee_details set emp_name=?,email=?,address=?,comp_name=?,age=?,gender=?,salary=?,specialized=?,languages=? where Emp_ID=?");
				preparedstatement.setString(1,empname);
				preparedstatement.setString(2,empemail);
				preparedstatement.setString(3,address);
				preparedstatement.setString(4,companyname);
				preparedstatement.setString(5,age);
				preparedstatement.setString(6,gender);
				preparedstatement.setString(7,salary);
				preparedstatement.setString(8,special);
				preparedstatement.setString(9,lang);
				preparedstatement.setString(10,eid);
			
				int rs=preparedstatement.executeUpdate();
				if(rs==1)
				{
					response.sendRedirect("EmployeeDetails");
				}
				
			
				connection.close();
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				response.sendRedirect("Employee_Update");
				e.printStackTrace();
			}

		}
		else
		{
			response.sendRedirect("Login");
		}
	}

}
