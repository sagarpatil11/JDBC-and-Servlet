package com.employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Employee_Registration
 */
@WebServlet("/Employee_Registration")
public class Employee_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		Integer userid=(Integer)session.getAttribute("userid");
		if(userid!=null)
		{
			request.getRequestDispatcher("employee_registration.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("Login");
		}
	}

	

}
