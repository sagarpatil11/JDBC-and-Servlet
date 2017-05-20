package com.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/UserHome")
public class UserHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printwriter=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee_DB","root","root");
			System.out.println("Connected");
			PreparedStatement preparedstatement=connection.prepareStatement("select *from user_details where email=? and password=?");
			preparedstatement.setString(1,email);
			preparedstatement.setString(2,password);
			ResultSet rs=preparedstatement.executeQuery();
			HttpSession session=request.getSession();
			if(rs.next())
			{
				int uid=rs.getInt(4);
				String uname=rs.getString(1);
				
				session.setAttribute("username", uname);
				session.setAttribute("userid", uid);
				
				response.sendRedirect("HomePage");
				
			}
			else
			{
				printwriter.println("Login Unsuccessfull");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
				rd.include(request, response); 
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
