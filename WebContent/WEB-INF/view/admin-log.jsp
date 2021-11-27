<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!--- jstl tab library ---->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Admin Login | Parakrama - Web Site</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description" />
<meta content="Themesbrand" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="<spring:url value="/resources/images/main-icon.png" />">
<!-- Bootstrap Css -->
<link href="<spring:url value="/resources/css/bootstrap.min.css" />"
	id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="<spring:url value="/resources/css/icons.min.css" />"
	rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="<spring:url value="/resources/css/app.min.css" />"
	id="app-style" rel="stylesheet" type="text/css" />
</head>

<body class="authentication-bg"
	style="background: radial-gradient(rgb(255, 229, 229), #aaf2ff)">
	<div class="account-pages my-5 pt-sm-5">
		<div class="container">
			<div class="row"></div>
			<div class="row align-items-center justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5">
					<div class="card">
						<div class="card-body p-4">
							<div class="text-center">
								<img
									src="<spring:url value="/resources/images/shopmainlogo.png" />"
									alt="" height="35px" width="138px">
							</div>
							<div class="text-center mt-2">
								<h5 class="text-primary">Parakrama Super</h5>
								<p class="text-muted">Login to the admin dashboard.</p>
							</div>
							<div class="p-2 mt-4">
								<form action="adminlogpro" method="POST">
									<div class="mb-3">
										<label class="form-label" for="username">Username</label> <input
											type="text" name="uname" class="form-control" id="uname"
											placeholder="Enter username" required="required">
									</div>
									<div class="mb-3">
										<label class="form-label" for="userpassword">Password</label>
										<input type="password" name="password" class="form-control"
											id="password" placeholder="Enter password"
											required="required">
									</div>
										<small style="color: red"><b>${userWrong}</b></small> 
									<div class="form-check">
										<input type="checkbox" name="" class="form-check-input"
											id="auth-remember-check" onclick="myFunction()"><label
											class="form-check-label" for="auth-remember-check">Show
											Password</label>
									</div>
									<script>
										function myFunction() {
											var x = document
													.getElementById("password");
											if (x.type === "password") {
												x.type = "text";
											} else {
												x.type = "password";
											}
										}
									</script>
									<div class="mt-3 text-end">
										<button class="btn btn-primary w-sm waves-effect waves-light"
											type="submit">Log In</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- <div class="mt-5 text-center">
						<p>
							©
							<script>
								document.write(new Date().getFullYear())
							</script>
							Parakrama Super | Crafted with <i
								class="mdi mdi-heart text-danger"></i> by Maleesha
						</p>
					</div> -->
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- JAVASCRIPT -->
	<script src="assets/libs/jquery/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/libs/metismenu/metisMenu.min.js"></script>
	<script src="assets/libs/simplebar/simplebar.min.js"></script>
	<script src="assets/libs/node-waves/waves.min.js"></script>
	<script src="assets/libs/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="assets/libs/jquery.counterup/jquery.counterup.min.js"></script>
	<!-- App js -->
	<script src="assets/js/app.js"></script>
</body>

</html>