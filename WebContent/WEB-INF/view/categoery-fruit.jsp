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
<title>Fruit - Parakrama</title>
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
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
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

<script>
	$(document).ready(function() {
	});

	function proCart(id) {
		alert("Add to Cart :"+(id));

		$
				.ajax({
					type : "GET",
					url : "ordernow/"+id,
					dataType : 'json',
					
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
						<a href="cart" style="cursor: pointer"> <i class="fas fa-shopping-cart"> <b
							style="font-size: 14px"> LKR <%
 	out.print(proItemSubTotal);
 %>
						</b>

						</i> </a>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-------------------Product Search Bar--------------->
	<div class="search-box">
		<form action="searchfru" method="POST">
			<input type="text" name="name" placeholder="search here...">
			<input type="submit" value="search">
		</form>
	</div>
	<!-------------------END Product Search Bar--------------->

	<div class="small-container">
		<div class="row row-2">
			<h2>Fresh Fruits</h2>
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

		<div class="row">
			<!-----------------------1st row--------------------------------------->
			<ul class="products">
				<c:forEach var="pro" items="${proDetails}">

					<c:set var="id" value="${pro.id}" />
					<c:set var="name" value="${pro.name}" />
					<c:set var="price" value="${pro.price}" />
					<c:set var="category" value="${pro.description}" />
					<c:set var="image" value="${pro.image}" />
					<li class="product">
						<div class="product-under">
							<figure class="product-image">
								<img src="https://gdurl.com/${pro.image}">
								<div class="product-over">
									<button onclick="proCart(${pro.id})"
										class="btn btn-small addToCart" data-product-id=${pro.id}>
										<i class="fas fa-cart-plus"></i>Add to cart
									</button>
								</div>
							</figure>
							<div class="product-summary">
								<h4 class="productName">${pro.name}</h4>
								<p>${pro.description}</p>
								<h6 class="price">
									Rs <span class="priceValue">${pro.price}</span> / 1kg
								</h6>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<%-- <li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/1.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="25">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Rose Apples</h4>
							<p>Rose Apples et est. Integer pretium
								purus</p>
							<h6 class="price">
								Rs <span class="priceValue">45</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/2.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="26">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Blueberries</h4>
							<p>Blueberries est. Integer pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">450</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/3.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="27">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Grapes Ausy</h4>
							<p>Grapes Ausy et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">580</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/4.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="28">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Strauberry Milk</h4>
							<p>Strauberry Milk et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">140</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/5.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="29">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Purpular Grapes USA</h4>
							<p>Purpular Grapes USA et est. Integer pretium
								purus</p>
							<h6 class="price">
								Rs <span class="priceValue">610</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/6.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="30">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Mandarins Orange</h4>
							<p>Mandarins Orange est. Integer pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">490</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/7.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="31">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Melon Yellibean</h4>
							<p>Melon Yellibean et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">320</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/8.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="32">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Pomegrante Rose</h4>
							<p>Pomegrante Rose et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">590</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/9.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="33">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Rasberry Papuaniw Giniya</h4>
							<p>Rasberry Papuaniw Giniya et est. Integer
								pretium purus</p>
							<h6 class="price">
								<span class="product-card-original-price ">Rs 170.00 | </span>
								Rs <span class="priceValue">365</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/10.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="34">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Red Ripe</h4>
							<p>Red Ripe et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">700</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/11.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="35">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Rose Strawberry</h4>
							<p>Rose Strawberry est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">240</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/12.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="36">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Newsealand Strawberries</h4>
							<p>Newsealand Strawberries et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">260</span> / 1kg
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/13.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="37">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Red Tomatoes</h4>
							<p>Red Tomatoes et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">290</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/14.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="38">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Blue Barley</h4>
							<p>Blue Barley et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">190</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/15.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="39">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Naran Orange</h4>
							<p>Naran Orange et est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">180</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/Fruits/16.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="40">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Currants Berry</h4>
							<p>Currants Berry est. Integer
								pretium purus</p>
							<h6 class="price">
								Rs <span class="priceValue">420</span> / Unit
							</h6>
						</div>
					</div>
				</li> 
			</ul>
		</div>--%>
		<div class="page-btn">
			<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>&#8594;</span>
		</div>
	</div>



	<!---------- offer ------------>
	<!--
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <img src="images/exclusive.png" class="offer-img">
                    </div>
                    <div class="col-2">
                        <p>Exclusively Available on Parakrama Store</p>
                        <h1>Smart Band 4</h1>
                        <small>The Mi Smart Band 4 features a 39.9% larger (than Mi Band 3) AMOLED color<br> full-touch display with adjustable brightness, so everything is clear as can be.</small>
                        <a href="##" class="btn">Buy Now &#8594;</a>
                    </div>
                </div>
            </div>
        </div>
    -->
	<!---------- END offer ------------>



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
</body>

</html>