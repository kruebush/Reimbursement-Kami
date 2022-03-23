<%@page import="com.training.dao.UserDAO"%>
<%@page import="com.training.dao.UserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">
<script type="text/javascript">


</script>
</head>
<body>
	<h1>View Reimbursement Forms</h1>
	<form action="viewReimOfEmpResult.jsp">
	
	<table class="table2">
		<tr><th>Search all Reimbursements of an Employee by user ID</th></tr>
	<tr><td>User ID : <input type="text" name="searcheid"> <input
			type="submit" value="search"></td></tr>
		</table>
	</form>
	
	
	</br>
	</br>
	
		<a href="managerhome.jsp"><font color="#00BFFF">Back</font></a>
</body>
</html>