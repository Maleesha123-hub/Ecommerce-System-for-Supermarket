<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Entity.ShoppingCart"%>
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
<title>Parakrama | Invoice</title>
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
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- ----Sweet Alert ------->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



</head>


<body>
	<!-- Start right Content here -->
	<!-- ============================================================== -->
	<div class="page-content">
		<!-- start page title -->
		<div class="row">
			<div class="col-12">
				<div
					class="page-title-box d-flex align-items-center justify-content-between">
					<h4 class="mb-0">Invoice Detail</h4>
					<div class="page-title-right">
						<ol class="breadcrumb m-0">
							<li class="breadcrumb-item"><a href="javascript: void(0);">Invoices</a></li>
							<li class="breadcrumb-item active">Invoice Detail</li>
						</ol>
					</div>

				</div>
			</div>
		</div>
		<!-- end page title -->

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="invoice-title">
							<h4 class="float-end font-size-16">
								Invoice #INVO${lastOrderId} <span
									class="badge bg-success font-size-12 ms-2">${lastStatus}</span>
							</h4>
							<div class="mb-4">
								<img
									src="<spring:url value="/resources/images/main-icon.png" />"
									alt="logo" height="20">
							</div>
							<div class="text-muted">
								<p class="mb-1">641/A Minuwangoda Road, Gampaha</p>
								<p class="mb-1">
									<i class="uil uil-envelope-alt me-1"></i>parakramasuper808@gmail.com
								</p>
								<p>
									<i class="uil uil-phone me-1"></i>507-475-6094
								</p>
							</div>
						</div>

						<hr class="my-4">

						<div class="row">
							<div class="col-sm-6">
								<div class="text-muted">
									<h5 class="font-size-16 mb-3">Billed To:</h5>


									<c:forEach var="cus" items="${userDetail}">

										<c:set var="id" value="${cus.id}" />
										<c:set var="fname" value="${cus.fname}" />
										<c:set var="lname" value="${cus.lname}" />
										<c:set var="email" value="${cus.email}" />
										<c:set var="email" value="${cus.phone}" />
										<c:set var="houseno" value="${cus.houseno}" />
										<c:set var="streetname" value="${cus.streetname}" />
										<c:set var="streetname" value="${cus.cityname}" />


										<h5 class="font-size-15 mb-2">${cus.fname}${cus.lname},</h5>
										<p class="mb-1">${cus.houseno},${cus.streetname},
											${cus.cityname}</p>
										<p class="mb-1">${cus.email}</p>
										<p>${cus.phone}</p>


									</c:forEach>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="text-muted text-sm-end">
									<div>
										<h5 class="font-size-16 mb-1">Invoice No:</h5>
										<p>#INVO${lastOrderId}</p>
									</div>
									<div class="mt-4">
										<h5 class="font-size-16 mb-1">Invoice Date:</h5>
										<p>${lastDate}</p>
									</div>
								</div>
							</div>
						</div>

						<%
							float proItemSubTotal = 0;
							int proItemCount = 0;
							if (session.getAttribute("proDetails") == null) {

							} else {
								List<ShoppingCart> proItemCartList = (List<ShoppingCart>) session.getAttribute("proDetails");

								for (int a = 0; a < proItemCartList.size(); a++) {
									proItemSubTotal = proItemSubTotal + proItemCartList.get(a).getSubTotal();
									proItemCount = proItemCount + 1;
								}
							}
						%>

						<div class="py-2">
							<h5 class="font-size-15">Order summary</h5>

							<div class="table-responsive">
								<table class="table table-nowrap table-centered mb-0">
									<thead>
										<tr>
											<th style="width: 70px;">No.</th>
											<th>Item</th>
											<th>Price</th>
											<th>Quantity</th>
											<th class="text-end" style="width: 120px;">Sub total</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="pro" items="${proDetails}">
											<tr>
												<th scope="row">${pro.product.id}</th>
												<td>
													<h5 class="font-size-15 mb-1">${pro.product.name}</h5>
												</td>
												<td>LKR ${pro.product.price}</td>
												<td>${pro.quantity}</td>
												<td class="text-end">LKR ${pro.subTotal}</td>
											</tr>
										</c:forEach>
										<tr>
											<th scope="row" colspan="4" class="border-0 text-end">Total</th>
											<td class="border-0 text-end"><h4 class="m-0">
													LKR
													<%
												out.print(proItemSubTotal);
											%>
												</h4></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="d-print-none mt-4">
								<div class="float-end">
									<a href="javascript:window.print()"
										class="btn btn-success waves-effect waves-light me-1"><i
										class="fa fa-print"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
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
							href="https://soengsouy.com/" target="_blank" class="text-reset">Maleesha</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- END layout-wrapper -->
	<!-- /Right-bar -->
	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>
	<!-- JAVASCRIPT -->
	<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/jquery/jquery.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/metismenu/metisMenu.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/simplebar/simplebar.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/node-waves/waves.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/waypoints/lib/jquery.waypoints.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/jquery.counterup/jquery.counterup.min.js" />"></script>
	<!-- Required datatable js -->
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/datatables.net/js/jquery.dataTables.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js" />"></script>
	<!-- Responsive examples -->
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/datatables.net-responsive/js/dataTables.responsive.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" />"></script>
	<!-- select 2 plugin -->
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/select2/js/select2.min.js" />"></script>
	<!-- dropzone plugin -->
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/dropzone/min/dropzone.min.js" />"></script>
	<!-- init js -->
	<script type="text/javascript"
		src="<spring:url value="/resources/js/pages/ecommerce-add-product.init.js" />"></script>
	<!-- App js -->
	<script type="text/javascript"
		src="<spring:url value="/resources/js/app.js" />"></script>
</body>

</html>