
<%@page import="java.util.Iterator"%>
<%@page import="com.trianing.model.RForm"%>
<%@page import="java.util.List"%>
<%@page import="com.training.dao.RFormDAOImpl"%>
<%@page import="com.training.dao.RFormDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">
</head>

<%
String userId = request.getParameter("approve");
String password = (String) session.getAttribute("password");
%>

<body>

	<%
	RFormDAO rformDAO = new RFormDAOImpl();
	rformDAO.approving(userId);
	rformDAO.deleteAfterAproval(userId);
	
	if (!rformDAO.deleteAfterAproval(userId)) {

	RequestDispatcher dispatcher = request.getRequestDispatcher("displayAllPendForms.jsp");
			dispatcher.forward(request, response);
	
	}		%>
	

	<a href="managerhome.jsp"><font color= "#00BFF" >Back</font></a>
	<a href="index.jsp"><font color="#00BFF" >Logout</font></a>
</body>
</html>