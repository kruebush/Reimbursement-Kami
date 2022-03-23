<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">
<script type="text/javascript">
	function validate() {
		var userId = document.getElementById("userId").value;
		var pwd = document.getElementById("password").value;
		var date = document.getElementById("date").value;
		var description = document.getElementById("description");
		var cost = document.getElementById("cost").value;
		var errUserId = document.getElementById("errUserId");
		var errpwd = document.getElementById("errpwd");
		var errdate = document.getElementById("errdate");
		var errdisc = document.getElementById("errdisc");
		var errcost = document.getElementById("errcost");

		errUserId.innerHTML = "";
		errpwd.innerHTML = "";
		errdate.innerHTML = "";
		errdisc.innerHTML = "";
		errcost.innerHTML = "";

		if (userId.length == 0) {
			errUserId.innerHTML = "<font color=grey>Please enter User Id</font>"
			return false;
		}

		else if (pwd.length == 0) {
			errpwd.innerHTML = "<font color=grey>Please enter your password</font>"
			return false;

		} else if (date.length == 0) {
			errdate.innerHTML = "<font color=grey>Please enter the date of when the charge was made</font>"
			return false;
		} else if (document.reimb.description.value == "") {
			errdisc.innerHTML = "<font color=grey>Please enter the descripion of the item that needs reimbursed </font>"
			return false;
		} else if (cost == 0) {
			errcost.innerHTML = "<font color=grey>Please enter the amount of what needs to be reimbursed </font>"
			return false;
		} else if (cost < 0) {
			errcoast.innerHTML = "<font color=grey>Please enter a valid amount</font>"
			return false;
		}
	}
</script>
</head>
<body>
	<h1>Reimbursement Form</h1>
	<hr />
	<br />

	<form class="form-style" action="SubmitFormControlls" name="reimb"
		onsubmit="return validate()" target="_new" method="get">
		<table class="table2" cellspacing="10" cellpadding="10">
			<tr>
				<td><label>User Id</label></td>
				<td><input type="text" name="userId" id="userId" size="2"><span
					id="errUserId"></span></td>
			</tr>
			<tr>
				<td><label>Password</label></td>
				<td><input type="password" placeholder="Please enter your password"
					name="password" id="password" size="10"> <span id="errpwd"></span></td>
			</tr>
			<tr>
				<td><label>Date</label></td>
				<td><input type="text" placeholder="DD/MM/YYYY" name="date"
					id="date" size="10"> <span id="errdate"></span></td>
			</tr>
			<tr>
				<td><label>Description</label></td>
				<td><textarea name="description" id="description" rows="5"
						cols="50"></textarea> <span id="errdisc"></span></td>

			</tr>
			<tr>
				<td><label>Cost</label></td>
				<td><input type="text" name="cost" placeholder="$00.00"
					id="cost"><span id="errcost"></span></td>
			</tr>
			<tr>
				<td><h3>Upload an Image of your receipt below</h3></td>
				<td><input class="filr-upload-input" type="file"
					onchange="readURL(this)" accept="Image/*" value="Upload"></td>
			</tr>
			<tr>

				<td><input type="submit" value="Submit" onclick="validate"></td>
				<td><input type="reset" value="Clear"></td>
			</tr>
		</table>
	</form>
	
	</br>
	</br>
	</br>
	</br>
	<a href="employeehome.jsp"><font color="#00BFFF" >Back</font></a>
</body>
</html>