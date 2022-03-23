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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<% 
	UserDAO userDAO = new UserDAOImpl();
	List<User> users = userDAO.getUsers();
	Iterator<User> iterator = users.iterator();

%>

	<h1>All Employees </h1>
	<table class="table" border="2" cellspacing="10" cellpadding=10">



	<tr>
		<th> User Id: </th>
		<th> Name : </th>
		<th> User Name: </th>
		<th> Password:</th>
		<th> Gender</th>
		<th> Email:</th>
		<th> Phone Number: </th>
		<th> D.O.B:</th>
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
	
	
	
	
	
	
	
	
	
	
	<a href="managerhome.jsp"><font color="#00BFFF" >Back</font></a>
</body>
</html>