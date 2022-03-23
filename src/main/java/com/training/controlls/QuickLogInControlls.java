package com.training.controlls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.dao.UserDAO;
import com.training.dao.UserDAOImpl;

/**
 * Servlet implementation class QuickLogInControlls
 */
public class QuickLogInControlls extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuickLogInControlls() {
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
			RequestDispatcher dispatcher = request.getRequestDispatcher("reimbursementform2.jsp");
			dispatcher.forward(request, response);
		}
		else {
			out.println("<h1>Your username/password is incorrect, Please try agian");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginpage2reimpage.html");
			dispatcher.forward(request, response);
		}			
		out.println("</body></html>");

	}

}
