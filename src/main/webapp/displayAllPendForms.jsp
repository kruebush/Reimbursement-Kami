<%@page import="javax.swing.text.Document"%>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous" type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
	
</script>
<script type="text/javascript">
	/*   $(function () {
	       //Assign Click event to Button.
	       $("#btnGet").click(function () {
	       	var message = "Deleted succsefully";
	       	 
	           //Loop through all checked CheckBoxes in GridView.
	           $("#Table1 input[type=checkbox]:checked").each(function () {
	               var row = $(this).closest("tr")[0];
	               message += row.cells[1].innerHTML;
	         
	           });
	
	           //Display selected Row data in Alert Box.
	           
	           alert (message);
	           return false;
	       });
	   });
	   function();
	   console.log)(message);
	 */

	function validate() {
		var checked1 = document.getElementByName("check").checked
	}
</script>


</head>
<body>


	<%
	RFormDAO rformDAO = new RFormDAOImpl();
	List<RForm> rforms = rformDAO.getPenReim();
	Iterator<RForm> iterator = rforms.iterator();
	%>

	<h1>All Pending Reimbursement Forms</h1>

	<form class="form-style" action="approved.jsp" target="_blank"
		onsubmit="" name="signupform" method="post">
		<h4>To approve check the box/box's and select approve.</h4>
		<h4>To deny check the box/box's and select deny.</h4>
		<table class="table" border="2" cellspacing="10" cellpadding=10
			" id="Table1">
			<thead>
				<th>Approve?</th>
				<th>User ID</th>
				<th>Date</th>
				<th>Description</th>
				<th>Cost</th>
				<th>Status</th>
			</thead>
			<%
			while (iterator.hasNext()) {
				RForm rform = iterator.next();
			%>
			<tr>
				<td><input type="checkbox" name="check"
					value="<%=rform.getUserId()%>"></td>
				<td><%=rform.getUserId()%></td>
				<td><%=rform.getDate()%></td>
				<td><%=rform.getDescription()%></td>
				<td>$<%=rform.getCost()%></td>
				<td>pending</td>
			</tr>
			<%
			}
			%>

		</table>
		<table class="table2">
			<tr>
				<td>User Id:</td>
				<td><input type="text" name="approve"></td>
				<td><input type="submit" value="Approve" name="approves"></td>
			</tr>
			</table>
			</form>
			<form action="denny.jsp" method='post'>
			<table class="table2">
			<tr>
			<td>User Id:</td>
			<td><input type="text" name="delete" id="delete"></td>
			<td><input type='submit' value='deny/delete' name="delete" id="delete" />
			</td>
			</tr>
			</table>
			</form>
		
			
			<!--  <td><input type="submit" value="Approve" ></td>
				<td><input type="reset" value="Clear"></td>-->
		
	
		</br> </br> </br> </br> <a href="managerhome.jsp"><font color="#00BFFF">Back</font></a>
</body>
</html>