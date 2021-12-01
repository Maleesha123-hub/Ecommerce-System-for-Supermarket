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

<meta charset="utf-8">
<title>Parakrama | Add-Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description">
<meta content="Themesbrand" name="author">
<!-- App favicon -->
<link rel="shortcut icon"
	href="<spring:url value="/resources/images/main-icon.png" />">

<!-- Lightbox css -->
<link
	href="<spring:url value="/resources/libs/magnific-popup/magnific-popup.css" />"
	rel="stylesheet" type="text/css">
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>

<!-- Bootstrap Css -->
<link href="<spring:url value="/resources/css/bootstrap.min.css" />"
	id="bootstrap-style" rel="stylesheet" type="text/css">
<!-- Icons Css -->
<link href="<spring:url value="/resources/css/icons.min.css" />"
	rel="stylesheet" type="text/css">
<!-- App Css-->
<link href="<spring:url value="/resources/css/app.min.css" />"
	id="app-style" rel="stylesheet" type="text/css">
<!-- ----Sweet Alert ------->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
	<script>
	 function insertProduct() {
		$('#updatePro').hide();
		$('#saveProduct').show();


		if($("#name").val() == "" || $("#price").val() == "" || $("#category").val() == "" || $("#description").val() == ""){
			//alert("faild");
		}
		else{
		$.ajax({
			type : "POST",
			url : "saveProduct",
			data : {
				id : $("#id").val(),
				name : $("#name").val(),
				price : $("#price").val(),
				category : $("#category").val(),
				description : $("#description").val(),
				image : $("#image").val()
			},
			success : function(result) {
				getAllProRecord();
				$('#admin-user-product')[0].reset()
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
		}
	}

	function getAllProRecord() {
		$('#updatePro').hide();
		$('#saveProduct').show();
		var data = "";
		$
				.ajax({
					type : "GET",
					url : "getAllProduct",
					success : function(response) {
						data = response

						$('.tr').remove();
						for (i = 0; i < data.length; i++) {
							$("#userTable")
									.append(
											'<tr class="tr"> <td>'
													+ data[i].id
													+ '</td> <td>'
													+ data[i].name
													+ '</td> <td>'
													+ data[i].price
													+ '</td> <td>'
													+ data[i].category 
													+ '</td> <td><img src= "https://gdurl.com/'
													+ data[i].image 
													+ '" width="120px" height="120px"></td><td><input type="button" class="btn btn-warning" onclick="editProduct('
													+ data[i].id
													+ ')"  value="Edit"></input></td> <td> <input type="button" class="btn btn-danger" onclick="deleteProductBtn('
													+ data[i].id
													+ ');" value="Delete"></input></td> </tr>');


						}
					},
					error : function(err) {
						alert("error is" + err)
					}
				});
	}

	function editProduct(id) {
		Swal.fire('You can edit product now....');
		$('#updatePro').show();
		$('#saveProduct').hide();
		$.ajax({
			type : "GET",
			url : "getOneProduct/" + id,
			dataType : 'json',
			success : function(response) {

				$("#id").val(response.id), 
				$("#name").val(response.name), 
				$("#price").val(response.price), 
				$("#category").val(response.category), 
				$("#description").val(response.description), 
				$("#image").val(response.image) 

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function updateProductbtn() {
	    Swal.fire('Product Updated!', '', 'success')
		$.ajax({
			type : "POST",
			url : "updateProduct",
			data : {
				id : $("#id").val(),
				name : $("#name").val(),
				price : $("#price").val(),
				category : $("#category").val(),
				description : $("#description").val(),
				image : $("#image").val()
			},
			success : function(result) {
				getAllProRecord();
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function deleteProductBtn(id) {

		 Swal.fire({
			  title: 'Are you sure?',
			  text: "Do you want to delete product !",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#095269',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deleted!',
			      'Product has been deleted.',
			      'success'
			    )
			    
		$.ajax({
			type : "POST",
			url : "deleteProduct/" + id,
			success : function(response) {
				getAllProRecord();
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


<body onload="getAllProRecord()">
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
							class="d-none d-xl-inline-block ms-1 fw-medium font-size-15">
							${adminName}</span> <i
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
			</div>
		</div>
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
								<h4 class="mb-0">Add Product</h4>

								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Ecommerce</a></li>
										<li class="breadcrumb-item active">Add Product</li>
									</ol>
								</div>

							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title mb-4"></h4>
								<div>
									<a class="popup-form btn btn-primary" href="#test-form">+
										Add Product</a>
								</div>

								<div class="card mfp-hide mfp-popup-form mx-auto" id="test-form">
									<div class="card-body">
										<h4 class="mb-4">Product Form</h4>
									<form id="productForm" name="productForm">
											<div class="row">
												<div class="col-lg-4">
													<div class="mb-3">
														<label class="form-label" for="productname">Product
															ID</label> <input id="id" name="id" value="0" type="text"
															class="form-control" readonly>
													</div>
												</div>
												<div class="col-lg-4">
													<div class="mb-3">
														<label class="form-label" for="productname">Product
															Name</label> <input id="name" name="name" type="text"
															class="form-control" required="required">
													</div>
												</div>
												<div class="col-lg-4">
													<div class="mb-3">
														<label class="form-label" for="price">Price</label> <input
															id="price" name="price" id="price" type="number"
															class="form-control" required="required">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="mb-3">
														<label class="form-label" class="control-label">Category</label>
														<select class="form-control select2" id="category"
															name="category">
															<option>Select</option>
															<option value="Fruit">Fruit</option>
															<option value="Vegitable">Vegitable</option>
															<option value="Meat">Meat</option>
															<option value="Beauty">Beauty Picks</option>
															<option value="Home Ware">Home Ware</option>
															<option value="Electronics">Electronics</option>
														</select>
													</div>
												</div>

											</div>
											<div class="mb-0">
												<label class="form-label" for="productdesc">Product
													Description</label>
												<textarea class="form-control" id="description"
													name="description" rows="4" required="required"></textarea>
											</div>
											<br>
											<div class="flex-grow-1 overflow-hidden">
												<h5 class="font-size-16 mb-1">Product Image</h5>
											</div>
											<input name="image" type="file" id="image"> <br>
											<div class="row">
												<div class="col-lg-12">
													<div class="text-end">
														<button type="submit" class="btn btn-primary w-md"
															id="saveProduct" onclick="insertProduct()">
															<!-- onclick="insertProduct()"-->
															Submit
														</button>
														<button type="submit" class="btn btn-primary2 w-md update"
															id="updatePro" onclick="updateProductbtn()">Update</button>
													</div>
												</div>
											</div>
											<br>
										</form>
									</div>
								</div>

								<!-- end row-->
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-body">
												<!-- -----------------------TABLE CONTENT--------------------- -->
												<h1 align="center">All PRODUCTS</h1>
												<br>
												<!-- 	<table
											class="table table-editable table-nowrap align-middle table-edits"> -->
												<div class="table-rep-plugin">
													<div class="table-responsive mb-0"
														data-pattern="priority-columns">
														<table id="tech-companies-1" class="table">
															<thead>
																<tr>
																	<th>ID</th>
																	<th>PRODUCT NAME</th>
																	<th>PRICE</th>
																	<th>CATEGORY</th>
																	<th>IMAGE</th>
																	<th>EDIT</th>
																	<th>DELETE</th>
																</tr>
															</thead>
															<tbody id="userTable">
																<tr data-id="1">
																	<td data-field="id" style="width: 80px"></td>
																	<td data-field="name"></td>
																	<td data-field="qty"></td>
																	<td data-field="price"></td>
																	<td data-field="category"></td>
																	<td data-field="image"></td>
																	<td style="width: 100px"></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- -----------------------END TABLE CONTENT--------------------- -->
								<!-- container-fluid -->
								<!------------------end table-responsive--------------------->

							</div>
						</div>
					</div>
					<!-- end row -->
				</div>
				<!-- container-fluid -->
			</div>
			<!-- End Page-content -->
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

	<!-- Magnific Popup-->
	<script
		src="<spring:url value="/resources/libs/magnific-popup/jquery.magnific-popup.min.js" />"></script>

	<!-- lightbox init js-->
	<script
		src="<spring:url value="/resources/js/pages/lightbox.init.js" />"></script>

	<!-- App js -->
	<script src="<spring:url value="/resources/js/app.js" />"></script>

</body>
</html>
