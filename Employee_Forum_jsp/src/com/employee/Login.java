package com.employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		HttpSession session=request.getSession();
		Integer uid=(Integer) session.getAttribute("userid");
		
		if(uid==null)
		{
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("Employee_Registration");
		}
		
	}

	
}
