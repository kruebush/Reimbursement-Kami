<%@page import="com.trianing.model.User"%>
<%@page import="com.training.dao.UserDAOImpl"%>
<%@page import="com.training.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href=" style1.css">
</head>

<%
	String euname = (String) session.getAttribute("lookname");
	String epwd = (String) session.getAttribute("lookpwd");
	String euserId = (String) session.getAttribute("lookid");
%>

<body>
<%
	//UserDAO userDAO = new UserDAOImpl();
	//boolean result userDAO.validateE(userId);
	
		UserDAO userDAO= new UserDAOImpl();
		User user = new User();
		boolean result = userDAO.editInfo(user);
		
		if (result){
%>
	<h1> <%= euname %>  you information was updated </h1>
	<%} else {%>
		<h1 align= "center">Sorry either your user name, password, or userId was incorrect.</h1>
		
	<%} %>
<h3><a href="employeehome.jsp">Employee Home</a></h3>
<h3><a href ="index.jsp">Logout</a></h3>
</body>
</html>