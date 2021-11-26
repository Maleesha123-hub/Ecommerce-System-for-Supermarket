<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!--- jstl tab library ---->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login page - Parakrama</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>

<script>
	function passvalue() {
		var username = document.getElementById("uname").value;
		localStorage.setItem("textvalue", username);
		return false;
	}
</script>

</head>

<body>

	<!---------------------login page----------------->

	<div class="login-page">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
			src="<spring:url value="/resources/images/logo.png" />" width="220px"
			height="60"> <br> <br> <br> <br> <br>
		<div class="row">
			<div class="col-2">
				<br> <br> <br> <br> <img alt="MainPic"
					src="<spring:url value="/resources/images/mainpic.png" />"
					width="100%">
			</div>
			<div class="col-2">
				<div class="form-container">
					<div class="form-btn">
						<span onclick="login()">Login</span> <span onclick="register()">Register</span>
						<hr id="Indicator">
					</div>
					<form action="loginprocess" method="post" id="LoginForm">
						<input type="text" name="uname" placeholder="User Name" required
							id="uname"> <input type="password" name="password"
							placeholder="Password" required> <small
							style="color: red"><b>${userWrong}</b></small>
						<button type="submit" class="btn" value="click"
							onclick="passvalue()">Login</button>
						<div class="statement">
							<small>Already registered? Login here! <br> <b>OR</b>
								<br>Forgot Password or Username? <a href="recover"
								style="color: #f37e3b">Click here</a> to Reset!
							</small>
						</div>

					</form>

					<form action="register" method="post" id="RegForm">
						<small style="color: red"><b>${userWrong}</b></small> 
						<small style="color: #07c400"><b>${regSuccess}</b></small>
						<small style="color: red"><b>${userExists}</b></small>
						<small style="color: red"><b>${emailExists}</b></small>
						<input type="text" name="fname" placeholder="First Name" required>
						<input type="text" name="lname" placeholder="Last Name" required>
						<input type="text" name="uname" placeholder="User Name" required>
						<input type="email" name="email" placeholder="Your Email" required>

						<input type="password" name="password" placeholder="Password"
							id="password" required> <input type="password"
							name="confirm_password" placeholder="Confirm Password"
							id="confirm_password" required>

						<script>
							var password = document.getElementById("password"), confirm_password = document
									.getElementById("confirm_password");

							function validatePassword() {
								if (password.value != confirm_password.value) {
									confirm_password
											.setCustomValidity("Passwords Don't Match");
								} else {
									confirm_password.setCustomValidity('');
								}
							}

							password.onchange = validatePassword;
							confirm_password.onkeyup = validatePassword;
						</script>

						<button type="submit" class="btn">Register</button>
						<small>New to parakrama? Register here!</small>
					</form>
				</div>
			</div>
		</div>
	</div>






	<!-------------js for toggle menu----------->
	<script>
		var MenuItems = document.getElementById("MenuItems");
		MenuItems.style.maxHeight = "0px";

		function menutoggle() {
			if (MenuItems.style.maxHeight == "0px") {
				MenuItems.style.maxHeight = "200px";
			} else {
				MenuItems.style.maxHeight = "0px";
			}
		}
	</script>

	<!-------------js for toggle Form----------->

	<script>
		var LoginForm = document.getElementById("LoginForm");
		var RegForm = document.getElementById("RegForm");
		var Indicator = document.getElementById("Indicator");

		function register() {
			RegForm.style.transform = "translateX(0px)";
			LoginForm.style.transform = "translateX(0px)";
			Indicator.style.transform = "translateX(100px)";
		}

		function login() {
			RegForm.style.transform = "translateX(300px)";
			LoginForm.style.transform = "translateX(300px)";
			Indicator.style.transform = "translateX(0px)";
		}
	</script>


</body>

</html>