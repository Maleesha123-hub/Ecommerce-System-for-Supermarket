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
<title>Cart page - Parakrama</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css" />">
<!-- -------AjAX JQUERY link -->
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
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

input[type="button"] {
	border-color: #efecec;
	padding: 1.036 em 2.134 em;
	background-color: #efecec;
	color: #333e48;
	font-size: .875rem;
	border-radius: 1.571 em;
}
</style>

<script>

	$(document).ready(function() {
	});

	function proDeleteCart(id) {

		$
				.ajax({
					type : "GET",
					url : "proorderdelet/"+id,
					dataType : 'json',
					
				});
	}

	 function insertProductDetailsCart() {
		 alert("SUCEES");
		$.ajax({
			type : "GET",
			url : "checkout",
			data : {
				id : $("#id").val(),
				name : $("#name").val(),
				price : $("#price").val(),
				quantity : $("#quantity").val()
			},
			success : function(result) {
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

	<!-------------------Cart items Details------------------>
	<div class="small-container cart-page">

		<p align="center" style="font-size: 37px">Cart</p>
		<c:forEach var="cus" items="${cusDetails}">
			<c:set var="id" value="${cus.id}" />
			<p align="right" style="color: black; font-size: 22px">
				<b>ORD00${cus.id}</b>
			</p>
		</c:forEach>
		<table>
			<tr>
				<th>Remove</th>
				<th></th>
				<th>Product</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><button value="Update"
						style="cursor: pointer; width: 80px; height: 20px">Update</button></td>
				<td></td>
			</tr>
			<c:forEach var="pro" items="${proDetails}">
				<tr>
					<td><a href="" style="font-size: 15px"
						onclick="proDeleteCart(${pro.product.id})">Remove</a></td>
					<td>
						<div class="cart-info">
							<img src="https://gdurl.com/${pro.product.image}">
						</div>
					</td>
					<td><p style="font-size: 17px">${pro.product.name}</p></td>
					<td><p style="font-size: 16px">LKR ${pro.product.price}</p></td>
					<td><input type="number" value="${pro.quantity}"
						style="border-radius: 30px; width: 80px; height: 35px; border-color: blue">
					</td>
					<td><p style="font-size: 16px">LKR ${pro.subTotal}</p></td>
				</tr>
			</c:forEach>
		</table>

		<!-- <div class="updatebtn">
			<input type="button" value="Update cart">
		</div> -->

		<br> <br>

		<div class="total-price">
			<table>
				<tr>
					<td><p style="font-size: 18px">Total :</p></td>
					<td>
						<p style="font-size: 18px">
							<b> LKR <%
								out.print(proItemSubTotal);
							%>
							</b>
						</p>
					</td>
				</tr>
			</table>
		</div>
		<div class="total-price">
			<table>
				<tr>
					<td>
						<div class="row">
							<div class="col-2">
								<a href="checkout" target="_blank" class="btn"
									style="font-size: 15px">&nbsp;Procees To Submit Your Quote
									&nbsp; </a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- 
		<input type="image"
			src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif">
	</div>
 -->
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
							<img
								src="<spring:url value="/resources/images/play-store.png" />">
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