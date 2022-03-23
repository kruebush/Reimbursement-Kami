<%@page import="org.apache.catalina.tribes.ChannelSender"%>
<%@page import="com.trianing.model.RForm"%>
<%@page import="com.training.dao.RFormDAOImpl"%>
<%@page import="com.training.dao.RFormDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">
</head>
<%
	String userId = request.getParameter("delete");
	//String check[] = request.getParameterValues("check");
	//String finalcheck=" ";
	//for (String temp:check){
		//finalcheck += temp + ":"; }
	//
%>
<body>

<%
 		
		RFormDAO rformDAO = new RFormDAOImpl();
		rformDAO.deleteAfterAproval(userId);
		
	if (!rformDAO.deleteAfterAproval(userId)) {

	RequestDispatcher dispatcher = request.getRequestDispatcher("displayAllPendForms.jsp");
			dispatcher.forward(request, response);
	
	} else {
	%>
	<h1>There are no pending reimbursements for that user ID</h1>
	<%} %>

<a href="managerhome.jsp"><font color= "#00BFF" >Back</font></a>

</body>
</html>

