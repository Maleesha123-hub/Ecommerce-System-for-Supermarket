<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.List"%>
<!--- jstl tab library ---->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>

<meta charset="utf-8" />
<title>Error 404 Error | Parakrama - Web Site</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description" />
<meta content="Themesbrand" name="author" />
<!-- App favicon 
<link rel="shortcut icon"
	href="<spring:url value="/resources/images/main-icon.png" />">-->
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css" />">
<!-- Bootstrap Css -->
<link href="<spring:url value="/resources/css/bootstrap.min.css" />" id="bootstrap-style"
	rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="<spring:url value="/resources/css/icons.min.css" />" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="<spring:url value="/resources/css/app.min.css" />" id="app-style" rel="stylesheet"
	type="text/css" />

</head>

<body class="authentication-bg">

	<div class="my-5 pt-sm-5">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="text-center">
						<div>
							<div class="row justify-content-center">
								<div class="col-sm-4">
									<div class="error-img">
										<img src="<spring:url value="/resources/images/404-error.png" />" alt=""
											class="img-fluid mx-auto d-block">
									</div>
								</div>
							</div>
						</div>
						<h4 class="text-uppercase mt-4">Sorry, Admin login Fail!</h4>
						<p class="text-muted">It will be as simple as Error data entering or do not match data !</p>
						<div class="mt-5">
							<a class="btn btn-primary waves-effect waves-light"
								href=adminBacklogin>Back to Login</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- JAVASCRIPT -->
	<script src="<spring:url value="/resources/libs/jquery/jquery.min.js" />"></script>
	<script src="<spring:url value="/resources/libs/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script src="<spring:url value="/resources/libs/metismenu/metisMenu.min.js" />"></script>
	<script src="<spring:url value="/resources/libs/simplebar/simplebar.min.js" />"></script>
	<script src="<spring:url value="/resources/libs/node-waves/waves.min.js" />"></script>
	<script src="<spring:url value="/resources/libs/waypoints/lib/jquery.waypoints.min.js" />"></script>
	<script src="<spring:url value="/resources/libs/jquery.counterup/jquery.counterup.min.js" />"></script>

	<!-- App js -->
	<script src="<spring:url value="/resources/js/app.js" />"></script>

</body>
</html>
