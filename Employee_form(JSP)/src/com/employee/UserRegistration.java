package com.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		 PrintWriter printwriter=response.getWriter();
		 
		 String username=request.getParameter("name");
		 String email=request.getParameter("email");
		 String password=request.getParameter("password");
		 
		 
		 try 
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
			System.out.println("Connected");
			
		//	Statement statement=connection.
			
			
			PreparedStatement preparedstatement=connection.prepareStatement("insert into user_details(username,email,password) values(?,?,?)");
			preparedstatement.setString(1, username);
			preparedstatement.setString(2, email);
			preparedstatement.setString(3, password);
			int rs=preparedstatement.executeUpdate();
			System.out.println(rs);
			if(rs==1)
			{
				printwriter.println("User Successfully Registred");
				  
				//RequestDispatcher rd=request.getRequestDispatcher("Login");  
			//	rd.include(request, response);  
				response.sendRedirect("Login");
			}
			else if(rs==0)
			{
				/*printwriter.println("Registration Unsuccessfull");
				RequestDispatcher rd=request.getRequestDispatcher("user_registration.jsp");  
				rd.include(request, response); 
		*/
				response.sendRedirect("User_Reg");
			}
			connection.close();
		 } 
		 catch (Exception e) 
		 {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 

	
	
	}

}
