package com.training.controlls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.rewrite.RewriteAppender;

import com.training.dao.UserDAO;
import com.training.dao.UserDAOImpl;

/**
 * Servlet implementation class ValidateIdPwd
 */
public class ValidateIdPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateIdPwd() {
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
		
		String euname = request.getParameter("lookname");		
		String epwd = request.getParameter("lookpwd");
		int euserId = Integer.parseInt(request.getParameter("lookid"));
		
		/*
		HttpSession session = request.getSession();
		session.setAttribute("lookname",euname);
		
		HttpSession session1 = request.getSession();
		session1.setAttribute("lookpwd",epwd);
		*/
		
		HttpSession session2 = request.getSession();
		session2.setAttribute("lookid",euserId);
		
		UserDAO userDAO = new UserDAOImpl();
		
		//boolean result = userDAO.validateC(euname, epwd);
		boolean result = userDAO.validateEById(euserId, euname, epwd);
		
		if (result) {
			out.println("<h1>Edit Information");
			RequestDispatcher dispatcher = request.getRequestDispatcher("editinfowdata.jsp");
			dispatcher.forward(request, response);
		}
		else {
			out.println("<h1>Your username/password is incorrect, Please try agian");
			RequestDispatcher dispatcher = request.getRequestDispatcher("editInfoByIdPwd.jsp");
			dispatcher.forward(request, response);
			
		}			
		out.println("</body></html>");
		out.println("</body></html>");

	
	}

}
