package com.training.controlls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.dao.UserDAO;
import com.training.dao.UserDAOImpl;

/**
 * Servlet implementation class ManLogInControlls
 */
public class ManLogInControlls extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManLogInControlls() {
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
		
		String unamem = request.getParameter("username");		
		String pwdm = request.getParameter("password");	
		
		HttpSession session = request.getSession();
		session.setAttribute("usernamem", unamem);
		
		HttpSession session1 = request.getSession();
		session.setAttribute("passwordm", pwdm);
		
		
		UserDAO userDAO = new UserDAOImpl();
		
		boolean result = userDAO.validateM(unamem, pwdm);
		
		if (result) {
			out.println("<h1>Welcome: "+ unamem);
			logger.info( unamem + "signed in");
			RequestDispatcher dispatcher = request.getRequestDispatcher("managerhome.jsp");
			dispatcher.forward(request, response);
		}
		else {
			out.println("<h1>Your username/password is incorrect, Please try agian");
			logger.info(unamem + " Your username/password is incorrect");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginpagem.html");
			dispatcher.forward(request, response);
		}
		
			
		out.println("</body></html>");
	}
	

}
