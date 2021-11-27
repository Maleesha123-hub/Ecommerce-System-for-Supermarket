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
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- ----Sweet Alert ------->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>

function refresh(){
	$("#orderdetailtable").empty();
}

	$(document).ready(function() {
		getAllOrderPendingList();

	});

	function getAllOrderPendingList() {
		$('#delivered').show();
		$('#pending').show();
		$('#sendMessage').hide();
		$('#reset').hide();
		var data = "";
		$
				.ajax({
					type : "GET",
					url : "getAllOrderPendingList",
					success : function(response) {
						data = response

						$('.tr').remove();
						for (i = 0; i < data.length; i++) {
							if(data[i].status == "Pending"){
								$("#orderTable")
								.append(
										'<tr class="tr"> <td>'
												+ data[i].orderId
												+ '</td> <td>'
												+ data[i].name
												+ '</td> <td>'
												+ data[i].date
												+ '</td> <td>'
												+ data[i].payment
												+ '</td> <td>'
												+ data[i].subtotal
												+ '</td> <td>'
												+ '<input type="button" class="btn btn-warning btn-sm btn-rounded waves-effect waves-light" onclick="pendingBtn('
												+ data[i].orderId
												+ ')"  value="Pending"></input></td> <td>'
												+ '<input type="button" class="btn btn-danger btn-sm btn-rounded waves-effect waves-light" onclick="cancelOrderBtn('
												+ data[i].orderId
												+ ')"  value="Cancel Order"></input>'
												+ '</td> <td>'
												+ '<input type="button" class="btn btn-primary btn-sm btn-rounded waves-effect waves-light" onclick="refresh();viewOrderDetail('
												+ data[i].orderId
												+ '); viewOrderBtn(' 
												+ data[i].orderId
												+ ')"  value="View Details"></input> </td> </tr>');
								
								}
							else if(data[i].status == "Canceled"){
								$("#ordercanceledTable")
								.append(
										'<tr class="tr"> <td>'
												+ data[i].orderId
												+ '</td> <td>'
												+ data[i].name
												+ '</td> <td>'
												+ data[i].date
												+ '</td> <td>'
												+ data[i].payment
												+ '</td> <td>'
												+ data[i].subtotal
												+ '</td> <td>'
												+ '<input type="button" class="btn btn-secondary btn-sm btn-rounded waves-effect waves-light" onclick="deliveryBtn('
												+ data[i].id
												+ ');" value="Canceled"></input>'
												+ ' </td> <td>'
												+ '<input type="button" class="btn btn-primary btn-sm btn-rounded waves-effect waves-light" onclick="refresh();viewOrderDetail('
												+ data[i].orderId
												+ '); viewCanceledOrderBtn(' 
												+ data[i].orderId
												+ ')"  value="View Details"></input> </td> </tr>');
								}
							else if(data[i].status == "Delivered"){
								$("#orderdeliveredTable")
								.append(
										'<tr class="tr"> <td>'
												+ data[i].orderId
												+ '</td> <td>'
												+ data[i].name
												+ '</td> <td>'
												+ data[i].date
												+ '</td> <td>'
												+ data[i].payment
												+ '</td> <td>'
												+ data[i].subtotal
												+ '</td> <td>'
												+ '<input type="button" class="btn btn-success btn-sm btn-rounded waves-effect waves-light" onclick="deliveryBtn('
												+ data[i].id
												+ ')" value="Delivered"></input></td> <td>'
												+ '<input type="button" class="btn btn-primary btn-sm btn-rounded waves-effect waves-light" onclick="refresh();viewOrderDetail('
												+ data[i].orderId
												+ '); viewDeliveredOrderBtn(' 
												+ data[i].orderId
												+ ')"  value="View Details"></input> </td> </tr>');

								}
						}
					},
					error : function(err) {
						alert("error is" + err)
					}
				});
	}

	function pendingBtn(orderId) {

 		 Swal.fire({
 			  title: 'Are you sure?',
 			  text: "Is this order delivered successfully !",
 			  icon: 'warning',
 			  showCancelButton: true,
 			  confirmButtonColor: '#28a745',
 			  cancelButtonColor: '#d33',
 			  confirmButtonText: 'Yes, Delivered!'
 			}).then((result) => {
 			  if (result.isConfirmed) {
 			    Swal.fire(
 			      'Saved!',
 			      'Order has been delivered.',
			      'success'
 			    )
			    
		$.ajax({
			type : "POST",
			url : "deliveredOrder/" + orderId,
			success : function(response) {
				getAllOrderPendingList();
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
 			 }
			})
	} 

	function cancelOrderBtn(orderId) {

		 Swal.fire({
			  title: 'Are you sure?',
			  text: "Do you want to cancel this Order !",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#095269',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, Cancel!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Canceled!',
			      'Order has been canceled.',
			      'success'
			    )
			    
		$.ajax({
			type : "POST",
			url : "canceledOrder/" + orderId,
			success : function(response) {
				getAllOrderPendingList();
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
			 }
			})
	} 

	function viewOrderBtn(orderId) {
		Swal.fire('You can view order details now....');
		$('#sendMessage').show();
		$('#reset').show();
		$.ajax({
			type : "GET",
			url : "getOneOrder/" + orderId,
			dataType : 'json',
			success : function(response) {

				$("#reply").val("Your order, (OID number : " + response.orderId + ")" + " | " + "(Amount : " + response.subtotal + ") "), 
				$("#name").val(response.name), 
				$("#email").val(response.email), 
				$("#telephone").val(response.telephone), 
				$("#address").val(response.address), 
				$("#date").val(response.date), 
				$("#zip").val(response.zip) 

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}
	
	function viewCanceledOrderBtn(orderId) {
		Swal.fire('You can view order details now....');
		$('#sendMessage').show();
		$('#reset').show();
		$.ajax({
			type : "GET",
			url : "getOneOrder/" + orderId,
			dataType : 'json',
			success : function(response) {

				$("#reply").val("Your order, (OID number : " + response.orderId + ")" + " | " + "(Amount : " + response.subtotal + ")" + " was " + response.status + " by Parakrama Supermarket!"), 
				$("#name").val(response.name), 
				$("#email").val(response.email), 
				$("#telephone").val(response.telephone), 
				$("#address").val(response.address), 
				$("#date").val(response.date), 
				$("#zip").val(response.zip) 

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function viewDeliveredOrderBtn(orderId) {
		Swal.fire('You can view order details now....');
		$('#sendMessage').show();
		$('#reset').show();
		$.ajax({
			type : "GET",
			url : "getOneOrder/" + orderId,
			dataType : 'json',
			success : function(response) {

				$("#reply").val("Your order, (OID number : " + response.orderId + ")" + " | " + "(Amount : " + response.subtotal + ")" + " was " + response.status + " successfully. " + "*** Thank you for dealing with Parakrama Supermarket & Come again! ***"), 
				$("#name").val(response.name), 
				$("#email").val(response.email), 
				$("#telephone").val(response.telephone), 
				$("#address").val(response.address), 
				$("#date").val(response.date), 
				$("#zip").val(response.zip) 

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function sendEmailBtn() {
		$('#sendMessage').hide();
		$('#reset').hide();
		$.ajax({
			type : "POST",
			url : "sendingOrderEmail",
			data : {
				name : $("#name").val(),
				email : $("#email").val(),
				reply : $("#reply").val()
			},
			success : function(result) {
				getAllOrderPendingList();
				$('#admin-orders')[0].reset()
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function cancelEmail() {
		$('#sendMessage').hide();
		$('#reset').hide();
	}


	function viewOrderDetail(orderId) {
		var data = "";
		$
				.ajax({
					type : "GET",
					url : "getAllOrderDetailById/" + orderId,
					success : function(response) {
						data = response

						for (i = 0; i < data.length; i++) {
							$("#orderdetailtable")
									.append(
											'<tr class="tr"> <td>'
													+ data[i].productId
													+ '</td> <td>'
													+ data[i].productname
													+ '</td> <td>'
													+ data[i].quantity
													+ '</td> <td>'
													+ data[i].price 
													+ '</td> </tr>');

						}
					},
					error : function(err) {
						alert("error is" + err)
					}
				});
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
																			<input type="text" class="form-control" id="name"
																				placeholder="Enter name" required="required">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="mb-3 mb-4">
																			<label class="form-label" for="billing-email-address">Email
																				Address</label> <input type="email" class="form-control"
																				id="email" placeholder="Enter email"
																				required="required">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="mb-3 mb-4">
																			<label class="form-label" for="billing-phone">Phone</label>
																			<input type="text" class="form-control"
																				id="telephone" placeholder="Enter Phone no."
																				required="required">
																		</div>
																	</div>
																</div>
																<div class="mb-4">
																	<label class="form-label" for="billing-address">Address</label>
																	<textarea class="form-control" id="address" rows="3"
																		placeholder="Enter full address" required="required"></textarea>
																</div>
																<div class="row">
																	<div class="col-lg-4">
																		<div class="mb-4 mb-lg-0">
																			<label class="form-label" for="billing-city">Date</label>
																			<input type="text" class="form-control" id="date"
																				placeholder="Enter City" required="required">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="mb-0">
																			<label class="form-label" for="zip-code">Zip
																				/ Postal code</label> <input type="text"
																				class="form-control" id="zip"
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
																			class="btn btn-primary waves-effect waves-light me-1"
																			onclick="sendEmailBtn()">Send</button>
																		<button type="reset" id="reset"
																			class="btn btn-secondary waves-effect"
																			onclick="cancelEmail();refresh()">Cancel</button>
																	</div>
																</div>
															</div>
														</form>
														<table id="datatable"
															class="table table-bordered dt-responsive nowrap"
															style="border-collapse: collapse; border-spacing: 0; width: 100%;">
															<thead>
																<tr class="bg-transparent">
																	<th>Product_ID</th>
																	<th>Product_Name</th>
																	<th>Quantity</th>
																	<th>Price</th>
																</tr>
															</thead>
															<tbody id="orderdetailtable">
																<tr>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br> <br>

								<!-- ---------------------END ORDER Fields LOAD AND ANALYS-------------------------------- -->
								<h4>Recent Orders</h4>
								<hr style="background: yellow">
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
															<th>Payment</th>
															<th>Total</th>
															<th>Status</th>
															<th>Cancel Order</th>
															<th>View Details</th>
														</tr>
													</thead>
													<tbody id="orderTable">
														<!-- <tr>
															<td><a href="javascript: void(0);"
																class="text-body fw-bold">#MB2545</a></td>
															<td>Jacob Hunter</td>
															<td>04 Oct, 2019</td>
															<td>$392</td>
															<td>

																<button type="button" id="pending"
																	class="btn btn-warning btn-sm btn-rounded waves-effect waves-light">
																	Pending</button>
																<button type="button" id="delivered"
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
														</tr> -->
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- end table-responsive -->


								<!-- ---------------------END ORDER Canceled LOAD AND ANALYS-------------------------------- -->
								<h4>Canceled Orders</h4>
								<hr style="background: gray">
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
															<th>Payment</th>
															<th>Total</th>
															<th>Status</th>
															<th>View Details</th>
														</tr>
													</thead>
													<tbody id="ordercanceledTable">
														<!-- <tr>
															<td><a href="javascript: void(0);"
																class="text-body fw-bold">#MB2545</a></td>
															<td>Jacob Hunter</td>
															<td>04 Oct, 2019</td>
															<td>$392</td>
															<td>

																<button type="button" id="pending"
																	class="btn btn-warning btn-sm btn-rounded waves-effect waves-light">
																	Pending</button>
																<button type="button" id="delivered"
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
														</tr> -->
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- end table-responsive -->



								<!-- ---------------------END ORDER Deliverd LOAD AND ANALYS-------------------------------- -->
								<h4>Delivered Orders</h4>
								<hr style="background: #28a745">
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
															<th>Payment</th>
															<th>Total</th>
															<th>Status</th>
															<th>View Details</th>
														</tr>
													</thead>
													<tbody id="orderdeliveredTable">
														<!-- <tr>
															<td><a href="javascript: void(0);"
																class="text-body fw-bold">#MB2545</a></td>
															<td>Jacob Hunter</td>
															<td>04 Oct, 2019</td>
															<td>$392</td>
															<td>

																<button type="button" id="pending"
																	class="btn btn-warning btn-sm btn-rounded waves-effect waves-light">
																	Pending</button>
																<button type="button" id="delivered"
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
														</tr> -->
													</tbody>
												</table>
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