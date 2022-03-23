<%@page import="com.trianing.model.User"%>
<%@page import="com.training.dao.UserDAOImpl"%>
<%@page import="com.training.dao.UserDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.trianing.model.RForm"%>
<%@page import="java.util.List"%>
<%@page import="com.training.dao.RFormDAO"%>
<%@page import="com.training.dao.RFormDAOImpl"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">
</head>
<body>
<%
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	%>
<% 
	UserDAO userDAO = new UserDAOImpl();
	List<User> users = userDAO.viewAllUserInfo(username, password);
	Iterator<User> iterator = users.iterator();

%>

	<h1>All Employees </h1>
	<table class="table" border="2" cellspacing="10" cellpadding=10">



	<tr>
		<th> UserId: </th>
		<th> Name: </th>
		<th> UserName: </th>
		<th> Password:</th>
		<th> Gender</th>
		<th> Email:</th>
		<th> PhoneNumber: </th>
		<th> D.O.B:       </th>
		<th> Qualification:</th>
	</tr>
	
<% while (iterator.hasNext()){
	User user = iterator.next();
%>
	
	<tr>	
		<td><%=user.getUserId() %></td>
		<td><%=user.getFull_name() %></td>
		<td><%=user.getUsername() %></td>
		<td><%=user.getPassword() %></td>
		<td><%=user.getGender() %></td>
		<td><%=user.getEmail() %></td>
		<td><%=user.getPhonenumber() %></td>
		<td><%=user.getDob()%></td>
		<td><%=user.getQualification() %></td>
		</tr>
	<%} %>
	</table>
	

	
	<a href="employeehome.jsp"><font color="#00BFFF" >Back</font></a>
</body>
</html>