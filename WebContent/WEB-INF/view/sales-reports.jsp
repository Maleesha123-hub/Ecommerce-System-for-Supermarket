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
<title>Sales Analytics | Report</title>
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
			<h1 align="center" style="color: red">Sales Analytics Report</h1>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<table id="datatable-buttons"
								class="table table-striped table-bordered dt-responsive nowrap"
								style="border-collapse: collapse; border-spacing: 0; width: 100%;">
								<caption>Sales Analytics Report</caption>
								<thead>
									<tr>
										<th>ID</th>
										<th>From</th>
										<th>To</th>
										<th>Sales(Orders)</th>
										<th>Canceled(Orders)</th>
										<th>Expenditure</th>
										<th>Income</th>
										<th>Saved_Date</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cus" items="${salesList}">

										<c:set var="id" value="${cus.id}" />
										<c:set var="fromdate" value="${cus.fromdate}" />
										<c:set var="todate" value="${cus.todate}" />
										<c:set var="sales" value="${cus.sales}" />
										<c:set var="canceled" value="${cus.canceled}" />
										<c:set var="expenditure" value="${cus.expenditure}" />
										<c:set var="income" value="${cus.income}" />
										<c:set var="income" value="${cus.savedate}" />
										<tr>
											<td>${cus.id}</td>
											<td>${cus.fromdate}</td>
											<td>${cus.todate}</td>
											<td>${cus.sales}</td>
											<td>${cus.canceled}</td>
											<td>${cus.expenditure}</td>
											<td>${cus.income}</td>
											<td>${cus.savedate}</td>
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
