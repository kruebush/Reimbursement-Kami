package com.training.controlls;

import java.io.IOException;
import org.apache.log4j.Logger;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;


import com.training.dao.UserDAO;
import com.training.dao.UserDAOImpl;
import com.trianing.model.User;

/**
 * Servlet implementation class UpdatedInfo
 */
public class UpdatedInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatedInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private static Logger logger = Logger.getLogger(UserDAOImpl.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userId = Integer.parseInt( request.getParameter("userId"));
		String full_name = request.getParameter("fullname");
		String username = request.getParameter("username");		
		String password = request.getParameter("password");	
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String dob = request.getParameter("dob");
		String qual = request.getParameter("qualification");
		//String userId = request.getParameter("userId");
		
	
		
		User user = new User (userId, full_name, username, password, gender, email, phonenumber, dob, qual );
		UserDAO userDAO= new UserDAOImpl();
		userDAO.editInfo(user);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html");
		out.println("<html><link type=\"text/css\" rel=\"stylesheet\" href=\"stylef.css\"><body>");
		logger.info( username + "edited their Info");
		out.println("<h1>"+username+" you have succesfully updated your information.");
		out.println("<h1> <a href = loginpage.html ><font color=#00BFF>Return to Login</a>");
		out.println("</body></html>");
		
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
