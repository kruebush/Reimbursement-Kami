package com.training.controlls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.dao.RFormDAO;
import com.training.dao.RFormDAOImpl;
import com.training.dao.UserDAO;
import com.training.dao.UserDAOImpl;
import com.trianing.model.RForm;

/**
 * Servlet implementation class SubmitFormControlls
 */
public class SubmitFormControlls extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitFormControlls() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html");
		out.println("<html><link type=\"text/css\" rel=\"stylesheet\" href=\"stylef.css\"><body>");
		
	
		String userId= request.getParameter("userId");
		String password=request.getParameter("password");
		String date = request.getParameter("date");	
		String description = request.getParameter("description");
		String cost = request.getParameter("cost");
		
		
		
		RForm rform = new RForm (userId, password, date, description, cost);
		
		
		RFormDAO rformDAO= new RFormDAOImpl();
		boolean result = rformDAO.submitForm(rform);
		
		if (result) {
			out.println("<h1>You have succesfully submitted your request on the day of " + date + " for the amount "+ cost);
			out.println("<h3> <a href = employeehome.jsp><font color=#00BFFF>Return Home</a>");
			out.println("<h3> <a href = index.jsp><font color=#00BFFF>Logout</a>");
		}else {
			out.println("<h1><font color=#00BFF>Sorry username is already in use please try agian!");
			out.println("<h3> <a href = signupm.html>Return Home</a>");
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
