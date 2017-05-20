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
 * Servlet implementation class EmployeeRegistration
 */
@WebServlet("/EmployeeRegistration")
public class EmployeeRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter printwriter=response.getWriter();
		
		HttpSession session=request.getSession(false);  
		Integer userid= (Integer) session.getAttribute("userid");
		
		if(userid!=null)
		{
		String empname=request.getParameter("empname");
		String empemail=request.getParameter("empemail");
		String address=request.getParameter("address");
		String companyname=request.getParameter("companyname");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String[] special=request.getParameterValues("specialized");
		String[] lang=request.getParameterValues("language");
		String salary=request.getParameter("salary");
		String specialized="";
		 for(int i=0;i<special.length;i++)
		 {
	            specialized+=special[i]+" ";
	     }
		 String languages="";
		 for(int i=0;i<lang.length;i++)
		 {
	            languages+=lang[i]+" ";
	     }
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
			System.out.println("connected1");
			PreparedStatement preparedstatement=connection.prepareStatement("insert into employee_details values(?,?,?,?,?,?,?,?,?,?)");
			preparedstatement.setString(1,empname);
			preparedstatement.setString(2,empemail);
			preparedstatement.setString(3,address);
			preparedstatement.setString(4,companyname);
			preparedstatement.setString(5,age);
			preparedstatement.setString(6,gender);
			preparedstatement.setString(7,specialized);
			preparedstatement.setString(8,languages);
			preparedstatement.setString(9,salary);
			preparedstatement.setInt(10, userid);
			
			int rs=preparedstatement.executeUpdate();
			if(rs==1)
			{
				printwriter.println("Record Inserted Successfully");
				
			}
			else
			{
				printwriter.println("Record Not Inserted");
			}
			printwriter.println("<html><body>");
			printwriter.println("<br><br><a href='HomePage'>HomePage</a>");
			
			printwriter.println("</body></html>");
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
