package com.training.controlls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.training.dao.UserDAO;
import com.training.dao.UserDAOImpl;
import com.trianing.model.User;

/**
 * Servlet implementation class SigningUpControlls
 */
public class SigningUpControlls extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigningUpControlls() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String full_name = request.getParameter("fullname");
		String username = request.getParameter("username");		
		String password = request.getParameter("password");	
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String dob = request.getParameter("dob");
		String qual = request.getParameter("qualification");
		
		
		User user = new User (-1, full_name,  username, password, gender, email, phonenumber, dob, qual );
		
		UserDAO userDAO= new UserDAOImpl();
		boolean result = userDAO.register(user);
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html");
		out.println("<html><link type=\"text/css\" rel=\"stylesheet\" href=\"stylef.css\"><body>");
		
		if (result) {
		out.println("<h1><font color=#00BFFF>Username: "+ username);
		out.println("<h4><font color=#00BFFF>You have succesfully registered your password is:  " + password);
		out.println("<h3> <a href = loginpage.html><font color=#00BFFF>Login</a>");
		out.println("<h3> <a href = index.jsp><font color=#00BFFF>Logout</a>");
		
	}else {
		out.println("<h1><font color=#00BFF>Sorry username is already in use please try agian!");
		out.println("<h3> <a href = signup.html><font color=#00BFFF>Return Home</a>");
	}
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
