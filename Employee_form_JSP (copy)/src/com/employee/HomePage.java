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
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
			doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printwriter=response.getWriter();
		
		HttpSession session=request.getSession(false);  
		String username= (String) session.getAttribute("username");
		
		
		printwriter.println("<html><head>");
		printwriter.println("<link rel='stylesheet' href='style.css' type='text/css'>");
		
		printwriter.println("</head>");
	
		printwriter.println("<body><ul><li style='float: right;'><a href='Logout'>Logout</a></li>");
		printwriter.println("<li><h2>Employee Forum</h2></li>");
		printwriter.println("<li style='padding:20px 0px 20px 10px; float:right;'>Hi! "+ username+"</li></ul>");
	
		printwriter.println("<br><br><br><br><br><a href='Employee_Registration'>Employee Registration</a>");
		printwriter.println("<br><br><a href='EmployeeDetails'>Employee Details</a>");
		//printwriter.println("<br><br><a href='Logout'>Logout</a>");
		printwriter.println("</body></html>");
		
	}

}
