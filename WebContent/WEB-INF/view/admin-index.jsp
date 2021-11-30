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
<title>Parakrama | Dashboard</title>
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
						<a href=./admin class="logo logo-dark"> <span class="logo-sm">
								<img alt="shoplogo"
								src="<spring:url value="/resources/images/shopmainlogo.png" />"
								height="22px">
						</span></a>
					</div>
					<button type="button"
						class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
						<i class="fa fa-fw fa-bars"></i>
					</button>
				</div>
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item waves-effect"
						id="page-header-user-dropdown" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<img class="rounded-circle header-profile-user"
							src="<spring:url value="/resources/images/adminuser.png" />"
							width="50px" height="50px" alt="Header Avatar"> <span
							class="d-none d-xl-inline-block ms-1 fw-medium font-size-15">
							${adminName} </span> <i
							class="uil-angle-down d-none d-xl-inline-block font-size-15"></i>
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
					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div
								class="page-title-box d-flex align-items-center justify-content-between">
								<h4 class="mb-0">Dashboard</h4>
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Parakrama</a></li>
										<li class="breadcrumb-item active">Dashboard</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="total-revenue-chart"></div>
									</div>
									<div>
										<h4 class="mb-1 mt-1">
											LKR <span data-plugin="counterup">${saleDaily}</span>
										</h4>
										<p class="text-muted mb-0">Daily Revenue</p>
									</div>
									<!-- <p class="text-muted mt-3 mb-0">
										<span class="text-success me-1"><i
											class="mdi mdi-arrow-up-bold me-1"></i>2.65%</span> since last week
									</p> -->
								</div>
							</div>
						</div>
						<!-- end col-->
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="orders-chart"></div>
									</div>
									<div>
										<h4 class="mb-1 mt-1">
											<span data-plugin="counterup">${ord}</span>
										</h4>
										<p class="text-muted mb-0">Orders</p>
									</div>
									<!-- <p class="text-muted mt-3 mb-0">
										<span class="text-danger me-1"><i
											class="mdi mdi-arrow-down-bold me-1"></i>0.82%</span> since last
										week
									</p> -->
								</div>
							</div>
						</div>
						<!-- end col-->
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="customers-chart"></div>
									</div>
									<div>
										<h4 class="mb-1 mt-1">
											<span data-plugin="counterup">${cus}</span>
										</h4>
										<p class="text-muted mb-0">Customers</p>
									</div>
									<!-- <p class="text-muted mt-3 mb-0">
										<span class="text-danger me-1"><i
											class="mdi mdi-arrow-down-bold me-1"></i>6.24%</span> since last
										week
									</p> -->
								</div>
							</div>
						</div>
						<!-- end col-->
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="growth-chart"></div>
									</div>
									<div>
										<h4 class="mb-1 mt-1">
											<span data-plugin="counterup">${pro}</span>
										</h4>
										<p class="text-muted mb-0">Products</p>
									</div>
									<!-- <p class="text-muted mt-3 mb-0">
										<span class="text-success me-1"><i
											class="mdi mdi-arrow-up-bold me-1"></i>10.51%</span> since last week
									</p> -->
								</div>
							</div>
						</div>
						<!-- end col-->
					</div>
					<!-- end row-->
					<div class="row">
						<div class="col-xl-4">
							<div class="card">
								<div class="card-body">
									<div class="float-end">
										<div class="dropdown">
											<a class=" dropdown-toggle" href="#" id="dropdownMenuButton2"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"> <span class="text-muted">All
													Members<i class="mdi mdi-chevron-down ms-1"></i>
											</span>
											</a>
										</div>
									</div>
									<h4 class="card-title mb-4">Top Users</h4>
									<div data-simplebar style="max-height: 336px;">
										<div class="table-responsive">
											<table
												class="table table-borderless table-centered table-nowrap">
												<tbody>
													<c:forEach var="cus" items="${custopDetails}">
														<c:set var="fname" value="${cus.fname}" />
														<c:set var="lname" value="${cus.lname}" />
														<c:set var="cityname" value="${cus.cityname}" />
														<tr>
															<td style="width: 20px;"></td>
															<td>
																<h6 class="font-size-15 mb-1 fw-normal">${cus.fname}
																	${cus.lname}</h6>
																<p class="text-muted font-size-13 mb-0">
																	<i class="mdi mdi-map-marker"></i> ${cus.cityname}
																</p>
															</td>
															<td></td>
															<td><span class="badge bg-soft-info font-size-12">Active</span></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- enbd table-responsive-->
									</div>
									<div class="mt-3 text-center">
										<a href="customers"
											class="text-primary font-size-14 fw-medium">View All
											Customers <i class="mdi mdi-chevron-right"></i>
										</a>
									</div>
									<!-- data-sidebar-->
								</div>
								<!-- end card-body-->
							</div>
							<!-- end card-->
						</div>
						<!-- end col -->
						<div class="col-xl-4">
							<div class="card">
								<div class="card-body">
									<div class="float-end">
										<div class="dropdown">
											<a class="dropdown-toggle" href="#" id="dropdownMenuButton3"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"> <span class="text-muted">Recent<i
													class="mdi mdi-chevron-down ms-1"></i></span>
											</a>
										</div>
									</div>

									<h4 class="card-title mb-4">Recent Conversation</h4>
									<ol class="activity-feed mb-0 ps-2" data-simplebar
										style="max-height: 336px;">
										<c:forEach var="cus" items="${mesDetails}">
											<li class="feed-item"><c:set var="message"
													value="${cus.message}" /> <c:set var="email"
													value="${cus.email}" /> <c:set var="publishedDate"
													value="${cus.publishedDate}" />
												<div class="feed-item-list">
													<p class="text-muted mb-1 font-size-13">
														<small class="d-inline-block ms-1">${cus.publishedDate}</small>
													</p>
													<p class="mb-0">
														${cus.message}<span class="text-primary">
															${cus.email}</span>
													</p>
												</div></li>
										</c:forEach>
									</ol>
									<div class="mt-3 text-center">
										<a href="messages" class="text-primary font-size-14 fw-medium">View
											All Masseges <i class="mdi mdi-chevron-right"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4">
							<div class="card">
								<div class="card-body">
									<div class="float-end">
										<div class="dropdown">
											<a class="dropdown-toggle" href="#" id="dropdownMenuButton3"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"> <span class="text-muted">Recent<i
													class="mdi mdi-chevron-down ms-1"></i></span>
											</a>
										</div>
									</div>

									<h4 class="card-title mb-4">Recent Orders</h4>
									<ol class="activity-feed mb-0 ps-2" data-simplebar
										style="max-height: 336px;">
										<c:forEach var="cus" items="${ordertopDetails}">
											<li class="feed-item"><c:set var="name"
													value="${cus.name}" /> <c:set var="date"
													value="${cus.date}" /> <c:set var="payment"
													value="${cus.payment}" /><c:set var="subtotal"
													value="${cus.subtotal}" />
												<div class="feed-item-list">
													<p class="text-muted mb-1 font-size-13">
														<small class="d-inline-block ms-1">${cus.date}</small>
													</p>
													<p class="mb-0">${cus.name}<span class="text-danger"> LKR 
															${cus.subtotal}</span><span class="text-primary">
															${cus.payment}</span>
													</p>
												</div></li>
										</c:forEach>
									</ol>
									<div class="mt-3 text-center">
										<a href=orders class="text-primary font-size-14 fw-medium">View
											All Orders <i class="mdi mdi-chevron-right"></i>
										</a>
									</div>
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
									href="https://soengsouy.com/" target="_blank"
									class="text-reset">Maleesha</a>
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
	<!-- apexcharts -->
	<script type="text/javascript"
		src="<spring:url value="/resources/libs/apexcharts/apexcharts.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/js/pages/dashboard.init.js" />"></script>
	<!-- App js -->
	<script type="text/javascript"
		src="<spring:url value="/resources/js/app.js" />"></script>
</body>

</html>