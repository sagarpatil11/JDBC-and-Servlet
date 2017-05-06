package com.employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HomePage
 */
@WebServlet("/HomePage")
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printwriter=response.getWriter();
		
		HttpSession session=request.getSession(false);  
		String username= (String) session.getAttribute("username");
		
		printwriter.println("Hi!"+username);
		printwriter.println("<html><body>");
		printwriter.println("<br><br><a href='employee_registration.jsp'>Employee Registration</a>");
		printwriter.println("<br><br><a href='EmployeeDetails'>Employee Details</a>");
		printwriter.println("</body></html>");
		
	}

}
