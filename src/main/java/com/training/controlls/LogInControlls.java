package com.training.controlls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.el.util.Validation;
import org.apache.log4j.Logger;

import com.training.dao.UserDAO;
import com.training.dao.UserDAOImpl;

/**
 * Servlet implementation class LogInControlls
 */
public class LogInControlls extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInControlls() {
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
	private static Logger logger = Logger.getLogger(UserDAOImpl.class);
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html><body>");
		
		String uname = request.getParameter("username");		
		String pwd = request.getParameter("password");
		
		HttpSession session = request.getSession();
		session.setAttribute("username",uname);
		
		HttpSession session1 = request.getSession();
		session1.setAttribute("password",pwd);
		
		UserDAO userDAO = new UserDAOImpl();
		
		boolean result = userDAO.validateC(uname, pwd);
	
		
		if (result) {
			out.println("<h1>Employee Home Page");
			logger.info( uname + "signed in");
			RequestDispatcher dispatcher = request.getRequestDispatcher("employeehome.jsp");
			dispatcher.forward(request, response);
		}
		else {
			out.println("<h1>Your username/password is incorrect, Please try agian");
			logger.info(uname + " Your username/password is incorrect");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginpage.html");
			dispatcher.forward(request, response);
		}			
		out.println("</body></html>");

	}
}
