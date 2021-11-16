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
<title>Homeware - Parakrama</title>
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
		alert(id);

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
		<form action="##" method="POST">
			<input type="text" name="search" placeholder="search here...">
			<input type="submit" name="submit" value="search">
		</form>
	</div>
	<!-------------------END Product Search Bar--------------->

	<div class="small-container">
		<div class="row row-2">
			<h2>Homeware Items</h2>
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
								<h6 class="price">
									Rs <span class="priceValue">${pro.price}</span> / Unit
								</h6>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<%-- <div class="row">
			<!-----------------------1st row--------------------------------------->
			<ul class="products">
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h1.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="89">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">$178 Noritake Dinnerware Odessa Gold 5-Piece Place Setting NIB</h4>
							<h6 class="price">
								Rs <span class="priceValue">45000</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h2.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="90">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">1/2/3/4 Seat Sofa Cover Stretch Solid Color Couch Slipcover Furniture Protector</h4>
							<h6 class="price">
								Rs <span class="priceValue">120000</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h3.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="91">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Sheesham Wood Bed Side Accent End Table with Drawers Living Bed Room Furniture</h4>
							<h6 class="price">
								Rs <span class="priceValue">220000</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h4.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="92">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Printed Slipcover Sofa Covers Spandex Stretch Couch Cover Furniture Protector</h4>
							<h6 class="price">
								Rs <span class="priceValue">425000</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h5.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="93">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Indian Handmade Leather Lounge Butterfly Chair With Footrest Foot Stool S6 147</h4>
							<h6 class="price">
								Rs <span class="priceValue">195000</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h6.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="94">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">NWT Anthropologie Melamine Plant Picnic Cups- SET OF FOUR</h4>
							<h6 class="price">
								Rs <span class="priceValue">2500</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h7.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="95">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">le02a Red Off White Zig Zag Cotton Canvas Cushion Cover Pillow Case Custom Size</h4>
							<h6 class="price">
								Rs <span class="priceValue">4900</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h8.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="96">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Blender Bottle Radian 32 oz. Tritan Shaker Mixer Cup with Loop Top</h4>
							<h6 class="price">
								Rs <span class="priceValue">95000</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h9.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="97">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Leather Handmade Butterfly Chair Seat Folding Modern Sling Loung Vintage Accent</h4>
							<h6 class="price">
								Rs <span class="priceValue">5900</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h10.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="98">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">12 Silver Butterfly Wall Stickers 3D Metallic Home Decals Room Decorations Decor</h4>
							<h6 class="price">
								Rs <span class="priceValue">3650</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h11.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="99">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Vintage car Style Table, Desk Clock For Home and Office Decoration</h4>
							<h6 class="price">
								Rs <span class="priceValue">7250</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h12.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="100">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Pillow Red Chinese Rayon Brocade Throw Seat Pad Cushion Case Custom Size BL7</h4>
							<h6 class="price">
								Rs <span class="priceValue">2400</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h13.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="101">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Waterfall 01 Hole in Wall - Natural Mural 3D Printed Vinyl Sticker Decal Decor</h4>
							<h6 class="price">
								Rs <span class="priceValue">13500</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h14.png" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="102">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Vintage Flute Player Style Table, Desk Clock For Home and Office Decoration</h4>
							<h6 class="price">
								Rs <span class="priceValue">2970</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h15.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="103">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Crystal Whiskey Glasses Set of 4, Rocks Glasses, 10 oz Old Fashioned Tumblers</h4>
							<h6 class="price">
								Rs <span class="priceValue">1950</span> / Unit
							</h6>
						</div>
					</div>
				</li>
				<li class="product">
					<div class="product-under">
						<figure class="product-image">
							<img src="<spring:url value="/resources/images/Homeware Items/h16.jpg" />">
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="104">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Set of 4 Double Wall Espresso Cup Insulated Expresso Coffee Cups Sets Stackable</h4>
							<h6 class="price">
								Rs <span class="priceValue">9900</span> / Unit
							</h6>
						</div>
					</div>
				</li>
			</ul>
		</div> --%>
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