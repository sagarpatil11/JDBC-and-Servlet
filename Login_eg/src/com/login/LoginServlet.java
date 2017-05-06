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
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printwriter=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/LoginDetails", "root","root");
			System.out.println("Connected");
			PreparedStatement preparedstatement=connection.prepareStatement("select firstname from userdetails where username=? and password=?");
			preparedstatement.setString(1, username);
			preparedstatement.setString(2, password);
			ResultSet rs=preparedstatement.executeQuery();
			
			if(rs.next())
			{
				printwriter.println("Login Successful");
				printwriter.println("Welcome!"+rs.getString("firstname"));
			}
			else
			{
				printwriter.println("Login Unsuccessfull");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.html");
				requestDispatcher.include(request, response);
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
