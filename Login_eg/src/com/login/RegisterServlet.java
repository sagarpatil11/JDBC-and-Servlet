package com.login;

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

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
	// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printwriter=response.getWriter();
		String username=request.getParameter("email");
		String password=request.getParameter("password");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String mobile=request.getParameter("mobile");
	
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/LoginDetails","root","root");
			System.out.println("Connected");
			PreparedStatement preparedstatement=connection.prepareStatement("insert into userdetails values(?,?,?,?,?)");
			preparedstatement.setString(1, username);
			preparedstatement.setString(2, password);
			preparedstatement.setString(3, firstname);
			preparedstatement.setString(4, lastname);
			preparedstatement.setString(5, mobile);
			int rs= preparedstatement.executeUpdate();
			
			if(rs==1)
			{
				printwriter.println("Registration Successfull");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.html");
				requestDispatcher.include(request, response);
			}
			else
			{
				printwriter.println("Registration Unsuccessfull");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Register.html");
				requestDispatcher.include(request, response);
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}
