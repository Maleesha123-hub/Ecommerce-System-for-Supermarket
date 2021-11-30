<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Entity.SalesAnalytics"%>
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
<title>Parakrama | Reports</title>
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



<script>
	$(document).ready(function() {
		$('#saveinfo').hide();
		$('#savbtn').hide();
	});

	function calculatesale() {

		if ($("#expendvalue").val() == "") {
			//get INCOME
			$("#expendvalue").val(0.0)
		} else {
			$.ajax({
				type : "POST",
				url : "salesbetweendates",
				dataType : 'json',
				success : function(response) {

					$('#savbtn').show();
					$('#saveinfo').show();

					//get SALES
					$("#sales").val(response.sales),
					//get CANCELED
					$("#canceled").val(response.canceled),
					//get INCOME
					$("#income").val(response.income)

				},
				data : {
					fromdate : $("#fromdate").val(),
					todate : $("#todate").val(),
					expenditure : $("#expendvalue").val()
				},
				error : function(err) {
					alert("error is" + err)
				}
			});
		}
	}

	function insertsale() {
		Swal.fire({
			  title: 'Do you want to save the sales analytics info.?',
			  showDenyButton: true,
			  showCancelButton: true,
			  confirmButtonText: 'Save',
			  denyButtonText: `Don't save`,
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
					$('#saveinfo').hide();
			    Swal.fire('Saved!', '', 'success')

			    $.ajax({
					type : "POST",
					url : "saveSales",
					data : {
						fromdate : $("#fromdate").val(),
						todate : $("#todate").val(),
						expenditure : $("#expendvalue").val(),
						sales : $("#sales").val(),
						canceled : $("#canceled").val(),
						income : $("#income").val()
					},
					success : function(result) {
					
					},
					error : function(err) {
						alert("error is" + err)
					}
				});

				$('#savbtn').hide();

			    
			  } else if (result.isDenied) {
			    Swal.fire('Sales analytics .info are not saved', '', 'info')
			  }
			})
	}
</script>




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
								<h4 class="mb-0">Reports</h4>

								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Tables</a></li>
										<li class="breadcrumb-item active">Reports</li>
									</ol>
								</div>

							</div>
						</div>
					</div>
					<!-- end page title -->


					<!-- end row -->
					<!---------------------------End Customer Report---------------------------- -->



					<h4 class="my-3">Sales Analytics</h4>

					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<ul class="list-inline main-chart mb-0">
									<li class="list-inline-item chart-border-left me-0 border-0">
										<h3 class="text-primary">
											<span class="text-muted d-inline-block font-size-15 ms-3"
												id="Income">Sales <br>/ Income
											</span> LKR &nbsp;&nbsp;<input type="text" value="0.0" id="income"
												style="color: #5b73e8; border: none; width: 150px">
										</h3>
									</li>

									<li class="list-inline-item chart-border-left me-0">
										<h3>
											<span class="text-muted d-inline-block font-size-15 ms-3"
												id="Sales">Sales
												<p style="color: #20c02d">(Orders)</p>
											</span>&nbsp;&nbsp; <input type="text" value="0" id="sales"
												style="color: #20c02d; border: none; width: 150px">
										</h3>
									</li>
									<li class="list-inline-item chart-border-left me-0">
										<h3>
											<span class="text-muted d-inline-block font-size-15 ms-3"
												id="Canceled">Canceled
												<p style="color: red">(Orders)</p>
											</span>&nbsp;&nbsp; <input type="text" value="0" id="canceled"
												style="color: red; border: none; width: 150px">
										</h3>
									</li>
								</ul>
								<hr style="color: #bdbdbd; height: 5px">
								<form>
									<div class="mb-3 row">
										<label for="example-date-input"
											class="col-md-2 col-form-label">FROM :</label>
										<div class="col-md-10">
											<input class="form-control" type="date" value="2019-08-19"
												id="fromdate" name="fromdate">
										</div>
									</div>
									<div class="mb-3 row">
										<label for="example-date-input"
											class="col-md-2 col-form-label">TO :</label>
										<div class="col-md-10">
											<input class="form-control" type="date" value="2019-08-19"
												id="todate" name="todate">
										</div>
									</div>
									<div class="row">
										<label for="exampleDataList" class="col-md-2 col-form-label">EXPENDITURE
											:</label>
										<div class="col-md-10">
											<input class="form-control" type="number" id="expendvalue"
												name="expendvalue" placeholder="0.0" required="required"
												value=0.0>
										</div>
									</div>
									<br>
									<button type="button" type="submit"
										class="btn btn-outline-dark btn-sm"
										style="margin-right: 0; margin-left: auto; display: block"
										id="calbtn" onclick="calculatesale()">CALCULATE</button>

									<a href="getAllSalesList" target="_blank">
										<button type="button" class="btn btn-outline-success btn-sm">Go To Report</button>
									</a> <small id="saveinfo"
										style="display: flex; color: red; justify-content: right; align-items: baseline; width: 300px">You
										can save information now!</small>

									<button type="button" class="btn btn-primary btn-sm"
										style="margin-right: 0; margin-left: auto; display: block"
										id="savbtn" onclick="insertsale()">SAVE</button>
								</form>


								<hr style="color: #bdbdbd; height: 5px">

							</div>
						</div>
					</div>
					<!-- end col -->

					<div class="row">
						<div class="col-sm-12">
							<h4 class="my-3">Reports Section</h4>
							<div class="row" data-masonry='{"percentPosition": true }'>
								<div class="col-sm-6 col-lg-4">
									<div class="card">
										<a href="customerreport" target="_blank"> <img
											src="<spring:url value="/resources/images/small/customer.png" />"
											class="card-img-top" alt="..." height="200px"></a>
										<div class="card-body">
											<h5 class="card-title">Customers Report</h5>
											<p class="card-text">Customers report include all the
												details name, email, shipping details..etc.</p>
										</div>
									</div>
								</div>

								<div class="col-sm-6 col-lg-4">
									<div class="card">
										<a href="orderreport" target="_blank"> <img
											src="<spring:url value="/resources/images/small/order.jpg" />"
											class="card-img-top" alt="..." height="200px"></a>
										<div class="card-body">
											<h5 class="card-title">Orders Report</h5>
											<p class="card-text">Orders report include all the
												details order produts, total, sutotal, orderid,
												date/time..etc.</p>
										</div>
									</div>
								</div>

								<div class="col-sm-6 col-lg-4">
									<div class="card">
										<a href="productreport" target="_blank"> <img
											src="<spring:url value="/resources/images/small/product2.png" />"
											class="card-img-top" alt="..." height="200px"></a>
										<div class="card-body">
											<h5 class="card-title">Products Report</h5>
											<p class="card-text">Products report include all the
												details name, description, price, image..etc.</p>
										</div>
									</div>
								</div>
							</div>
							<!-- end row -->
						</div>
						<!-- end col -->
					</div>

					<!-- End Page-content -->
					<footer class="footer">
						<div class="container-fluid">
							<div class="row">
								<div class="col-sm-6">
									<script>
										document
												.write(new Date().getFullYear())
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
		<script
			src="<spring:url value="/resources/libs/jszip/jszip.min.js" />"></script>
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
