
<%@page import="com.training.dao.UserDAOImpl"%>
<%@page import="com.training.dao.UserDAO"%>
<%@page import="com.trianing.model.User"%>
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
String username = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password");
%>

<body>
	<%
	//UserDAO userDAO = new UserDAOImpl();
	//boolean result userDAO.validateE(userId);

	RFormDAO rformDAO = new RFormDAOImpl();
	List<RForm> rforms = rformDAO.getResolvedPFormByPassword(password);
	Iterator<RForm> iterator = rforms.iterator();
	%>
	<h1>
		<%=username%>
		Resolved Reimbursements
	</h1>
	<table class="table" border="2" cellspacing="10" cellpadding="10">

		<%
		while (iterator.hasNext()) {
			RForm rform = iterator.next();
		%>
		<tr>
			<th>User Id:</th>
			<th>Date:</th>
			<th>Description:</th>
			<th>Cost:</th>
		</tr>
		<tr>
			<td><%=rform.getUserId()%></td>
			<td><%=rform.getDate()%></td>

			<td><%=rform.getDescription()%></td>
			<td><%=rform.getCost()%></td>
		</tr>
		<%
		}
		%>


	</table>
	<a href="employeehome.jsp"><font color="#00BFFF" >Back</font></a>
	<a href="index.jsp"><font color="#00BFFF" >logout</font></a>
</body>
</html>