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
<link type="text/css" rel="stylesheet" href=" style1.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"
        
 type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
 </script>
<script type="text/javascript">
$(function () {
    //Assign Click event to Button.
$(function () {
        //Assign Click event to Button.
        $("#btnGet").click(function () {
        	var message = "Deleted succsefully";
        	 
            //Loop through all checked CheckBoxes in GridView.
            $("#Table1 input[type=checkbox]:checked").each(function () {
                var row = $(this).closest("tr")[0];
                String message += row.cells[1].innerHTML;
          
            });
 
            //Display selected Row data in Alert Box.
            
            alert (message);
            return false;
        });
    });
   </script>
</head>
<body>
<% 
	RFormDAO rformDAO = new RFormDAOImpl();
	List<RForm> rforms = rformDAO.getPenReim();
	Iterator<RForm> iterator = rforms.iterator();

%>
	<h1>All Pending Reimbursement Forms</h1>
	<form class="form-style" action = "approved.jsp" target="_new"
	onsubmit="  "  name = "signupform" method="get">
	<h4>To approve check the box/box's and select approve. </h4>
	<h4>To deny check the box/box's and select deny. </h4>
	
	<table class="table">
  <thead>
    <tr>
      <th scope="col">
        <div class="form-check">
          <h4>Approve?</h4><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
        </div>
      </th>
      <th scope="col">UserId</th>
      <th scope="col">Date</th>
      <th scope="col">Description</th>
      <th scope="col">Cost</th>
    </tr>
  </thead>
  <tbody>
   <%
		while (iterator.hasNext()){
			RForm rform = iterator.next();
		%>
    <tr>
      <th scope="row">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
        </div>
      </th>
    <td><input type= "checkbox" value="" id="checkapprove"  ></td>
			<td><%=rform.getUserId()%></td>
			<td><%=rform.getDate()%></td>
			<td><%=rform.getDescription()%></td>
			<td>$<%=rform.getCost()%></td>
			<td>pending</td>
		</tr>
		<% }%>
  </tbody>
</table>
		<tr>
			<td><input type="button" value="Deny Delete" id = "btnGet"  onClick="location.href='denny.jsp'"></td>
		<% //	<--!--<td><input type="button" value="Deny" onclick=" <a href =denny.jsp> "</td> -->%>
				<td><input type="submit" value="Approve" ></td>
				<td><input type="reset" value="Clear"></td>
			</tr>
			
	</form>
	</br>
	</br>
	</br>
	</br>

	<a href="managerhome.jsp">Back</a>
</body>

</html>