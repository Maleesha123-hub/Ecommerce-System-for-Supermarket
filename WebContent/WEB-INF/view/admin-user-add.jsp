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
<title>Parakrama | Add-User</title>
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
<!-- ----Sweet Alert ------->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<script>
	function insertUser() {
			    $('#updateUser').hide();
				$('#saveUser').show();
				
				if($("#fname").val() == "" || $("#lname").val() == "" || $("#uname").val() == "" || $("#position").val() == "" || $("#email").val() == "" || $("#password").val() == ""){
					//alert("faild");
				}
				else{

					$.ajax({
								type : "POST",
								url : "saveUser",
								data : {
									id : $("#id").val(),
									fname : $("#fname").val(),
									lname : $("#lname").val(),
									uname : $("#uname").val(),
									position : $("#position").val(),
									email : $("#email").val(),
									password : $("#password").val()

								},
								success : function(result) {
									getAllrecord()
								    Swal.fire('Saved!', '', 'success')
								},
								error : function(err) {
									alert("error is" + err)
								}
							});
			}
	}

	function getAllrecord() {
		$('#updateUser').hide();
		$('#saveUser').show();
		$('#upbtn').hide();
		var data = "";
		$
				.ajax({
					type : "GET",
					url : "getAllUser",
					success : function(response) {
						data = response

						$('.tr').remove();
						for (i = 0; i < data.length; i++) {
							$("#userTable")
									.append(
											'<tr class="tr"> <td>'
													+ data[i].id
													+ '</td> <td>'
													+ data[i].fname
													+ " "
													+ data[i].lname
													+ '</td> <td>'
													+ data[i].position
													+ '</td> <td>'
													+ data[i].email
													+ '</td> <td><input type="button" id="upbtn" class="btn btn-warning" onclick="editUser('
													+ data[i].id
													+ ')"  value="Edit"></input></td> <td> <input type="button" class="btn btn-danger" onclick="deleteUserBtn('
													+ data[i].id
													+ ');" value="Delete"></input></td> </tr>');

						}
					},
					error : function(err) {
						alert("error is" + err)
					}
				});
	}

	function editUser(id) {
		Swal.fire('You can edit user now....');
		$('#updateUser').show();
		$('#saveUser').hide();
		$.ajax({
			type : "GET",
			url : "getOneUser/" + id,
			dataType : 'json',
			success : function(response) {

				$("#id").val(response.id), 
				$("#fname").val(response.fname), 
				$("#lname").val(response.lname),
				$("#uname").val(response.uname),
				$("#position").val(response.position),
				$("#email").val(response.email)
				$("#password").val(response.password)

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function updateUserbtn() {
		if($("#fname").val() == "" || $("#lname").val() == "" || $("#uname").val() == "" || $("#position").val() == "" || $("#email").val() == "" || $("#password").val() == ""){
			//alert("faild");
		}else{

			$.ajax({
				type : "POST",
				url : "updateUser",
				data : {
					id : $("#id").val(),
					fname : $("#fname").val(),
					lname : $("#lname").val(),
					uname : $("#uname").val(),
					position : $("#position").val(),
					email : $("#email").val(),
					password : $("#password").val()
				},
				success : function(result) {
					$('#admin-user-add')[0].reset();
				},
				error : function(err) {
					alert("error is" + err)
				}
			}); 
		    Swal.fire('User Updated!', '', 'success');
			}
	}


	function deleteUserBtn(id) {
		 Swal.fire({
			  title: 'Are you sure?',
			  text: "Do you want to delete user !",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#095269',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deleted!',
			      'User has been deleted.',
			      'success'
			    )
			    
		$.ajax({
			type : "POST",
			url : "deleteUser/" + id,
			success : function(response) {

				getAllrecord();
				
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
	
	</script>


</head>

<body onload="getAllrecord()">
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
								<h4 class="mb-0">Add User / Admin</h4>
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item active">Add User / Admin</li>
									</ol>
								</div>
							</div>
						</div>
					</div>

					<!-- end row -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<!---------------------------------->
									<div class="col-lg-5">
										<div class="mt-4">
											<form id="userForm" name="userForm">
												<div class="mb-3">
													<label class="form-label" for="formrow-firstname-input">ID</label>
													<input type="text" class="form-control" value="0" id="id"
														name="id" readonly>
												</div>
												<div class="mb-3">
													<label class="form-label" for="formrow-firstname-input">First
														name</label> <input type="text" class="form-control" id="fname"
														name="fname" required>
												</div>
												<div class="mb-3">
													<label class="form-label" for="formrow-firstname-input">Last
														name</label> <input type="text" class="form-control" id="lname"
														name="lname" required>
												</div>
												<div class="mb-3">
													<label class="form-label" for="formrow-firstname-input">User
														name</label> <input type="text" class="form-control" id="uname"
														name="uname" required>
												</div>
												<div class="mb-3">
													<label class="form-label" for="formrow-firstname-input">Position</label>
													<input type="text" class="form-control" id="position"
														name="position" required>
												</div>
												<div class="mb-3">
													<label class="form-label" for="formrow-email-input">Email</label>
													<input type="email" class="form-control" id="email"
														name="email" required>
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="mb-3">
															<label class="form-label" for="formrow-password-input">Password</label>
															<input type="password" class="form-control" id="password"
																name="password" required>
														</div>
														<div class="form-check">
															<input type="checkbox" name="" class="form-check-input"
																id="auth-remember-check" onclick="myFunction()">
															<label class="form-check-label" for="auth-remember-check">Show
																Password</label>
														</div>
														<script>
										function myFunction() {
											var x = document
													.getElementById("password");
											if (x.type === "password") {
												x.type = "text";
											} else {
												x.type = "password";
											}
										}
									</script>
													</div>

												</div>
												<div class="mt-4">
													<button type="submit" class="btn btn-primary w-md"
														id="saveUser" onclick="insertUser()">Submit</button>
													<button type="submit" class="btn btn-primary2 w-md update"
														id="updateUser" onclick="updateUserbtn()">Update</button>
												</div>
											</form>
										</div>
									</div>
									<br> <br>


									<!-- -----------------------TABLE CONTENT--------------------- -->
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-body">
													<table id="datatable"
														class="table table-bordered dt-responsive nowrap"
														style="border-collapse: collapse; border-spacing: 0; width: 100%;">
														<!-- <div class="table-responsive"> -->
														<h1 align="center">All USERS</h1>
														<br>
														<thead>
															<tr>
																<th>ID</th>
																<th>FULL NAME</th>
																<th>POSITION</th>
																<th>EMAIL</th>
																<th>EDIT</th>
																<th>DELETE</th>
															</tr>
														</thead>
														<tbody id="userTable">
															<tr data-id="1">
																<td data-field="id" style="width: 80px"></td>
																<td data-field="fullname"></td>
																<td data-field="position"></td>
																<td data-field="email"></td>
																<td style="width: 100px"></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<!-- -----------------------END TABLE CONTENT--------------------- -->
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
	<!-- App js -->
	<script type="text/javascript"
		src="<spring:url value="/resources/js/app.js" />"></script>
</body>

</html>