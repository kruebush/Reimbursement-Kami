
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
	RFormDAO rformDAO = new RFormDAOImpl();
	List<RForm> rforms = rformDAO.getPendingFormByPassword(password);
	Iterator<RForm> iterator = rforms.iterator();
	%>

	<h1>
		<%=username%>
		Pending Reimbursements
	</h1>
	
	<table class="table" border="2" cellspacing="10" cellpadding="10" class="table table-bordered">
		<thead >
			<tr >
				<th scope="col">Status</th>
				<th scope="col">User Id:</th>
				<th scope="col">Date:</th>
				<th scope="col">Description: </th>
				<th scope="col">Cost:</th>
			</tr>
		</thead>
		<tbody>
		<%
		while (iterator.hasNext()) {
			RForm rform = iterator.next();
		%>

		<tr>
			<th scope="row"><%=rform.getUserId()%></th>
			<td><%=rform.getDate()%></td>
			<td><%=rform.getDescription()%></td>
			<td><%=rform.getCost()%></td>
			<td>pending</td>
		</tr>
		<%
		}
		%>
	</table>
	
	<a href="employeehome.jsp"><font color="#00BFFF" >Back</font></a>
	<a href="index.jsp"><font color="#00BFFF" >logout</font></a>
</body>
</html>