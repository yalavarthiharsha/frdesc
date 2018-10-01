package org.frdsec.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		if(userName.toString().equals("franalyst"))
		{
			if(pwd.toString().equals("password"))
			{
				response.sendRedirect("home.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp?login=fail1");
			}
		}
		else if(userName.toString().equals("admin"))
		{
			if(pwd.toString().equals("password"))
			{
				response.sendRedirect("chart.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp?login=fail1");
			}
		}
		else
		{
			response.sendRedirect("index.jsp?login=fail2");
		}
	}

}
