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
<title>Recovery Password | Parakrama - Web Site</title>
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
	style="background: radial-gradient(rgb(253, 244, 244), #f5bfbf)">
	<div class="account-pages my-5  pt-sm-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5">
					<div>
						<div class="card">
							<div class="card-body p-4">
								<div class="text-center mt-2">
									<img
										src="<spring:url value="/resources/images/shopmainlogo.png" />"
										alt="" height="35px" width="138px">
									<h5 class="text-primary">Reset Password</h5>
									<p class="text-muted">Reset Password with Parakrama.</p>
								</div>
								<div class="p-2 mt-4">
									<div class="alert alert-success text-center mb-4" role="alert"
										style="background-color: #20046b; color: white; border-radius: 20px">
										Enter your Email and instructions will be sent to you!</div>


									<form action="recoverprocess">
										<div class="mb-3">
											<br>
											<h5 style="color: red">${AlertFail}</h5>
											<h5 style="color: #07c400">${AlertSuccess}</h5>
											<input type="email" class="form-control" id="email"
												name="email" placeholder="Enter your email"
												required="required">
										</div>
										<div class="mt-3 text-end">
											<button class="btn btn-primary w-sm waves-effect waves-light"
												type="submit">Reset</button>
										</div>
										<div class="mt-4 text-center">
											<p class="mb-0">
												Remember It then? <a href="./"
													class="fw-medium text-primary"> Signin </a>
											</p>
										</div>
									</form>


								</div>
							</div>
						</div>
					</div>
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