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
<title>Orders | Report</title>
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
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
<!-- DataTables -->
<link
	href="<spring:url value="/resources/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" />"
	rel="stylesheet" type="text/css" />
<!-- Responsive datatable examples -->
<link
	href="<spring:url value="/resources/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" />"
	rel="stylesheet" type="text/css" />
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


<body>
	<div class="page-content">
		<div class="container-fluid">
			<!--------------------------- Customer Report---------------------------- -->
			<h1 align="center" style="color: red">Orders Report</h1>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<table id="datatable-buttons"
								class="table table-striped table-bordered dt-responsive nowrap"
								style="border-collapse: collapse; border-spacing: 0; width: 100%;">
								<caption>Orders Report</caption>
								<thead>
									<tr>
										<th>ID</th>
										<th>First_Name</th>
										<th>Last_Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Houseno</th>
										<th>Streetname</th>
										<th>Cityname</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cus" items="${cusList}">

										<c:set var="fname" value="${cus.id}" />
										<c:set var="fname" value="${cus.fname}" />
										<c:set var="lname" value="${cus.lname}" />
										<c:set var="email" value="${cus.email}" />
										<c:set var="email" value="${cus.phone}" />
										<c:set var="houseno" value="${cus.houseno}" />
										<c:set var="streetname" value="${cus.streetname}" />
										<c:set var="cityname" value="${cus.cityname}" />
										<tr>
											<td>${cus.id}</td>
											<td>${cus.fname}</td>
											<td>${cus.lname}</td>
											<td>${cus.email}</td>
											<td>${cus.phone}</td>
											<td>${cus.houseno}</td>
											<td>${cus.streetname}</td>
											<td>${cus.cityname}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!---------------------------End Customer Report---------------------------- -->

			<!-- End Page-content -->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<script>
								document.write(new Date().getFullYear())
							</script>
							© Parakrama Super.
						</div>
						<div class="col-sm-6">
							<div class="text-sm-end d-none d-sm-block">
								Crafted with <i class="mdi mdi-heart text-danger"></i> by <a
									href="https://soengsouy.com/" target="_blank"
									class="text-reset">Maleesha</a>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- end main content-->

		</div>
		<!-- END layout-wrapper -->
	</div>
	<!-- /Right-bar -->


	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>

	<!-- JAVASCRIPT -->
	<script
		src="<spring:url value="/resources/libs/jquery/jquery.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/metismenu/metisMenu.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/simplebar/simplebar.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/node-waves/waves.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/waypoints/lib/jquery.waypoints.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/jquery.counterup/jquery.counterup.min.js" />"></script>

	<!-- Required datatable js -->
	<script
		src="<spring:url value="/resources/libs/datatables.net/js/jquery.dataTables.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js" />"></script>
	<!-- Buttons examples -->
	<script
		src="<spring:url value="/resources/libs/datatables.net-buttons/js/dataTables.buttons.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" />"></script>
	<script src="<spring:url value="/resources/libs/jszip/jszip.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/pdfmake/build/pdfmake.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/pdfmake/build/vfs_fonts.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/datatables.net-buttons/js/buttons.html5.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/datatables.net-buttons/js/buttons.print.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/datatables.net-buttons/js/buttons.colVis.min.js" />"></script>

	<!-- Responsive examples -->
	<script
		src="<spring:url value="/resources/libs/datatables.net-responsive/js/dataTables.responsive.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" />"></script>
	<script
		src="<spring:url value="/resources/libs/masonry-layout/masonry.pkgd.min.js" />"></script>

	<!-- Datatable init js -->
	<script
		src="<spring:url value="/resources/js/pages/datatables.init.js" />"></script>

	<!-- App js -->
	<script src="<spring:url value="/resources/js/app.js" />"></script>
</body>
</html>
