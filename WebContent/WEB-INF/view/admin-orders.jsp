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
<title>Parakrama | Orders</title>
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
</head>

<body>
	<!-- <body data-layout="horizontal" data-topbar="colored"> -->
	<!-- Begin page -->
	<div id="layout-wrapper">
		<header id="page-topbar">
			<div class="navbar-header">
				<div class="d-flex">
					<!-- LOGO -->
					<div class="navbar-brand-box">
						<a href=./admindashboard class="logo logo-dark"> <span
							class="logo-sm"> <img alt="shoplogo"
								src="<spring:url value="/resources/images/shopmainlogo.png" />"
								height="22px">
						</span></a>
					</div>
					<button type="button"
						class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
						<i class="fa fa-fw fa-bars"></i>
					</button>
					<!-- App Search-->
					<form class="app-search d-none d-lg-block">
						<div class="position-relative">
							<input type="text" class="form-control" placeholder=""> <span
								class="uil-search"></span>
						</div>
					</form>
				</div>

				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item waves-effect"
						id="page-header-user-dropdown" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<img class="rounded-circle header-profile-user"
							src="<spring:url value="/resources/images/adminuser.png" />"
							width="50px" height="50px" alt="Header Avatar"> <span
							class="d-none d-xl-inline-block ms-1 fw-medium font-size-15">${adminName}</span>
						<i class="uil-angle-down d-none d-xl-inline-block font-size-15"></i>
					</button>
				</div>
			</div>
		</header>
		<!-- ========== Left Sidebar Start ========== -->
		<div class="vertical-menu">
			<!-- LOGO -->
			<div class="navbar-brand-box">
				<a href=./admindashboard class="logo logo-dark"> <span
					class="logo-sm"> <img
						src="<spring:url value="/resources/images/shopmainlogo.png" />"
						alt="" height="25" width="55px">
				</span> <span class="logo-lg"> <img
						src="<spring:url value="/resources/images/shopmainlogo.png" />"
						alt="" width="170px" height="40">
				</span>
				</a> <a href="index.html" class="logo logo-light"> <span
					class="logo-sm"> <img
						src="<spring:url value="/resources/images/shopmainlogo.png" />"
						alt="" height="25" width="55px">
				</span> <span class="logo-lg"> <img
						src="<spring:url value="/resources/images/shopmainlogo.png" />"
						alt="" height="25" width="55px">
				</span>
				</a>
			</div>
			<button type="button"
				class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
				<i class="fa fa-fw fa-bars"></i>
			</button>
			<div data-simplebar class="sidebar-menu-scroll">
				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<!-- Left Menu Start -->
					<ul class="metismenu list-unstyled" id="side-menu">
						<li class="menu-title">Menu</li>
						<li><a href=./admindashboard> <i class="iconify "
								data-icon="uil-home-alt" data-inline="false"></i> <span
								class="badge rounded-pill bg-primary float-end"></span> <span>Dashboard</span>
						</a></li>
						<li class="menu-title"><img
							src="<spring:url value="/resources/images/icon/app.png" />"
							width="20px" height="20px"><img
							src="<spring:url value="/resources/images/icon/icons8_google_wallet_25px.png" />"
							width="15px" height="20px"><i class="uil-store"></i><span>
								Apps</span></li>
						<li><a href=./adduser class="waves-effect"><img
								src="<spring:url value="/resources/images/icon/addp.png" />"
								width="25px" height="25px"><i class="uil-calender"></i> <span>Add
									User</span> </a></li>
						<li><a href=./messages class="waves-effect"><img
								src="<spring:url value="/resources/images/icon/message.png" />"
								width="25px" height="25px"><i class="uil-calender"></i> <span>Message</span>
						</a></li>
						<br>
						<li class="menu-title"><img
							src="<spring:url value="/resources/images/icon/icons8_geography_25px.png" />"
							width="20px" height="20px"><img
							src="<spring:url value="/resources/images/icon/icons8_google_wallet_25px.png" />"
							width="15px" height="20px"><i class="uil-store"></i><span>
								Ecommerce</span></li>
						<li><a href=./addproducts class="waves-effect"><img
								src="<spring:url value="/resources/images/icon/addpro.png" />"
								width="25px" height="25px"><i class="uil-calender"></i> <span>Add
									Product</span> </a></li>
						<li><a href=./orders class="waves-effect"><img
								src="<spring:url value="/resources/images/icon/order.png" />"
								width="25px" height="25px"><i class="uil-calender"></i> <span>Orders</span>
						</a></li>
						<li><a href=./customers class="waves-effect"><img
								src="<spring:url value="/resources/images/icon/cus.png" />"
								width="25px" height="25px"><i class="uil-calender"></i> <span>Customers</span>
						</a></li>
						<br>
						<li class="menu-title"><img
							src="<spring:url value="/resources/images/icon/annual.png" />"
							width="20px" height="20px"><img
							src="<spring:url value="/resources/images/icon/icons8_google_wallet_25px.png" />"
							width="15px" height="20px"><i class="uil-store"></i><span>
								Annual</span></li>
						<li><a href=./reports class="waves-effect"><img
								src="<spring:url value="/resources/images/icon/report.png" />"
								width="25px" height="25px"><i class="uil-calender"></i> <span>Reports</span>
						</a></li>
						<li><a href=./adminlogin class="waves-effect"><img
								src="<spring:url value="/resources/images/icon/signout.png" />"
								width="25px" height="25px"><i class="uil-calender"></i> <span>Sign
									Out</span> </a></li>
					</ul>
				</div>
				<!-- Sidebar -->
			</div>
		</div>
		<!-- Left Sidebar End -->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
					<!-- end row -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-12">
											<div
												class="page-title-box d-flex align-items-center justify-content-between">
												<h4 class="mb-0">Orders</h4>
												<div class="page-title-right">
													<ol class="breadcrumb m-0">
														<li class="breadcrumb-item active">Customer / Orders</li>
													</ol>
												</div>
											</div>
										</div>
									</div>

									<!-- ---------------------ORDER Fields LOAD AND ANALYS-------------------------------- -->

									<div class="row">
										<div class="custom-accordion">
											<div class="card">
												<a href="#checkout-billinginfo-collapse" class="text-dark"
													data-bs-toggle="collapse">
													<div class="p-4">
														<div class="d-flex align-items-center">
															<div class="flex-shrink-0 me-3">
																<i class="uil uil-receipt text-danger h4">01</i>
															</div>
															<div class="flex-grow-1 overflow-hidden">
																<h5 class="font-size-16 mb-1">Billing Info</h5>
															</div>
															<div class="flex-shrink-0">
																<i
																	class="mdi mdi-chevron-up accor-down-icon font-size-24"></i>
															</div>
														</div>
													</div>
												</a>
												<div id="checkout-billinginfo-collapse"
													class="collapse show">
													<div class="p-4 border-top">
														<form>
															<div>
																<div class="row">
																	<div class="col-lg-4">
																		<div class="mb-3 mb-4">
																			<label class="form-label" for="billing-name">Name</label>
																			<input type="text" class="form-control"
																				id="billing-name" placeholder="Enter name"
																				required="required">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="mb-3 mb-4">
																			<label class="form-label" for="billing-email-address">Email
																				Address</label> <input type="email" class="form-control"
																				id="billing-email-address" placeholder="Enter email"
																				required="required">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="mb-3 mb-4">
																			<label class="form-label" for="billing-phone">Phone</label>
																			<input type="text" class="form-control"
																				id="billing-phone" placeholder="Enter Phone no."
																				required="required">
																		</div>
																	</div>
																</div>
																<div class="mb-4">
																	<label class="form-label" for="billing-address">Address</label>
																	<textarea class="form-control" id="billing-address"
																		rows="3" placeholder="Enter full address"
																		required="required"></textarea>
																</div>
																<div class="row">
																	<div class="col-lg-4">
																		<div class="mb-4 mb-lg-0">
																			<label class="form-label" for="billing-city">City</label>
																			<input type="text" class="form-control"
																				id="billing-city" placeholder="Enter City"
																				required="required">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="mb-0">
																			<label class="form-label" for="zip-code">Zip
																				/ Postal code</label> <input type="text"
																				class="form-control" id="zip-code"
																				placeholder="Enter Postal code" required="required">
																		</div>
																	</div>
																</div>
																<br>
																<div class="mb-4">
																	<label class="form-label" for="reply">Reply</label>
																	<textarea class="form-control" id="reply" rows="3"
																		placeholder="Enter Reply" required="required"></textarea>
																</div>
																<div>
																	<div>
																		<button type="submit" id="sendMessage"
																			class="btn btn-primary waves-effect waves-light me-1">Send</button>
																		<button type="reset" id="reset"
																			class="btn btn-secondary waves-effect">Cancel</button>
																	</div>
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br> <br>

								<!-- ---------------------END ORDER Fields LOAD AND ANALYS-------------------------------- -->
								<h4>Latest Transactions</h4>


								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-body">
												<table id="datatable"
													class="table table-bordered dt-responsive nowrap"
													style="border-collapse: collapse; border-spacing: 0; width: 100%;">
													<thead>
														<tr class="bg-transparent">
															<th>Order ID</th>
															<th>Billing Name</th>
															<th>Order Date</th>
															<th>Total</th>
															<th>Status</th>
															<th>Cancel Order</th>
															<th>View Details</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><a href="javascript: void(0);"
																class="text-body fw-bold">#MB2540</a></td>
															<td>Neal Matthews</td>
															<td>07 Oct, 2019</td>
															<td>$400</td>
															<td>
																<button type="button"
																	class="btn btn-warning btn-sm btn-rounded waves-effect waves-light">
																	Hold</button>
																<button type="button"
																	class="btn btn-light btn-sm btn-rounded waves-effect waves-light">
																	<small style="color: red; font-size: 13px">Delivered</small>
																</button>
															</td>
															<td>
																<button type="button"
																	class="btn btn-danger btn-sm btn-rounded waves-effect waves-light">
																	Cancel Order</button>
															</td>
															<td>
																<button type="button"
																	class="btn btn-primary btn-sm btn-rounded waves-effect waves-light">
																	View Details</button>
															</td>
														</tr>
														<tr>
															<td><a href="javascript: void(0);"
																class="text-body fw-bold">#MB2541</a></td>
															<td>Jamal Burnett</td>
															<td>07 Oct, 2019</td>
															<td>$380</td>
															<td>

																<button type="button"
																	class="btn btn-warning btn-sm btn-rounded waves-effect waves-light">
																	Hold</button>
																<button type="button"
																	class="btn btn-light btn-sm btn-rounded waves-effect waves-light">
																	<small style="color: red; font-size: 13px">Delivered</small>
																</button>
															</td>

															<td>
																<button type="button"
																	class="btn btn-danger btn-sm btn-rounded waves-effect waves-light">
																	Cancel Order</button>
															</td>
															<td>
																<button type="button"
																	class="btn btn-primary btn-sm btn-rounded waves-effect waves-light">
																	View Details</button>
															</td>
														</tr>
														<tr>
															<td><a href="javascript: void(0);"
																class="text-body fw-bold">#MB2545</a></td>
															<td>Jacob Hunter</td>
															<td>04 Oct, 2019</td>
															<td>$392</td>
															<td>

																<button type="button"
																	class="btn btn-warning btn-sm btn-rounded waves-effect waves-light">
																	Hold</button>
																<button type="button"
																	class="btn btn-light btn-sm btn-rounded waves-effect waves-light">
																	<small style="color: red; font-size: 13px">Delivered</small>
																</button>
															</td>
															<td>
																<button type="button"
																	class="btn btn-danger btn-sm btn-rounded waves-effect waves-light">
																	Cancel Order</button>
															</td>
															<td>
																<button type="button"
																	class="btn btn-primary btn-sm btn-rounded waves-effect waves-light">
																	View Details</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- end table-responsive -->
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- container-fluid -->
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
	</div>
	<!-- end main content-->
	</div>
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