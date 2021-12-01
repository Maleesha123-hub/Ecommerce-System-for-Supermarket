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
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account page - Parakrama</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css" />">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/multislider.min.js" />"></script>
<!-- ----Sweet Alert ------->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<style>

/*-----------------Cart Button-------------*/
nav a {
	text-decoration: none;
	color: #555;
	font-weight: 400;
}

.product-card-button-container {
	padding-top: 1.5625rem;
}

.col-md-12 {
	position: relative;
	padding-right: 15px;
	padding-left: 15px;
	-webkit-flex: 0 0 100%;
	flex: 0 0 100%;
	max-width: 70%;
}

.product-card-container {
	text-align: center;
	letter-spacing: .01rem;
	font-size: 1rem;
}

.btn




















































:not


























 


























(
:disabled


























 


























)
:not


























 


























(
.disabled


























 


























)
{
cursor




















































:


























 


























pointer




















































;
}
.product-card-button-add {
	background-color: #f37e3b;
	color: rgb(255, 255, 255);
	border-radius: 1.5625rem 0;
	border: .0625rem solid #ebebeb;
}

.product-card-button-add btn {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
}

.btn-block {
	display: block;
	width: 70%;
}

.product-card-container {
	text-align: center;
	letter-spacing: .01rem;
	font-size: 1rem;
}

.product-card-button-add i {
	color: #fafafa;
	padding-right: 4px;
}

.fas {
	font-family: 'font awesome 5 free';
	font-weight: 900;
}

.fas, .far, .fal, .fad, .fab {
	-moz-osx-font-smoothing: grayscale;
	-webkit-font-smoothing: antialiased;
	display: inline-block;
	font-style: normal;
	font-variant: normal;
	text-rendering: auto;
	line-height: 1;
}

.product-card-button-add




















































:not


























 


























(
:disabled


























 


























)
:not


























 


























(
.disabled


























 


























)
{
cursor




















































:


























 


























pointer




















































;
}
.product-card-button-add {
	font-weight: 550;
	text-align: center;
	font-size: 15px;
	line-height: 1.5;
}

/* <!---------------------------CART END ---------> */
* {
	box-sizing: border-box
}
/* Style tab links */
.tablink {
	background-color: #555;
	color: white;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 17px;
	width: 33.3%;
}

.tablink:hover {
	background-color: #777;
}
/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
	color: white;
	display: none;
	padding: 100px 20px;
	height: 100%;
}

#ProfileEdit {
	background-color: radial-gradient(rgb(255, 255, 255), #f5dada);
}

#ShippingDetails {
	background-color: radial-gradient(rgb(255, 255, 255), #f5dada);
}

#ChangePassword {
	background-color: radial-gradient(rgb(255, 255, 255), #f5dada);
}

.formAccSub-controlPW .submit {
	background: #ff523b;
	border-color: transparent;
	color: #fff;
	font-size: 20px;
	font-weight: bold;
	letter-spacing: 2px;
	height: 50px;
	margin-top: 20px;
	border-radius: 50px;
	text-align: center;
	cursor: pointer;
}

.formAccSub-controlPW .submit:hover {
	background: #e92c0b;
}
</style>

<script>

$(document).ready(function() {
	$('#regSuccess').hide();
	$('#userExists').hide();
	$('#emailExists').hide();

	getAllOrderRecord();

});

	function updateCustomerbtn() {
		if($("#fname").val() == "" || $("#lname").val() == "" || $("#uname").val() == "" || $("#email").val() == "" || $("#houseno").val() == "" || $("#streetname").val() == "" || $("#cityname").val() == "" || $("#password").val() == "" || $("#postal").val() == "" || $("#phone").val() == ""){
			//alert("faild");
		}
		else{
		Swal.fire({
			  title: 'Do you want to save the Account details?',
			  showDenyButton: true,
			  showCancelButton: true,
			  confirmButtonText: 'Save',
			  denyButtonText: `Don't save`,
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {

				  $.ajax({
						type : "POST",
						url : "updatePersonal",
						data : {
							id : $("#idp").val(),
							fname : $("#fname").val(),
							lname : $("#lname").val(),
							uname : $("#uname").val(),
							email : $("#email").val(),
							houseno : $("#houseno").val(),
							streetname : $("#streetname").val(),
							cityname : $("#cityname").val(),
							password : $("#password").val(),
							phone : $("#phone").val(),
							postal : $("#postal").val()
						},
						success : function(result) {
			    			Swal.fire('Saved!', '', 'success')
						},
						error : function(err) {
							alert("error is" + err)
						}
					});
				  
			  } else if (result.isDenied) {
			    Swal.fire('Details are not saved', '', 'info')
			  }
			})
		}
		
	}


	function getAllOrderRecord() {
		var data = "";
		$
				.ajax({
					type : "GET",
					url : "accountPast",
					success : function(response) {
						data = response

						$('.tr').remove();
						for (i = 0; i < data.length; i++) {
							$("#pastordertable")
									.append(
											'<tr class="tr"> <td style="text-align:center">'
													+ data[i].orderId
													+ '</td> <td style="text-align:center">'
													+ data[i].date
													+ '</td> <td style="text-align:center">'
													+ data[i].subtotal
													+ '</td> <td style="text-align:center">'
													+ data[i].payment 
													+ '</td> <td style="text-align:center">'
													+ data[i].status
													+ '<td><input type="button" style="cursor: pointer; display: block; margin: auto" onclick="refresh();viewOrder('
													+ data[i].orderId
													+ ')"  value="View"></input></td> </tr>');

						}
					},
					error : function(err) {
						alert("error is" + err)
					}
				});
	}

	function refresh(){
		$("#orderdetailtable").empty();
	}
	
	function viewOrder(orderId) {
		Swal.fire('You can view order details now....');
		var data = "";
		$
				.ajax({
					type : "GET",
					url : "getAllOrderDetailByIdFC/" + orderId,
					success : function(response) {
						data = response

						for (i = 0; i < data.length; i++) {
							$("#orderdetailtable")
									.append(
											'<tr class="tr"> <td style="text-align:center">'
													+ data[i].productId
													+ '</td> <td style="text-align:center">'
													+ data[i].productname
													+ '</td> <td style="text-align:center">'
													+ data[i].quantity
													+ '</td> <td style="text-align:center">'
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
	<!-------------------Customer Details bar------------------>

	<div class="det-table">
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/person2.png" />">&nbsp;&nbsp;
		</div>

		<div class="customer-name">
			<a href=./accountCus>Welcome, &nbsp;<u> ${cusName} </u></a>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/location2.png" />">&nbsp;&nbsp;
		</div>
		<div class="customer-name">Store Location
			&nbsp;&nbsp;&nbsp;&nbsp;Minuwangoda road, Gampaha</div>
	</div>

	<div class="containerhead">
		<div class="navbar">
			<div class="logo">
				<a href=./indexCus> <img
					src="<spring:url value="/resources/images/logo.png" />"
					width="220px" height="60"></a>
			</div>
			<nav>
				<ul id="MenuItems">
					<li><a href="indexCus">Home</a></li>
					<li><a href="productCus">Products</a></li>
					<li><a href="aboutCus">About</a></li>
					<li><a href="contactCus">Contact</a></li>
					<li><a href="accountCus"> <img
							src="<spring:url value="/resources/images/userr.png" />">
							My account
					</a></li>
				</ul>
			</nav>

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
			<div class="navbar-top">
				<div class="menuButto">
					<a href=. />
					<button id="menuButton" class="menuButton">
						<i class="fa fa-times-circle" aria-hidden="true"></i>
					</button>
					Exit </a>
				</div>
				<div>
					<!--Shopping cart-->
					<div class="shopping-cart">
						<!--Shopping cart logo-->
						<a href="cart" style="cursor: pointer"> <i
							class="fas fa-shopping-cart"> <b style="font-size: 14px">
									LKR <%
 	out.print(proItemSubTotal);
 %>
							</b>

						</i>
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-------------------Decorate bar------------------>
	<div class="dec-table">
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/clock.png" />">&nbsp;&nbsp;Delivery
			within 24 Hours
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/deliver.png"/>">&nbsp;&nbsp;Deliver
			to Doorstep
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/right.png"/>">&nbsp;&nbsp;Freshness
			Guaranteed
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/click.png"/>">&nbsp;&nbsp;Click
			and Collect
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/ok.png"/>">&nbsp;&nbsp;Amazing
			Deals
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>

	<!-------------------Account Details------------------>

	<button class="tablink"
		onclick="openPage('ProfileEdit', this, '#009900')">Profile
		Edit</button>
	<button class="tablink"
		onclick="openPage('ShippingDetails', this, '#e6b800')"
		id="defaultOpen">Shipping Details</button>
	<button class="tablink"
		onclick="openPage('ChangePassword', this, '#ff523b')">Change
		Password</button>

	<button class="tablink"
		onclick="openPage('pastOrderDetails', this, '#22a7f0')">Past
		Order Details</button>

	<div id="pastOrderEdit" class="tabcontent">
		<!-----profile edit form------>
		<h3>Personal Details</h3>

		<div class="Acc-contact-title ">
			<h2>PAST ORDER DETAILS</h2>
			<p>All the past order details</p>
			<br> <br>
		</div>

		<!-- -----------------------------TABLE OF CONTENTS------------------------------- -->
		<!-- -----------------------------TABLE OF CONTENTS------------------------------- -->
		<!-- -----------------------------TABLE OF CONTENTS------------------------------- -->
		<!-- -----------------------------TABLE OF CONTENTS------------------------------- -->
		<!-- -----------------------------TABLE OF CONTENTS------------------------------- -->
		<!-- -----------------------------TABLE OF CONTENTS------------------------------- -->

	</div>

	<div id="ProfileEdit" class="tabcontent">
		<!-----profile edit form------>
		<h3>Personal Details</h3>

		<div class="Acc-contact-title ">
			<h2>PERSONAL DETAILS</h2>
			<p>Please Use this form to change your personal details</p>
		</div>
		<c:forEach var="cus" items="${accDetails}">

			<c:set var="id" value="${cus.id}" />
			<c:set var="fname" value="${cus.fname}" />
			<c:set var="lname" value="${cus.lname}" />
			<c:set var="uname" value="${cus.uname}" />
			<c:set var="email" value="${cus.email}" />
			<c:set var="houseno" value="${cus.houseno}" />
			<c:set var="streetname" value="${cus.streetname}" />
			<c:set var="cityname" value="${cus.cityname}" />
			<c:set var="password" value="${cus.password}" />
			<c:set var="postal" value="${cus.postal}" />
			<c:set var="phone" value="${cus.phone}" />

			<form name="account-profile" id="account-profile">
				<div class="row g-3">
					<div class="col">
						<h4>
							<b>Customer lD:</b>
						</h4>
						<input type="text" class="formAcc-control" placeholder="lD"
							aria-label="idp" required="required" value="${cus.id}" id="idp"
							name="idp" readonly="readonly">
					</div>
					<div class="col">
						<h4>
							<b>Enter First Name:</b>
						</h4>
						<input type="text" class="formAcc-control"
							placeholder="First name" aria-label="First name"
							required="required" id="fname" value="${cus.fname}">
					</div>
					<div class="col">
						<h4>
							<b>Enter Last Name:</b>
						</h4>
						<input type="text" class="formAcc-control" placeholder="Last name"
							aria-label="Last name" required="required" id="lname"
							value="${cus.lname}">
					</div>
					<div class="col">
						<h4>
							<b>Enter User Name:</b>
						</h4>
						<input type="text" class="formAcc-control" placeholder="User name"
							aria-label="User name" required="required" id="uname"
							value="${cus.uname}">
					</div>
					<div class="col">
						<h4>
							<b>Enter Email:</b>
						</h4>
						<input type="text" class="formAcc-control" type="email" placeholder="Email"
							aria-label="Email" required="required" id="email"
							value="${cus.email}">
					</div>
					<div class="col-w">
						<input type="text" class="formAcc-control" placeholder="none"
							aria-label="none">
					</div>
				</div>
	</div>

	<div id="ShippingDetails" class="tabcontent">
		<!-----Shipping Details form------>
		<h3>Shipping Details</h3>
		<div class="Acc-contact-title ">
			<h2>SHIPPING DETAILS</h2>
			<p>Please Use this form to change your shipping details</p>
			<br> <br>
		</div>
		<div class="row g-3">
			<div class="col">
				<h4>
					<b>Enter Full Name:</b>
				</h4>
				<input type="text" class="formAcc-control" placeholder="Full Name"
					aria-label="Full Name" readonly id="fname"
					value="${cus.fname} ${cus.lname}">
			</div>
			<div class="col">
				<h4>
					<b>Enter House No:</b>
				</h4>
				<input type="text" class="formAcc-control"
					placeholder="House number," aria-label="house number," required
					id="houseno" value="${cus.houseno}">
			</div>
			<div class="col">
				<h4>
					<b>Enter Phone No:</b>
				</h4>
				<input type="text" class="formAcc-control"
					placeholder="Phone number" aria-label="Phone number" required
					id="phone" value="${cus.phone}">
			</div>
			<div class="col">
				<h4>
					<b>Enter Street Name:</b>
				</h4>
				<input type="text" class="formAcc-control"
					placeholder="Street name," aria-label="street name," required
					id="streetname" value="${cus.streetname}">
			</div>
			<div class="col">
				<h4>
					<b>Enter Postal Code:</b>
				</h4>
				<input type="text" class="formAcc-control" placeholder="Postal code"
					aria-label="Postal code" required id="postal" value="${cus.postal}">
			</div>
			<div class="col">
				<h4>
					<b>Enter City Name:</b>
				</h4>
				<input type="text" class="formAcc-control" placeholder="City name"
					aria-label="city name," required id="cityname"
					value="${cus.cityname}">
			</div>
			<div class="col-w">
				<input type="text" class="formAcc-control" placeholder="none"
					aria-label="none">
			</div>
		</div>
	</div>

	<div id="ChangePassword" class="tabcontent">
		<!-----Change Password form------>
		<h3>CHANGE PASSWORD</h3>
		<div class="Acc-contact-title ">
			<h2>CHANGE PASSWORD</h2>
			<p>Please Use this form to change your login password</p>
			<br> <br>
		</div>
		<div class="row g-3">
			<div class="col">
				<h4>
					<b>New Password:</b>
				</h4>
				<input type="password" class="formAcc-control"
					placeholder="New password" aria-label="" required
					value="${cus.password}" id="password">

				<p>
					<input type="checkbox" name="" onclick="myFunction()">Show
					Password
				</p>
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
			<div class="col-w">
				<h4>
					<b>New Password:</b>
				</h4>
				<input type="text" class="formAcc-control"
					placeholder="Current password" aria-label="password" required
					id="passwords">
			</div>
			<small style="color: #07c400" id="regSuccess"><b>User
					Updated Successfull!</b></small> <small style="color: red" id="userExists"><b>Username
					or Password is already in used!</b></small> <small style="color: red"
				id="emailExists"><b>Email address is already in used!</b></small>

			<div class="formAccSub-controlPW">
				<Button type="submit" class="form-control submit" id="updatePass"
					onclick="updateCustomerbtn()">SAVE</Button>
			</div>
		</div>
		</form>
		</c:forEach>
	</div>

	<div id="pastOrderDetails" class="tabcontent">
		<!-----Shipping Details form------>
		<h3>PAST ORDER DETAILS</h3>
		<div class="Acc-contact-title ">
			<h2>PAST ORDER DETAILS</h2>
			<p>Please Use this form to analyze your past order details</p>
			<br> <br>
		</div>


		<div class="row g-3">
			<div class="col">

				<!-- end row-->
				<!-- -----------------------TABLE CONTENT--------------------- -->
				<h1 align="center"
					style="color: #ff8e8e; font-size: 24px; font-weight: bolder">Order
					Details</h1>
				<br>
				<table border="1" style="color: black; border-color: #26802a">
					<thead>
						<tr>
							<th style="text-align: center; background: #3bc242" width="200px">Product_ID</th>
							<th style="text-align: center; background: #3bc242" width="200px">Product_Name</th>
							<th style="text-align: center; background: #3bc242" width="200px">Quantity</th>
							<th style="text-align: center; background: #3bc242" width="200px">Price</th>
						</tr>
					</thead>
					<tbody id="orderdetailtable">
					</tbody>
				</table>
				<!-- -----------------------END TABLE CONTENT--------------------- -->

			</div>
		</div>


		<div class="row g-3">
			<div class="col">

				<!-- end row-->
				<!-- -----------------------TABLE CONTENT--------------------- -->
				<h1 align="center"
					style="color: #ff8e8e; font-size: 24px; font-weight: bolder">Past
					Orders</h1>
				<br>
				<table border="1" style="color: black; border-color: orange">
					<thead>
						<tr>
							<th style="text-align: center" width="200px">Order_Id</th>
							<th style="text-align: center" width="200px">Date/Time</th>
							<th style="text-align: center" width="200px">Subtotal</th>
							<th style="text-align: center" width="200px">Payment_Method</th>
							<th style="text-align: center" width="200px">Status</th>
							<th style="text-align: center" width="100px">Show_Details</th>
						</tr>
					</thead>
					<tbody id="pastordertable">
					</tbody>
				</table>
				<!-- -----------------------END TABLE CONTENT--------------------- -->

			</div>
		</div>
	</div>

	<!-- Footer section Begin -->
	<footer class="footer">
		<div class="container1">
			<div class="row">
				<div class="footer-col-1">
					<div class="payment">
						<img src="<spring:url value="/resources/images/payment.png" />">
					</div>
					<h3>Download Our App</h3>
					<p>Download App for Android and ios mobile phone.</p>
					<div class="app-logo">
						<img src="<spring:url value="/resources/images/app-store.png" />">
						<img src="<spring:url value="/resources/images/play-store.png" />">
					</div>
				</div>
				<div class="footer-col-2">
					<a href=./indexCus><img
						src="<spring:url value="/resources/images/logo.png" />"></a>
					<p>Our passion is to deliver pleasure and nutrition throughout
						peoples lives, through exciting and superior products, whenever
						and wherever they choose to eat and drink.</p>
				</div>
				<div class="footer-col-3">
					<h3>Useful Links</h3>
					<ul>
						<li>Coupons</li>
						<li>Blog Post</li>
						<li>Return Policy</li>
						<li>Join Affliate</li>
					</ul>
				</div>
				<div class="footer-col-4">
					<h3>Follow us</h3>
					<ul>
						<li>Facebook</li>
						<li>Twitter</li>
						<li>Instagram</li>
						<li>YouTube</li>
					</ul>
				</div>
			</div>
			<hr>
			<p class="copyright">Copyright @ 2021 All rights reserved |
				Parakrama Supermarket</p>

		</div>
	</footer>

	<!-------------------------End fotter---------------------->

	<!-------------js for Tab menu----------->
	<script>
		function openPage(pageName, elmnt, color) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].style.backgroundColor = "";
			}
			document.getElementById(pageName).style.display = "block";
			elmnt.style.backgroundColor = color;
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

</body>

</html>



<!-------------js for toggle menu----------->
<script>
	var MenuItems = document.getElementById("MenuItems");
	MenuItems.style.maxHeight = "0px";

	function menutoggle() {
		if (MenuItems.style.maxHeight == "0px") {
			MenuItems.style.maxHeight = "200px";
		} else {
			MenuItems.style.maxHeight = "0px";
		}
	}
</script>


<!--------------------js for toggle Menu--------------->
<script>
	var MenuItems = document.getElementById("MenuItems");
	MenuItems.style.maxHeight = "0px";

	function menutoggle() {
		if (MenuItems.style.maxHeight == "0px") {
			MenuItems.style.maxHeight = "200px";
		} else {
			MenuItems.style.maxHeight = "0px";
		}
	}
</script>

<%-- <script src="<spring:url value="/resources/js/script.js" />"></script>
<script src="<spring:url value="/resources/shopping-cart.js" />"></script> --%>
</body>