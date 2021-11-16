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
<title>Parakrama | Inbox-Messages</title>
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
<!-- ----Sweet Alert ------->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
<script src="https://code.iconify.design/2/2.0.3/iconify.min.js"></script>


<script>
	function getAllMessage() {
		$('#sendMessage').hide();
		$('#reset').hide();
		var data = "";
		$
				.ajax({
					type : "GET",
					url : "getAllMessage",
					success : function(response) {
						data = response

						$('.tr').remove();
						for (i = 0; i < data.length; i++) {
							$("#messageTable")
									.append(
											'<tr class="tr"> <td>'
													+ data[i].id
													+ '</td> <td>'
													+ data[i].name
													+ '</td> <td>'
													+ data[i].email
													+ '</td> <td>'
													+ data[i].message
													+ '</td> <td>'
													+ data[i].publishedDate
													+ '</td> <td><input type="button" class="btn btn-success" onclick="readMessage('
													+ data[i].id
													+ ')"  value="Read"></input></td> <td> <input type="button" class="btn btn-danger" onclick="deleteMessageBtn('
													+ data[i].id
													+ ');" value="Delete"></input></td> </tr>');

						}
					},
					error : function(err) {
						alert("error is" + err)
					}
				});
	}

	function readMessage(id) {
		Swal.fire('You can read message now....');
		$('#sendMessage').show();
		$('#reset').show();
		$.ajax({
			type : "GET",
			url : "readMessage/" + id,
			dataType : 'json',
			success : function(response) {

				$("#id").val(response.id), $("#name").val(response.name), $(
						"#email").val(response.email), $("#message").val(
						response.message), $("#publishedDate").val(response.publishedDate)
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function deleteMessageBtn(id) {
		Swal.fire({
			  title: 'Are you sure?',
			  text: "Do you want to delete message !",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#095269',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deleted!',
			      'Message has been deleted.',
			      'success'
			    )
		$.ajax({
			type : "POST",
			url : "deleteMessage/" + id,
			success : function(response) {
				getAllMessage();
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
			  }
			})
	}

	$(document).ready(function() {

	});

	function sendEmailBtn() {
		$('#sendMessage').hide();
		$('#reset').hide();
		$.ajax({
			type : "POST",
			url : "sendingEmail",
			data : {
				name : $("#name").val(),
				email : $("#email").val(),
				message : $("#message").val(),
				reply : $("#reply").val()
			},
			success : function(result) {
				getAllMessage();
				$('#admin-message')[0].reset()
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}
</script>

</head>

<body onload="getAllMessage()">
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
				<!--  
				<div class="d-flex">
					<div class="dropdown d-inline-block">
						<button type="button"
							class="btn header-item noti-icon waves-effect"
							id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<i class="uil-bell"></i> <span
								class="badge bg-danger rounded-pill">3</span>
						</button>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
							aria-labelledby="page-header-notifications-dropdown">
							<div class="p-3">
								<div class="row align-items-center">
									<div class="col">
										<h5 class="m-0 font-size-16">Notifications</h5>
									</div>
									<div class="col-auto">
										<a href="#!" class="small"> Mark all as read</a>
									</div>
								</div>
							</div>
							<div data-simplebar style="max-height: 230px;">
								<a href="" class="text-reset notification-item">
									<div class="d-flex align-items-start">
										<div class="flex-shrink-0 me-3">
											<div class="avatar-xs">
												<span
													class="avatar-title bg-primary rounded-circle font-size-16">
													<i class="uil-shopping-basket"></i>
												</span>
											</div>
										</div>
										<div class="flex-grow-1">
											<h6 class="mb-1">Your order is placed</h6>
											<div class="font-size-12 text-muted">
												<p class="mb-1">If several languages coalesce the
													grammar</p>
												<p class="mb-0">
													<i class="mdi mdi-clock-outline"></i> 3 min ago
												</p>
											</div>
										</div>
									</div>
								</a>
							</div>
							<div class="p-2 border-top">
								<div class="d-grid">
									<a class="btn btn-sm btn-link font-size-14 text-center"
										href="javascript:void(0)"> <i
										class="uil-arrow-circle-right me-1"></i> View More..
									</a>
								</div>
							</div>
						</div> 
				</div>
						-->
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
							<h4 class="mb-0">Messages</h4>
							<div class="page-title-right">
								<ol class="breadcrumb m-0">
									<li class="breadcrumb-item active">Messages</li>
								</ol>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xl-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Read Message</h4>
								<br>

								<form class="custom-validation">
									<div class="mb-3">
										<label class="form-label">Customer Name</label> <input
											type="text" class="form-control" required id="name"
											placeholder="Enter customer name" />
									</div>
									<div class="mb-3">
										<label class="form-label">E-Mail</label>
										<div>
											<input type="email" class="form-control" required
												parsley-type="email" id="email"
												placeholder="Enter a valid e-mail" />
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label">Date & Time</label>
										<div>
											<input type="timestamp" class="form-control" required
												id="publishedDate" placeholder="Enter date & time" />
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label">Message</label>
										<div>
											<textarea required class="form-control" rows="5" id="message"
												placeholder="message....."></textarea>
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label">Reply</label>
										<div>
											<textarea required class="form-control" rows="5" id="reply"
												placeholder="reply....."></textarea>
										</div>
									</div>
									<div>
										<div>
											<button type="submit" id="sendMessage"
												class="btn btn-primary waves-effect waves-light me-1"
												onclick="sendEmailBtn()">Send</button>
											<button type="reset" id="reset"
												class="btn btn-secondary waves-effect">Cancel</button>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
					<!-- end col -->


					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<!---------------------------------->
									<div class="col-lg-5">
										<div class="mt-4"></div>
									</div>
									<br>
									<!-- -----------------------TABLE CONTENT--------------------- -->
									<table id="datatable"
										class="table table-bordered dt-responsive nowrap"
										style="border-collapse: collapse; border-spacing: 0; width: 100%;">
										<h1 align="center">CUSTOMER'S MESSAGES</h1>
										<br>
										<br>
										<thead>
											<tr>
												<th>ID</th>
												<th>CUSTOMER NAME</th>
												<th>EMAIL</th>
												<th>MEASSEGE</th>
												<th>DATE/TIME</th>
												<th>READ</th>
												<th>DELETE</th>
											</tr>
										</thead>
										<tbody id="messageTable">
											<tr data-id="1">
											</tr>
										</tbody>
									</table>
								</div>
								<!-- -----------------------END TABLE CONTENT--------------------- -->


							</div>
						</div>
					</div>
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
													document.write(new Date()
															.getFullYear())
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
	<!-- apexcharts -->
	<script
		src="<spring:url value="/resources/libs/apexcharts/apexcharts.min.js" />"></script>
	<script
		src="<spring:url value="/resources/js/pages/dashboard.init.js" />">
	<!-- App js -->
		< script
		src = "<spring:url value="/resources/js/app.js" />">
	</script>

	<!-- parsleyjs -->
	<script
		src="<spring:url value="/resources/libs/parsleyjs/parsley.min.js" />"></script>
	<script
		src="<spring:url value="/resources/js/pages/form-validation.init.js" />"></script>


</body>

</html>