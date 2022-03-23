
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
String username = (String) session.getAttribute("usernamem");
String searcheid = request.getParameter("searcheid");
%>

<body>
	<%
	RFormDAO rformDAO = new RFormDAOImpl();
	List<RForm> rforms = rformDAO.getPendingFormByUserId(searcheid);
	List<RForm> rforms2 = rformDAO.getResolvedPFormByUserId(searcheid);
	Iterator<RForm> iterator = rforms.iterator();
	Iterator<RForm> iterator1 = rforms2.iterator();
	%>
	<h3><font color="#00BFFF">
		You are logged in as :
		<%=username%></font>
	</h3>
	<h1 align="center">All Reimbursements</h1>
	</br>
	</br>

	<h2><font color="#00BFFF">Pending Reimbursements</font></h2>
	
<table class="table" border="2" cellspacing="10" cellpadding="10">
		<tr>
			
			<th>User Id:</th>
			<th>Date:</th>
			<th>Description:</th>
			<th>Cost:</th>
			<th>Status:</th>
		</tr>
		</br>

		<% 
		while (iterator.hasNext()) {
			RForm rform = iterator.next();
		%>
	
		<tr>
			<td><%=rform.getUserId()%></td>
			<td><%=rform.getDate()%></td>
			<td><%=rform.getDescription()%></td>
			<td><%=rform.getCost()%></td>
			<td>pending</td>
		</tr>
		<%} %>
	
	</table>
	</br>
	<h2><font color="#00Bfff"> Resolved Reimbursements</font></h2>

	<table class="table" border="2" cellspacing="10" cellpadding="10">
		<tr>
			<th>User Id:</th>
			<th>Date:</th>
			<th>Description:</th>
			<th>Cost:</th>
			<th>Status</th>
		</tr>
	
		<%
		while (iterator1.hasNext()) {
			RForm rform1 = iterator1.next();
			
		%>
		<tr>
			<td><%=rform1.getUserId()%></td>
			<td><%=rform1.getDate()%></td>
			<td><%=rform1.getDescription()%></td>
			<td><%=rform1.getCost()%></td>
			<td>resolved</td>
		</tr>
		<%
		}
		%>

	</table>
	<a href="managerhome.jsp"><font color="#00Bfff">Back</font></a>
	<a href="index.jsp"><font color="#00Bfff">logout</font></a>
</body>
</html>