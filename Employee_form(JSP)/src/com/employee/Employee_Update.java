package com.employee;

import java.io.IOException;
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
 * Servlet implementation class Employee_Update
 */
@WebServlet("/Employee_Update")
public class Employee_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doPost(request, response);
	}
*/
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("username");
		String eid=request.getParameter("eid");
		session.setAttribute("eid", eid);
		System.out.println(eid);
		
		request.getRequestDispatcher("update_employee.jsp").forward(request, response);
	}

}
