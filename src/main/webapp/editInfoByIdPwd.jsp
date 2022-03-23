<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">

<script type="text/javascript">
function validate() {
		var uname= document.getElementById("lookname").value;
		var pwd= document.getElementById("lookpwd").value;
		var uid= document.getElementById("lookid").value;
		var errun = document.getElementById("errusername");
		var errpwd = document.getElementById("errpassword");
		var errid = document.getElementById("erruserid");
		errun.innerHTML ="";
		errpwd.innerHTML="";
		errid.innerHTML="";
		if (uname.length ==0){
			errun.innerHTML ="(Please enter the username)"
			return false;
		}else if (pwd.length ==0){
			errpwd.innerHTML= ("Please enter password")
			return false;
		}else if (pwd.length < 6 || pwd.length >12) {
			errpwd.innerHTML= ("Password length must be between 6-12")
			return false;
			}
		else if (uid.length ==0) {
			errid.innerHTML= ("Please enter your user ID")
			return false;
			}
	}
</script>
</head>
<body>
<h2><font color="#00BFFF">Please enter the following in order to edit your information</font></h2>
	<form action="ValidateIdPwd" onsubmit="return validate()" method="post">
	<table class="table2">
			<tr>
				<td><label>Username :</label> </td>
				<td><input type="text" name="lookname" id ="lookname"><span id="errusername"></span></td>
			</tr>
			<tr>
				<td><label>Password :</label></td>
				<td><input type="password" name="lookpwd" id="lookpwd"><span id="errpassword"></span></td>
			</tr>
			<tr>
				<td><label>UserId: </label></td>
				<td><input type="text" name="lookid" id="lookid"><span id="erruserid"></span></td>
			</tr>
			<tr>
			<td><input type="submit" value="Enter"></td>
			</tr>
		</table>
	</form>
</body>
</html>