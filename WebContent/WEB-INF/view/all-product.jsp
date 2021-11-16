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
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Products - Parakrama</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css" />">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/multislider.min.js" />"></script>
<script type="text/javascript"
	src="https://www.paypal.com/sdk/js?client-id=........"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Ensures optimal rendering on mobile devices. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Optimal Internet Explorer compatibility -->


<style>

/*-----------------Cart Button-------------*/
nav a {
	text-decoration: none;
	color: #555;
	font-weight: 400;
}

.buyItems h4 {
	color: #fff;
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

.det-table {
	background-color: rgb(80, 52, 0);
	font-size: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: rgb(255, 255, 255);
	text-align: left;
	letter-spacing: .01rem;
	padding-top: 1px;
	padding-bottom: 1px;
}

.det-table a {
	background-color: rgb(80, 52, 0);
	font-size: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: rgb(255, 255, 255);
	text-align: left;
	letter-spacing: .01rem;
	padding-top: 1px;
	padding-bottom: 1px;
}
</style>

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

			<div class="navbar-top">
				<div class="menuButto">
					<a href="./">
						<button id="menuButton" class="menuButton">
							<i class="fa fa-times-circle" aria-hidden="true"></i>
						</button>
					</a>
				</div>
				<div>
					<!--Shopping cart-->
					<div class="shopping-cart">
						<div class="sum-prices">
							<!--Shopping cart logo-->
							<i class="fas fa-shopping-cart shoppingCartButton"></i>
							<!--The total prices of products in the shopping cart -->
							<h6 id="sum-prices"></h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="producstOnCart hide" onload>
			<div class="overlay"></div>
			<div class="top">
				<button id="closeButton">
					<i class="fas fa-times-circle"></i>
				</button>
				<h3>Cart</h3>
			</div>
			<div class="buyItems">
				<ul id="buyItems">
					<h4 class="empty">
						Your Shopping Cart Is <br>Empty!
					</h4>
				</ul>
			</div>


			<script src="https://www.paypal.com/sdk/js?client-id=YOUR_CLIENT_ID">
				// Required. Replace YOUR_CLIENT_ID with your sandbox client ID.
			</script>


			<script>
				// This function displays Smart Payment Buttons on your web page.
					paypal.Buttons().render('#paypal-button-container');
			</script>

			<!-- 			<a href="checkout"> -->
			<button class="btn checkout hidden" id="checkoutDetails"
				onClick="getInputValue();">Check Out</button>
			<!-- 			</a> -->

			<div id="paypal-button-container"></div>

			<!----------------------- ORDER SUMMARY TABLE-------------------->

			<div class="small-container cart-page">
				<c:forEach var="cus" items="${cusDetails}">
					<c:set var="id" value="${cus.id}" />
					<table border="2">
						<h3 align="left">- Order Summary -</h3>
						<h3 align="right">ORD00${cus.id}</h3>
						</c:forEach>
						<tr>
							<!-- <th>Customer</th>
				<th>OrderDate</th> -->
							<th>Product</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
						</tr>
						<tr>
							<td></td>
							<td>Rs 310.00</td>
							<td><input type="number" value="5"></td>
							<td>Rs 310.00</td>
						</tr>
					</table>
					<br>
					<div class="total-price">
						<table border="1">
							<tr>
								<td>Subtotal</td>
								<td>Rs 200.00</td>
							</tr>
							<tr>
								<td>Discount</td>
								<td>Rs 22.00</td>
							</tr>
							<tr>
								<td>Estimated Tax</td>
								<td>Rs 35.00</td>
							</tr>
							<tr>
								<td>Shipping Charge</td>
								<td>Rs 120.00</td>
							</tr>
							<tr>
								<td>Total</td>
								<td>Rs 235.00</td>
							</tr>
						</table>
					</div>
			</div>



		</div>
	</div>

	<!-------------------Product Search Bar--------------->
	<div class="search-box">
		<form>
			<input type="text" name="searchName" placeholder="Search here"
				id="searchName"> <input type="submit" name="submit"
				value="Search" onclick="electronicSearch()">
		</form>
	</div>
	<!-------------------END Product Search Bar--------------->

	<div class="small-container">
		<div class="row row-2">
			<h2>All Products</h2>
			<form name="dropMenuForm">
				<div class="dropCursor">
					<select name="dropMenu" id="dropMenu">
						<option value="nothing" selected="selected">Select
							Categories</option>
						<option value=./fruitCatCus>Fruits</option>
						<option value=./vegiCatCus>Vegitables</option>
						<option value=./meatCatCus>Fish/Meats</option>
						<option value=./homewareCatCus>Homeware Items</option>
						<option value=./beautyCatCus>Beauty Picks</option>
						<option value=./electronicCatCus>Electronics</option>
					</select>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			var urlMenu = document.getElementById('dropMenu');
			urlMenu.onchange = function() {
				var userOption = this.options[this.selectedIndex];

				if (userOption.value != "nothing") {
					window.open(userOption.value, "Drop down Page", "");
				}
			}
		</script>
		<!-----------------------1st row--------------------------------------->
		<ul class="products">
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro1.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="9">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Watawala Kahata Tea Pouch 400g</h4>
						<h6 class="price">
							Rs <span class="priceValue">500</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro2.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="10">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Munchee Snacks Cracker 260g</h4>
						<h6 class="price">
							Rs <span class="priceValue">310</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro3.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="11">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Ratthi Set Yoghurt Multi Pack 320G 4S</h4>
						<h6 class="price">
							Rs <span class="priceValue">170</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro4.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="12">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							Rs <span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro5.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="13">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Watawala Kahata Tea Pouch 400g</h4>
						<h6 class="price">
							Rs <span class="priceValue">500</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro6.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="14">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Munchee Snacks Cracker 260g</h4>
						<h6 class="price">
							Rs <span class="priceValue">310</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro7.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="15">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Ratthi Set Yoghurt Multi Pack 320G 4S</h4>
						<h6 class="price">
							Rs <span class="priceValue">170</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro8.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="16">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro9.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="17">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro19.png " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="18">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro13.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="19">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro14.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="20">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro19.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="21">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro20.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="22">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro21.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="23">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/allproducts/pro22.jpg " />">
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="24">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 170.00 | </span> Rs
							<span class="priceValue">1255</span> / Unit
						</h6>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div class="page-btn">
		<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>&#8594;</span>
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


	<script src="<spring:url value="/resources/js/script.js" />"></script>
	<script src="<spring:url value="/resources/shopping-cart.js" />"></script>

	<script
		src="https://www.paypal.com/sdk/js?client-id=AfnkTohqsH1-_GA6ywZZvaz6nTjKy9LHUz_MGhpwJsaaCR44pqAl1M68qhWnFztEigGyPrW0TKmoOU4d">
		// Required. Replace YOUR_CLIENT_ID with your sandbox client ID.
	</script>



	<c:forEach var="cus" items="${cusDetails}">

		<c:set var="id" value="${cus.id}" />
		<c:set var="fname" value="${cus.fname}" />
		<c:set var="lname" value="${cus.lname}" />
		<c:set var="uname" value="${cus.uname}" />
		<c:set var="email" value="${cus.email}" />
		<c:set var="houseno" value="${cus.houseno}" />
		<c:set var="streetname" value="${cus.streetname}" />
		<c:set var="cityname" value="${cus.cityname}" />
		<c:set var="password" value="${cus.password}" />


	</c:forEach>
	<script>
		const tt = countTheSumPrice();
		console.log(tt);
		paypal
				.Buttons(
						{
							createOrder : function(data, actions) {
								// This function sets up the details of the transaction, including the amount and line item details.
								return actions.order.create({
									intent : 'CAPTURE',
									payer : {
										name : {
											given_name : 'Maleesha',
											surname : 'Sandakalum'
										},
									},
									purchase_units : [ {
										amount : {
											value : String(tt)
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
													alert("Thanks for making payment!!!! Order ID: "
															+ orderId
															+ " status: "
															+ status
															+ " update_time :"
															+ update_time
															+ " Amount :"${amount});
												});
							},

							//payment cancelled
							onCancel : function(data) {
								alert("Payment Cancelled !!!");
							},
							onError : function(err) {
								alert("Something Wrong with informations !!!");
							}
						}).render('#paypal-button-container');
	</script>

</body>

</html>