<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.training.dao.UserDAOImpl"%>
<%@page import="com.training.dao.UserDAO"%>
<%@page import="com.trianing.model.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href=" employee.css">
</head>
<script type="text/javascript">
	function validateSignUpForm() {
		//showing different way to call 
		//// error in page due to err.innerhtml causing funciton to fail 

		var fullname = document.getElementById("fullname").value;
		var uname1 = document.getElementById("username").value;
		//var uname2 = document.signupform.username.value;
		var pwd = document.getElementById("password").value;
		var confirmpwd = document.forms[0].elements[3].value;

		var radio1 = document.getElementById("radio1").checked
		var radio2 = document.getElementById("radio2").checked
		var radio3 = document.getElementById("radio3").checked

		var email = document.getElementById("email").value;
		var phnum = document.getElementById("phonenumber").value;
		var birthday = Date.parse(document.getElementById("dob").value);

		//If you rather use a for loop for radio

		/* var radio = new Array();
		for(i=3;i<=5;i++){
			radio[i]=document.forms[].element[i].checked
		}
		
		 */

		var qual = document.signupform.qualification.options.selectedIndex;

		var errfull = document.getElementById("errfull");
		var erruname1 = document.getElementById("erruname1");
		var errpwd = document.getElementById("errpwd");
		var errconfirmpwd = document.getElementById("errconfirmpwd");
		var erremail = document.getElementById("erremail");
		var errphnum = document.getElementById("errphnum");
		var errdob = document.getElementById("errdob");
		//var errgender = document.getElementById("errgender");
		//var errqual = document.getElementById("errqual");

		errfull.innerHTML = "";
		erruname1.innerHTML = "";
		errpwd.innerHTML = "";
		errconfirmpwd.innerHTML = "";
		erremail.innerHTML = "";
		errphnum.innerHTML = "";
		errdob.innerHTML = ";"
		//errchecked.innerHTML="";
		//errgender.innerHTML = "";
		//errqual.innerHTML = "";

		if (fullname.length == 0) {
			errfull.innerHTML = "<font color=black>Please enter your name</font>"
			return false;
		} else if (uname1.length == 0) {
			erruname1.innerHTML = "<font color=blak>Please enter username</font>"
			return false;
		} else if (pwd.length == 0) {
			errpwd.innerHTML = "<font color=grey>Please enter password</font>"
			return false;
		} else if (pwd != confirmpwd) {
			errconfirmpwd.innerHTML = "<font color=grey>Please re-enter the password</font>"
			return false;
		} else if (radio1 == 0 && radio2 == 0 && radio3 == 0) {
			//alert("Please select one");
			errgender.innerHTML = "<font color=grey> Please select a gender or other </font>"
			return false;
		}
		/* using the enhanced for loop for radio
		else if(radio[0] ==  && radio[1] == 0 && radio[2]==0 ){
			ergender.innerHTML =  "<font color=grey> Please select a gender or other </font>";
			//return false;
		}
		
		else if (!checked1 && !checked2 &&!checked3){
			alert("Please select at least one");
			//errcheck.innerHTML =  "<font color=black> Please select a notification</font>";
			return false;
		}
		
		 */
		else if (email.length == 0) {
			erremail.innerHTML = "<font color=grey>Please enter an email</font>"
			return false;
		} else if (phnum.length == 0) {
			errphnum.innerHTML = "<font color=grey>Please enter a phonenumber</font>"
			return false;
		} else if (dob == 0) {
			errdob.innerHTML = "<font color=grey> Please enter your date of birth</font>"
			return false;
		} else if (qual == 0) {
			alert("Please select a one qualification ");
			//errqaul.innerHTML =  "<font color=grey>Please select your qualification </font>"
			return false;
		}
	}
</script>
<body>
	<%
	int userId = Integer.parseInt(request.getParameter("lookid"));
	String userId2 = (String) request.getAttribute("lookid");
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	%>
<h1>Edit Information</h1>
	<form class="form-style" action="UpdatedInfo" target="_blank"
		onsubmit="return validateSignUpForm()" name="signupform" method="get">
		<table class="table2" cellspacing="10" cellpadding="20">
			<%
			UserDAO userDAO = new UserDAOImpl();
			List<User> users = userDAO.viewUser(username, password);
			Iterator<User> iterator = users.iterator();
			%>
			<%
			while (iterator.hasNext()) {
				User user = iterator.next();
			%>

			<tr>
				<td><label><font size="5">Full Name:
							<h4></h4>
					</font> </label></td>
				<td><input type="text" value="<%=user.getFull_name()%>"
					name="fullname" id="fullname"><span id="errfull"></span></td>
			</tr>
			<tr>
				<td><label><font size="5">*Username: </font> </label></td>
				<td><input type="text" value="<%=user.getUsername()%> "
					name="username" id="username"><span id="erruname1"></span></td>
			</tr>
			<tr>
				<td><label><font size="5">* Reset Password: </font></label></td>
				<td><input type="password" value="<%=user.getPassword()%>"
					name="password" id="password"><span id="errpwd"></span>
			</tr>
			<tr>
				<td><label><font size="5">* Confirm Reset
							Password:</font> </label></td>
				<td><input type="password" value="<%=user.getPassword()%>"
					name="confirmpassword" id="confirmpassword"><span
					id="errconfirmpwd"></span></td>
			</tr>
			<tr>
				<td><label><font size="5"> Gender: </font></label></td>
				<td><input type="radio" name="gender" value="male" id="radio1">Male
					<input type="radio" name="gender" value="female" id="radio2">Female
					<input type="radio" name="gender" value="others" id="radio3">Others<span
					id="errgender"></span></td>
			</tr>
			<tr>
				<td><label><font size="5">Email:</font> </label></td>
				<td><input type="text" value="<%=user.getEmail()%> "
					name="email" id="email"><span id="erremail"></span>
			</tr>
			<tr>
				<td><label><font size="5">Phone Number:</font> </label></td>
				<td><input type="text" value="<%=user.getPhonenumber()%> "
					name="phonenumber" id="phonenumber"><span id="errphnum"></span>
			</tr>
			<tr>
				<td><label><font size="5">Date of Birth:</font> </label></td>
				<td><input type="date" value="<%=user.getDob()%> " name="dob"
					id="dob" max="2023-31-12"> <span id="errdob"></span></td>
			</tr>
			<tr>
				<td><label><font size="5"> Qualification: </font></label></td>
				<td><select name="qualification" id="qualification">
						<option>--select --</option>
						<option>Graduate</option>
						<option>PostGraduate</option>
						<option>Masters</option>
				</select><span id="errqual"></span></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td><label><font size="5">UserId:</font> </label></td>
				<td><input type="text" name="userId" id="userId"
					value="<%=userId%>"><span id="errfull"></span></td>
			</tr>
			<tr>
				<td><input type="submit" value="Edit"
					onclick="validateSignUpForm()"></td>
				<td><input type="reset" value="Clear"></td>
			</tr>

		</table>


		<a href="employeehome.jsp"><font size="5" color="#00BFFF">Back</font></a>
	</form>
	<a href="index.jsp">Logout</a>


</body>
</html>