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
<title>Checkout | Parakrama</title>
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript"
	src="https://www.paypal.com/sdk/js?client-id=........"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/multislider.min.js" />"></script>


<script type="text/javascript">
	paypal.Buttons({
		createOrder : function(data, actions) {
			// specify order details...
		},

		onApprove : function(data, actions) {
			// payment approved...
		},
		onCancel : function(data) {
			// customer cancelled...
		},
		onError : function(err) {
			//error that prevents customer from checkout
		}
	}).render('#paypal-button-container'); // Display payment options on your web page
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Ensures optimal rendering on mobile devices. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Optimal Internet Explorer compatibility -->

<style>
h1 {
	width: 500px;
	margin: 0 auto;
	text-align: center;
	color: #f85858;
}

hr {
	width: 1200;
	color: red;
}
</style>


</head>

<body>
<body style="background: white">


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

	<br>
	<div class="container-fluid">
		<!--------------------------- Customer Report---------------------------- -->
		<br>
		<h1>Requesting a Quote</h1>
		<hr size="15">

		<div class="row">
			<div class="col-12">
				<div
					class="page-title-box d-flex align-items-center justify-content-between">
					<h4 class="mb-0" style="color: white">Checkout</h4>
					<div class="page-title-right">
						<ol class="breadcrumb m-0">
							<li class="breadcrumb-item"><a href="javascript: void(0);">Ecommerce</a></li>
							<li class="breadcrumb-item active">Checkout</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<!-- end page title -->
		<div class="row">
			<div class="col-xl-8">
				<div class="custom-accordion">
					<div class="card">
						<a href="#checkout-billinginfo-collapse" class="text-dark"
							data-bs-toggle="collapse">
							<div class="p-4">
								<div class="d-flex align-items-center">
									<div class="flex-shrink-0 me-3">
										<i class="uil uil-receipt text-primary h2"></i>
									</div>
									<div class="flex-grow-1 overflow-hidden">
										<h5 class="font-size-16 mb-1">Billing Info</h5>
										<p class="text-muted text-truncate mb-0">Name email phone
											zip/postal allow to enter</p>
									</div>
									<div class="flex-shrink-0">
										<i class="mdi mdi-chevron-up accor-down-icon font-size-24"></i>
									</div>
								</div>
							</div>
						</a>
						<div id="checkout-billinginfo-collapse" class="collapse show">
							<div class="p-4 border-top">
								<c:forEach var="cus" items="${userDetail}">

									<c:set var="id" value="${cus.id}" />
									<c:set var="fname" value="${cus.fname}" />
									<c:set var="lname" value="${cus.lname}" />
									<c:set var="email" value="${cus.email}" />
									<c:set var="email" value="${cus.phone}" />
									<c:set var="email" value="${cus.postal}" />
									<c:set var="houseno" value="${cus.houseno}" />
									<c:set var="streetname" value="${cus.streetname}" />
									<c:set var="streetname" value="${cus.cityname}" />
									<form>
										<div>
											<div class="row">
												<div class="col-lg-4">
													<div class="mb-3 mb-4">
														<label class="form-label" for="billing-name">Name</label>
														<input type="text" class="form-control" id="billing-name"
															placeholder="Enter name"
															value="${cus.fname} ${cus.lname}">
													</div>
												</div>
												<div class="col-lg-4">
													<div class="mb-3 mb-4">
														<label class="form-label" for="billing-email-address">Email
															Address</label> <input type="email" class="form-control"
															id="billing-email-address" placeholder="Enter email"
															value="${cus.email}">
													</div>
												</div>
												<div class="col-lg-4">
													<div class="mb-3 mb-4">
														<label class="form-label" for="billing-phone">Phone</label>
														<input type="text" class="form-control" id="billing-phone"
															placeholder="Enter Phone no." value="${cus.phone}">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-4">
													<div class="mb-0">
														<label class="form-label" for="zip-code">Zip /
															Postal code</label> <input type="text" class="form-control"
															id="zip-code" placeholder="Enter Postal code"
															value="${cus.postal}">
													</div>
												</div>
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="card">
						<a href="#checkout-shippinginfo-collapse"
							class="collapsed text-dark" data-bs-toggle="collapse">
							<div class="p-4">
								<div class="d-flex align-items-center">
									<div class="flex-shrink-0 me-3">
										<i class="uil uil-truck text-primary h2"></i>
									</div>
									<div class="flex-grow-1 overflow-hidden">
										<h5 class="font-size-16 mb-1">Shipping Info</h5>
										<p class="text-muted text-truncate mb-0">City street home
											noallow to enter</p>
									</div>
									<div class="flex-shrink-0">
										<i class="mdi mdi-chevron-up accor-down-icon font-size-24"></i>
									</div>
								</div>
							</div>
						</a>
						<div id="checkout-shippinginfo-collapse" class="collapse">
							<div class="p-4 border-top">
								<h5 class="font-size-14 mb-3">Shipping Info</h5>
								<div class="row">
									<div class="col-lg-4 col-sm-6">
										<div class="card border rounded active shipping-address">
											<div class="card-body">
												<a href="#" class="float-end ms-1" data-bs-toggle="tooltip"
													data-placement="top" title="Edit"> <i
													class="uil uil-pen font-size-16"></i>
												</a>
												<c:forEach var="cus" items="${userDetail}">
													<c:set var="houseno" value="${cus.houseno}" />
													<c:set var="streetname" value="${cus.streetname}" />
													<c:set var="streetname" value="${cus.cityname}" />
													<h5 class="font-size-14 mb-4">Address</h5>
													<h5 class="font-size-14">${cus.houseno}
														${cus.streetname}</h5>
													<p class="mb-0">${cus.cityname}</p>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row my-4">
					<div class="col">
						<div class="text-end mt-2 mt-sm-0">
							<a href="#">
								<button type="button" class="btn btn-primary" style="font-size: 16px">Cash On
									Delivary</button>
							</a> <a href="#">
								<button type="button" class="btn btn-danger" style="font-size: 16px">Cancel Order...</button>
							</a>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row-->
			</div>
			<div class="col-xl-4">
				<div class="card checkout-order-summary">
					<div class="card-body">
						<div class="p-3 bg-light mb-4">
							<h5 class="font-size-16 mb-0">
								Order Summary <span class="float-end ms-2">#MN0124</span>
							</h5>
						</div>
						<div class="table-responsive">
							<table class="table table-centered mb-0 table-nowrap">
								<thead>
									<tr>
										<th class="border-top-0" style="width: 110px;" scope="col">Product</th>
										<th class="border-top-0" scope="col">Product Qty</th>
										<th class="border-top-0" scope="col">Subtotal</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Nike N012 Running Shoes</th>
										<td>
											<p class="text-muted mb-0">LKR 260 x 2</p>
										</td>
										<td>LKR 520</td>
									</tr>
									<tr class="bg-light">
										<td colspan="2">
											<h5 class="font-size-14 m-0">Total:</h5>
										</td>
										<td>LKR <%
											out.print(proItemSubTotal);
										%></td>
									</tr>
								</tbody>
							</table>
							<br>
							<!------------------------ PAYPAL BUTTON -------------------------->

							<script
								src="https://www.paypal.com/sdk/js?client-id=YOUR_CLIENT_ID">
								// Required. Replace YOUR_CLIENT_ID with your sandbox client ID.
							</script>
							<script>
								// This function displays Smart Payment Buttons on your web page.
								paypal.Buttons().render(
										'#paypal-button-container');
							</script>
							<div id="paypal-button-container"></div>
							<!------------------------ PAYPAL BUTTON END-------------------------->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content">
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
								href="" target="_blank" class="text-reset">Maleesha</a>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- end main content-->
	</div>
	<!-- END layout-wrapper -->
	<script src="<spring:url value="/resources/js/script.js" />"></script>
	<script src="<spring:url value="/resources/shopping-cart.js" />"></script>

	<script
		src="https://www.paypal.com/sdk/js?client-id=AfnkTohqsH1-_GA6ywZZvaz6nTjKy9LHUz_MGhpwJsaaCR44pqAl1M68qhWnFztEigGyPrW0TKmoOU4d">
		// Required. Replace YOUR_CLIENT_ID with your sandbox client ID.
	</script>
	<script>
		const tt = countTheSumPrice();
		console.log(tt);
		paypal
				.Buttons(
						{
							createOrder : function(data, actions) {
								// This function sets up the details of the transaction, including the amount and line item details.
								return actions.order
										.create({
											intent : 'CAPTURE',
											payer : {
												name : {
													given_name : 'Maleesha',
													surname : 'Sandakalum'
												},
											},
											purchase_units : [ {
												amount : {
													value :
	<%out.print(proItemSubTotal);%>
		}
											} ]
										});
							},

							onApprove : function(data, actions) {
								//payment approved
								return actions.order
										.capture()
										.then(
												function(details) {
													console.log(details);
													orderId = details.id;
													status = details.status;
													update_time = details.update_time;

													<%-- alert("Thanks for making payment!!!! Order ID: "
															+ orderId
															/* + " status: "
															+ status */
															+ " update_time :"
															+ update_time
															+ " Amount :"
															+
	<%out.print(proItemSubTotal);%>
		); --%>

													Swal
															.fire('*** Payment Successfully! ***'
																	+'<br>'
																	+'Order ID:'
																	+ orderId
																	/* + " status: "
																	+ status 
																	+ " update_time :"
																	+ update_time*/
																	+'<br>'
																	+ " Amount : LKR"
																	+<%out.print(proItemSubTotal);%>)

												});

							},

							//payment cancelled
							onCancel : function(data) {
							/* 	alert("Payment Cancelled !!!"); */
								Swal.fire({
									  icon: 'error',
									  title: 'Payment Failed!',
									})
							},
							onError : function(err) {
								alert("Something Wrong with informations !!!"); 
							}
						}).render('#paypal-button-container');

		/* intent : 'CAPTURE', // capture payment from buyer
		payer : {
			name : {
				given_name : "Maleesha",
				surname : "Sandakalum"
			},
			address : {
				address_line_1 : "Wathumulla",
				address_line_2 : "Gampaha",
				admin_area_2 : "SLanka",
				admin_area_1 : "Srilanka",
				postal_code : "11000",
				country_code : "Gampaha"
			},
			email_address : "maleesha1103@gmail.com",
			phone : {
				phone_type : "MOBILE",
				phone_number : {
					national_number : "199930811810"
				}
			}
		}, */
	</script>


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