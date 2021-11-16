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
<title>Parakrama | Ecommerce Website Design</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css" />">
<link rel="preconnect" href="https://fonts.googleapis.com">
<!-- -------AjAX JQUERY link -->
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
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

/*-----------------Cart Button-------------*/
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

/*-------------------------------------------------------------------------------CART---------------------->
@import "compass/css3";

/* Global settings */
$
color-border: #eee ; $color-label: #aaa ; $font-default: 'HelveticaNeue-Light 
	 ', 'Helvetica Neue Light ', 'Helvetica Neue
	 ', Helvetica, Arial, sans-serif ; $font-bold: 'HelveticaNeue-Medium 
	 ', 'Helvetica Neue Medium ';
	/* Global "table" column settings */ .product-image {
	float: left;
	width: 20%;
}

.product-details {
	float: left;
	width: 37%;
}

.product-price {
	float: left;
	width: 12%;
}

.product-quantity {
	float: left;
	width: 10%;
}

.product-removal {
	float: left;
	width: 9%;
}

.product-line-price {
	float: left;
	width: 12%;
	text-align: right;
}

/* This is used as the traditional .clearfix class */
.group:before, .group:after {
	content: '';
	display: table;
}

.group:after {
	clear: both;
}

.group {
	zoom: 1;
}

/* Apply clearfix in a few places */
.shopping-cart, .column-labels, .product, .totals-item { @extend .group;
	
}

/* Apply dollar signs */
.product .product-price:before, .product .product-line-price:before,
	.totals-value:before {
	content: 'Rs. ';
}

/* Body/Header stuff */
body {
	padding: 0px 30px 30px 20px;
	font-family: $ font-default;
	font-weight: 100;
}

h1 {
	font-weight: 100;
}

label {
	color: $color-label;
}

.shopping-cart {
	margin-top: -45px;
}

/* Column headers */
.column-labels {label { padding-bottom:15px;
	margin-bottom: 15px;
	border-bottom: 1px solid$color-border;
}

.product-image, .product-details, .product-removal {
	text-indent: -9999px;
}

}

/* Product entries */
.menuButto .menuButton {
	cursor: pointer;
}

.menuButton:hover {
	color: #f51515;
}

.shopping-cart .sum-prices {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#sum-prices {
	padding-left: 5px;
}

.sum-prices h6 {
	font-size: 0.9rem;
}

.shoppingCartButton {
	cursor: pointer;
	width: 100%;
	height: 100%;
}

.shoppingCartButton:hover, .account:hover * {
	color: #eb0808;
}

.producstOnCart {
	overflow: hidden;
	overflow-y: scroll;
	scroll-behavior: smooth;
	overscroll-behavior: contain;
	background-color: #bdb8b8;
	width: 300px;
	height: 600px;
	color: #f0f0f0;
	z-index: 15;
	position: fixed;
	top: 20px;
	right: 0;
	text-align: center;
}

.producstOnCart::-webkit-scrollbar {
	width: 0;
	background: transparent;
}

.hide {
	display: none;
}

.producstOnCart ul {
	text-align: left;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.producstOnCart .buyItem {
	border-bottom: #aaa 1px solid;
	width: 90%;
	padding: 10px 0;
	display: flex;
}

.producstOnCart img {
	width: 90px;
}

.producstOnCart .top {
	display: flex;
	background: radial-gradient(rgb(238, 152, 54), #dd890a);
	text-align: center;
	padding: 10px 0;
	position: sticky;
	top: 0;
	width: 100%;
}

.top button {
	background: transparent;
	border: none;
	font-size: 1.5rem;
	margin-left: 10px;
	color: #fdfdfd;
	cursor: pointer;
}

.top button:hover {
	color: #b40000;
}

.top h3 {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	margin: 0 auto;
}

.overlay {
	overflow: hidden;
	display: inline-block;
	content: "";
	position: fixed;
	left: 0;
	top: 0;
	width: 100vw;
	height: 100vh;
	z-index: -1;
	background: rgba(0, 0, 0, 0.5);
}

.stopScrolling {
	height: 100vh;
	overflow: hidden;
}

.buyItem h6 {
	margin-bottom: 10px;
}

.buyItem button {
	background: transparent;
	color: #fff;
	cursor: pointer;
	font-weight: 900;
	font-size: 1.2rem;
	padding: 0 6px;
	border: none;
}

.buyItem button:active {
	color: #96c8cc;
}

.buyItem>div {
	padding: 0 20px;
}

.producstOnCart .empty {
	justify-self: center;
	margin: 150px auto;
}

.price {
	color: #dd7733;
	text-align: left;
	padding: 5px;
	font-size: 1rem;
	font-weight: normal;
}

.navbar {
	max-width: 1600px;
	width: 88vw;
	display: flex;
	flex-direction: row;
	position: relative;
}

.searchbar form {
	position: absolute;
	right: 17px;
	top: 27.5px;
	transform: translate(0%, -50%);
	transition: all 1s;
	width: 40px;
	height: 40px;
	background: white;
	box-sizing: border-box;
	border-radius: 25px;
	border: 1px solid #555;
	padding: 5px;
}

.searchbar>form input {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 36px;
	line-height: 20px;
	outline: 0;
	border: 0;
	display: none;
	font-size: 0.9rem;
	border-radius: 20px;
	padding: 0 20px;
}

.searchbar form:hover {
	width: 300px;
	cursor: pointer;
}

.searchbar form:hover input {
	display: block;
}

.searchbar input::placeholder {
	color: #242424;
	font-size: 0.8em;
}

.searchbar>form:hover #search-icon {
	background: #07051a;
	color: white;
}

#search-icon {
	box-sizing: border-box;
	padding: 8px;
	width: 38px;
	height: 38px;
	position: absolute;
	top: 0;
	right: 0;
	border-radius: 50%;
	color: #07051a;
	text-align: center;
	font-size: 1rem;
	transition: all 1s;
}

#search-icon:active, #search-icon:focus {
	outline: none;
}

.links {
	position: relative;
	display: inline-blo;
	margin: auto;
}

.links ul {
	display: flex;
	flex-direction: row;
}

ul .nav-links {
	cursor: pointer;
	color: #333333;
	text-align: center;
	padding: 15px;
}

.nav-links>a:visited, .navbar-top>a:visited {
	color: #333333;
}

.link {
	text-align: center;
	font-size: 0.9rem;
}

.nav-links:hover .link {
	color: #24738b;
	text-decoration: underline;
}

.navbarResponsive .links {
	margin: 5px;
}

.navbarResponsive ul {
	flex-direction: column;
	text-align: left;
}

.navbarResponsive .searchbar form {
	position: relative;
	margin-left: 50px;
}

.navbarResponsive .nav-links {
	text-align: left;
}

.navbarResponsive .nav-links>.link {
	z-index: 15;
	color: white;
}

#hearderSlide {
	background-color: #49989e;
	height: 55vh;
	position: relative;
}

#hearderSlide .MS-content {
	margin: 0 1%;
	white-space: nowrap;
	/* required */
	overflow: hidden;
	/* required */
	height: 100%;
}

#hearderSlide .item {
	display: inline-block;
	width: 33.3333%;
	/* required * Determines number of visible slides */
	position: relative;
	/* required */
	vertical-align: top;
	/* required */
	overflow: hidden;
	/* required */
	height: 100%;
	/* recommended */
	white-space: normal;
}

.item img {
	width: 100%;
	height: 100%;
	padding: 20px 10px;
}

#hearderSlide .MS-controls .MS-left {
	border: none;
	left: 10px;
}

#hearderSlide .MS-controls .MS-right {
	border: none;
	right: 10px;
}

.MS-right:focus, .MS-left:focus {
	outline: none;
}

.MS-right:active, .MS-left:active {
	color: #fff;
	background-color: #49989e;
}

#hearderSlide .MS-right {
	position: absolute;
	font-weight: bolder;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
}

#hearderSlide .MS-left {
	font-weight: bolder;
	position: absolute;
	left: 20px;
	top: 50%;
	transform: translateY(-50%);
}

main {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-bottom: 80px;
}

.main-section {
	width: 100%;
	text-align: center;
	margin: 50px 0;
}

.product-container {
	max-width: 1600px;
	margin: auto;
	width: 88vw;
	position: relative;
}

.main-section h3 {
	font-size: 1.3rem;
	padding: 50px;
}

.products {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 10px;
}

.product {
	position: relative;
	text-align: center;
	height: 400px;
	border-radius: 5px;
	overflow: hidden;
}

.product-under {
	width: 100%;
	height: 100%;
}

.product-over {
	z-index: 10;
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	display: none;
	justify-content: center;
	align-items: center;
	animation-name: show_top;
	animation-duration: 1s;
	backdrop-filter: blur(5px);
}

@
keyframes show_top {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.product-image:hover .product-over {
	display: flex;
	flex-direction: column;
}

.product-image {
	position: relative;
	height: 62%;
	background-color: #eee;
}

.product-image img {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 70%;
}

.product-summary {
	font-size: 0.9rem;
	position: relative;
	padding: 10px 5px;
	height: 38%;
}

.product-summary>.price {
	position: absolute;
	left: 20px;
	bottom: 0;
}

.stars {
	position: relative;
	width: 110px;
	height: 40px;
	display: block;
	margin: auto;
	padding: 5px;
}

.stars::after {
	content: "\2605 \2605 \2605 \2605 \2605";
	position: absolute;
	left: 0;
	top: 0;
	width: 65%;
	display: block;
	font-size: 1.4rem;
	color: #dabd3b;
	overflow: hidden;
}

.stars::before {
	content: "\2606 \2606 \2606 \2606 \2606";
	position: absolute;
	left: 0;
	top: 0;
	font-size: 1.4rem;
	color: #7e6c1f;
}

/* Buttons style */
.btn:active {
	box-shadow: none;
}

.btn>.fa-angle-right {
	font-size: 1.5rem;
	position: absolute;
	right: 30px;
	top: 50%;
	transform: translateY(-50%);
	transition: right 0.5s;
}

.btn:hover .fa-angle-right {
	font-size: 1.5rem;
	position: absolute;
	right: 20px;
}

.btn i {
	margin: 0 5px;
}

.pop-mobiles {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
}

.pop-mobiles-1 {
	background: linear-gradient(to top, #ebebeb, #fff);
	overflow: hidden;
	width: 100%;
	height: 600px;
	margin-bottom: 30px;
	position: relative;
	padding: 0;
}

.pop-mobiles-1>figure {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 49%;
}

.pop-mobiles-1 img {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	z-index: 0;
}

.pop-mobiles-1>div {
	position: absolute;
	right: 10%;
	top: 30%;
	z-index: 10;
	width: 40%;
	height: 100%;
	text-align: left;
}

.pop-mobiles-1 h4 {
	color: rgb(187, 76, 76);
	font-size: 1.2rem;
}

.pop-mobiles-1 h2 {
	font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
	font-weight: 900;
	font-size: 1.8rem;
}

.pop-mobiles-1 .btn {
	display: inline-block;
	margin-top: 50px;
	margin: 50px 0;
}

.btn-newMobile {
	background-color: white;
	color: #49989e;
	box-shadow: 3px 3px 5px #4e4e4e;
	z-index: 10;
}

.pop-mobiles-2 {
	width: 55%;
}

.pop-mobiles-2 .products {
	grid-template-columns: repeat(3, 1fr);
}

.pop-mobiles-2 .product {
	overflow: hidden;
	margin-bottom: 10px;
}

.pop-mobiles-2 img {
	width: 70%;
	margin: auto;
}

.btn-small {
	border: none;
	font-size: 0.9rem;
	width: 60%;
	height: 45px;
	padding: 15px;
	box-shadow: 2px 2px 2px #49989e;
	margin-bottom: 10px;
	cursor: pointer;
	background-color: #dfdfdf;
	color: rgb(0, 0, 0);
	border-radius: 1.5625rem 0;
	border: .0625rem solid #f8f6f6;
}

.btn-small:hover {
	background-color: #f38327;
	color: white;
}

.hidden {
	display: none;
}

@media screen and (max-width: 1024px) {
	nav .navbar-top {
		padding: 0;
	}
	nav {
		justify-content: left;
		align-items: flex-start;
		margin-bottom: 20px;
	}
	#hearderSlide .item {
		display: inline-block;
		width: 100%;
	}
	.navbar-top .logo {
		width: 100px;
		float: left;
	}
	#menuButton {
		display: inline;
	}
	.navbar {
		background-color: #141414;
		width: 400px;
		height: 55vh;
		z-index: 10;
		position: absolute;
		top: 100px;
		left: 0;
		transform: translateX(-500px);
	}
	.navbarResponsive {
		transition: transform 0.5s;
		flex-direction: column;
		transform: translateX(0);
	}
	.navbarResponsive:after {
		content: "";
		position: fixed;
		left: 0;
		top: 0;
		width: 100vw;
		height: 100%;
		background: rgba(0, 0, 0, 0.5);
		z-index: -1;
	}
	.nav-links:hover .link::before {
		display: none;
	}
	.nav-links:hover .link::after {
		display: none;
	}
	.nav-links:hover .link {
		text-decoration: underline;
	}
	.item img {
		padding: 10px 5px;
	}
	.pop-mobiles-2 {
		width: 90%;
		margin-top: 100px;
	}
	.product-container {
		width: 90%;
	}
	.product-over button {
		font-size: 0;
	}
	.product .product-image {
		height: 200px;
	}
}

@media screen and (max-width: 768px) {
	.account-btn {
		font-size: 1rem;
	}
	.product-summary {
		height: 30%;
	}
	.products {
		width: 80%;
		margin: auto;
		grid-template-columns: repeat(2, 1fr);
	}
	.product-summary>p {
		display: none;
	}
	.pop-mobiles-1>figure {
		width: 70%;
	}
	.pop-mobiles-1>div {
		left: 10%;
		top: 40%;
		width: 70%;
		height: auto;
	}
	footer .footer-second {
		margin-left: 30px;
		display: flex;
		flex-direction: column;
		justify-content: start;
		align-items: start;
	}
	.footer-second h3 {
		margin-bottom: 15px;
	}
	.footer-second>div {
		margin-top: 30px;
		text-align: left;
		width: 100%;
	}
	.footer-second a {
		width: 100%;
	}
}

@media screen and (max-width: 500px) {
	.btn {
		font-size: 0.9rem;
	}
	.navbar {
		width: 100vw;
		height: 430px;
	}
	.producstOnCart {
		font-size: 0.8rem;
	}
	.pop-mobiles-1 {
		width: 100%;
		font-size: 0.9rem;
		height: 300px;
		margin: 0;
	}
	.pop-mobiles-1 .btn {
		opacity: 0.9;
	}
	.pop-mobiles-1>div {
		top: 0%;
	}
	.pop-mobiles-1 h2 {
		font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
		font-weight: 900;
		font-size: 1.4rem;
	}
	.pop-mobiles-2 {
		width: 55%;
		margin-left: 1%;
	}
	.products {
		grid-template-columns: 1fr;
	}
	.pop-mobiles-2 .products {
		grid-template-columns: 1fr;
	}
	.product-summary .price {
		display: inline;
		left: 0;
	}
	.account-text {
		display: none;
	}
	.fas {
		font-size: 1rem;
	}
	.pop-mobiles {
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
}

.product {
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid$color-border;
	.
	product-image
	{
	text-align
	:
	center;
	img
	{
	width
	:
	100px;
}

}
.product-details { .product-title { margin-right:20px;
	font-family: $ font-bold;
}

.product-description {
	margin: 5px 20px 5px 0;
	line-height: 1.4em;
}

}
.product-quantity {input { width:40px;
	
}

}
.remove-product {
	border: 0;
	padding: 4px 8px;
	background-color: #c66;
	color: #fff;
	font-family: $ font-bold;
	font-size: 12px;
	border-radius: 3px;
}

.remove-product:hover {
	background-color: #a44;
}

}

/* Totals section */
.totals { .totals-item { float:right;
	clear: both;
	width: 100%;
	margin-bottom: 10px; label { float : left;
	clear: both;
	width: 79%;
	text-align: right;
}

.totals-value {
	float: right;
	width: 21%;
	text-align: right;
}

}
.totals-item-total {
	font-family: $ font-bold;
}

}
.checkout {
	float: right;
	border: 0;
	margin-top: 20px;
	padding: 6px 25px;
	background-color: #6b6;
	color: #fff;
	font-size: 25px;
	border-radius: 3px;
}

.checkout:hover {
	background-color: rgb(23, 38, 172);
}

/* Make adjustments for tablet */
@media screen and (max-width: 650px) {
	.shopping-cart {
		margin: 0;
		padding-top: 20px;
		border-top: 1px solid$color-border;
	}
	.column-labels {
		display: none;
	}
	.product-image {
		float: right;
		width: auto;
	}
	.product-image img {
		margin: 0 0 10px 10px;
	}
	.product-details {
		float: none;
		margin-bottom: 10px;
		width: auto;
	}
	.product-price {
		clear: both;
		width: 70px;
	}
	.product-quantity {
		width: 100px;
	}
	.product-quantity input {
		margin-left: 20px;
	}
	.product-quantity:before {
		content: 'x';
	}
	.product-removal {
		width: auto;
	}
	.product-line-price {
		float: right;
		width: 70px;
	}
}

/* Make more adjustments for phone */
@media screen and (max-width: 350px) {
	.product-removal {
		float: right;
	}
	.product-line-price {
		float: right;
		clear: left;
		width: auto;
		margin-top: 10px;
	}
	.product .product-line-price:before {
		content: 'Item Total: $';
	}
	.totals { .totals-item { label { width:60%;
		
	}
	.totals-value {
		width: 40%;
	}
}

}
}
.buyItems h4 {
	color: #fff;
}
/*-------------media query for less than 600 screen size-----------*/

/*------------------------ offer -------------------*/
.offer {
	background: radial-gradient(rgb(255, 255, 255), #fccaca);
	margin-top: 80px;
	padding: 30px 0;
}

.col-2.offer-img {
	padding: 50px;
}

small {
	color: #555;
}

/*------------------------ END offer -------------------*/
</style>
<script>
	$(document).ready(function() {
	});

	function proCart(id) {
		alert("Add to Cart :"+(data-product-id));

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

	<div class="header">
		<div class="container">
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

			<div class="row">
				<div class="col-2">
					<div class="h1font">
						<p>
							<b>Everything You Need Is Under One Roof.</b>
						</p>
					</div>
					<p>
						&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Our
						passion is to deliver pleasure and nutrition throughout<br>peoples
						lives, through exciting and superior products, whenever and
						wherever they choose to eat and drink -
					</p>
					<a href=./productCus class="btn">Explore Now &#10141;</a>
				</div>
				<div class="col-2">
					<img src="<spring:url value="/resources/images/mainpic.png" />">
				</div>
			</div>
		</div>
	</div>

	<!-------------------Decorate bar------------------>
	<div class="dec-table1">
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/clock.png" />">&nbsp;&nbsp;Delivery
			within 24 Hours
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/deliver.png" />">&nbsp;&nbsp;Deliver
			to Doorstep
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/right.png" />">&nbsp;&nbsp;Freshness
			Guaranteed
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/click.png" />">&nbsp;&nbsp;Click
			and Collect
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="dec-container">
			<img src="<spring:url value="/resources/images/ok.png" />">&nbsp;&nbsp;Amazing
			Deals
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>

	<!-------------------Slide Show ------------------->


	<div class="img-slider">
		<div class="slide active">
			<a href="#"><img
				src="<spring:url value="/resources/images/banners/4.jpg" />" alt=""></a>

		</div>
		<div class="slide">
			<a href="#"><img
				src="<spring:url value="/resources/images/banners/1.jpg" />" alt=""></a>

		</div>
		<div class="slide">
			<a href="#"><img
				src="<spring:url value="/resources/images/banners/7.jpg" />" alt=""></a>

		</div>
		<div class="slide">
			<a href="#"><img
				src="<spring:url value="/resources/images/banners/3.jpg" />" alt=""></a>

		</div>
		<div class="slide">
			<a href="#"><img
				src="<spring:url value="/resources/images/banners/6.jpg" />" alt=""></a>

		</div>
		<div class="slide">
			<a href="#"><img
				src="<spring:url value="/resources/images/banners/5.jpg" />" alt=""></a>

			<!--
                    <div class="info">
                        <h2>Slide 04</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    -->
		</div>
		<!--
                <div class="slide">
                    <img src="5.jpg" alt="">
                </div>
            -->
		<div class="navigation">
			<div class="btn active"></div>
			<div class="btn"></div>
			<div class="btn"></div>
			<div class="btn"></div>
			<div class="btn"></div>
			<div class="btn"></div>
			<div class="btn"></div>
		</div>
	</div>


	<script type="text/javascript">
        var slides = document.querySelectorAll('.slide');
        var btns = document.querySelectorAll('.btn');
        let currentSlide = 1;

        // Javascript for image slider manual navigation
        var manualNav = function(manual) {
            slides.forEach((slide) => {
                slide.classList.remove('active');

                btns.forEach((btn) => {
                    btn.classList.remove('active');
                });
            });

            slides[manual].classList.add('active');
            btns[manual].classList.add('active');
        }

        btns.forEach((btn, i) => {
            btn.addEventListener("click", () => {
                manualNav(i);
                currentSlide = i;
            });
        });

        // Javascript for image slider autoplay navigation
        var repeat = function(activeClass) {
            let active = document.getElementsByClassName('active');
            let i = 1;

            var repeater = () => {
                setTimeout(function() {
                    [...active].forEach((activeSlide) => {
                        activeSlide.classList.remove('active');
                    });

                    slides[i].classList.add('active');
                    btns[i].classList.add('active');
                    i++;

                    if (slides.length == i) {
                        i = 0;
                    }
                    if (i >= slides.length) {
                        return;
                    }
                    repeater();
                }, 10000);
            }
            repeater();
        }
        repeat();
    </script>



	<!---------------End Slide Show --------------------->
	</div>


	<!-- Best sellers -->
	<div class="small-container">
		<div class="title ">
			Best <b>Sellers</b><br>
		</div>
		<div class="product-container">
			<!---------------AAAAAAAAAAALLLLLLLLL --------------------->
			<div class="products">
				<div class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/best seller/pro3.jpg" />"
								alt="" />
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="1">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Top Crust Bread</h4>
							<p>Top Crust Bread luctus quis et est. Integer pretium purus</p>
							<h6 class="price">
								<span class="product-card-original-price ">Rs 450.00 | </span>Rs
								<span class="priceValue">140</span> / Unit
							</h6>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/best seller/pro2.jpg " />"
								alt="" />
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="2">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Parakrama Dinner Bun 4S</h4>
							<p>Parakrama Dinner Bun 4S luctus quis et est. Integer
								pretium purus</p>
							<h6 class="price">
								<span class="product-card-original-price ">Rs 75.00 | </span>Rs
								<span class="priceValue">60</span> / Unit
							</h6>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/best seller/pro4.jpg" />"
								alt="" />
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="3">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">Big Onion</h4>
							<p>Big Onion luctus quis et est. Integer pretium purus</p>
							<h6 class="price">
								<span class="product-card-original-price ">Rs 145.00 | </span>Rs
								<span class="priceValue">140</span> / KG
							</h6>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="product-under">
						<figure class="product-image">
							<img
								src="<spring:url value="/resources/images/best seller/pro1.jpg " />"
								alt="" />
							<div class="product-over">
								<button class="btn btn-small addToCart" data-product-id="4">
									<i class="fas fa-cart-plus"></i>Add to cart
								</button>
							</div>
						</figure>
						<div class="product-summary">
							<h4 class="productName">RiceRed Kekulu Bulk Kg-Local</h4>
							<p>RiceRed Kekulu Bulk Kg-Locals quis et est. Integer pretium
								purus</p>
							<h6 class="price">
								<span class="product-card-original-price ">Rs 132.00 | </span>Rs
								<span class="priceValue">93</span> / KG
							</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
	<!-- END Best sellers -->



	<!-- Adds-->
	<div class="tableRow1">
		<table style="width: 100%">
			<tr>
				<td><a href="## "> <img
						src="<spring:url value="/resources/images/banners/msgBannerSection2A.jpg" />">
				</a></td>
				<td><a href="## "> <img
						src="<spring:url value="/resources/images/banners/msgBannerSection2B.jpg" />">
				</a></td>
			</tr>
		</table>
	</div>
	<!-- Adds END-->




	<!---------- offer ------------>
	<div class="offer">
		<div class="small-container">
			<div class="row">
				<div class="col-2">
					<img src="<spring:url value="/resources/images/exclusive.png" />"
						class="offer-img">
				</div>
				<div class="col-2">
					<p>Exclusively Available on Parakrama Store</p>
					<h1>Smart Band 4</h1>
					<small>The Mi Smart Band 4 features a 39.9% larger (than Mi
						Band 3) AMOLED color<br> full-touch display with adjustable
						brightness, so everything is clear as can be. Global shipments in
						smart watches alone are expected to take up 63.3% of that market
						share...<br>
					</small> <a href="##" class="btn">Buy Now &#8594;</a>
				</div>
			</div>
		</div>
	</div>
	<!---------- END offer ------------>

	<!-- featured products -->
	<div class="small-container">
		<div class="title ">
			Featured <b>Products</b>
		</div>
		<div class="products">
			<div class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/featured/pro10.jpg" />"
							alt="" />
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="5">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Watawala Kahata Tea Pouch 400g</h4>
						<p>Watawala Kahata Tea Pouch 400g quis et est. Integer pretium
							purus</p>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 550.00 | </span>Rs
							<span class="priceValue">500</span> / Unit
						</h6>
					</div>
				</div>
			</div>
			<div class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/featured/pro19.png" />"
							alt="" />
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="6">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Parakrama Dinner Bun 4S</h4>
						<p>Munchee Snacks Cracker 260g quis et est. Integer pretium
							purus</p>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 355.00 | </span>Rs
							<span class="priceValue">310</span> / Unit
						</h6>
					</div>
				</div>
			</div>
			<div class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/featured/pro11.jpg " />"
							alt="" />
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="7">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Baraka Wild Bees Honey 100% Pure 275g</h4>
						<p>Baraka Wild Bees Honey 100% Pure 275gs et est. Integer
							pretium purus</p>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 1450.00 | </span>Rs
							<span class="priceValue">1255</span> / KG
						</h6>
					</div>
				</div>
			</div>
			<div class="product">
				<div class="product-under">
					<figure class="product-image">
						<img
							src="<spring:url value="/resources/images/featured/13.jpg " />"
							alt="" />
						<div class="product-over">
							<button class="btn btn-small addToCart" data-product-id="8">
								<i class="fas fa-cart-plus"></i>Add to cart
							</button>
						</div>
					</figure>
					<div class="product-summary">
						<h4 class="productName">Ratthi Set Yoghurt Multi Pack 320G 4S</h4>
						<p>Ratthi Set Yoghurt Multi Pack 320G 4S et est. Integer
							pretium purus</p>
						<h6 class="price">
							<span class="product-card-original-price ">Rs 220.00 | </span>Rs
							<span class="priceValue">170</span> / KG
						</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END featured products -->


	<!-- shop by categories -->
	<div class="small-container ">
		<div class="categories ">
			<div class="title ">
				Shop By <b>Category</b>
			</div>
			<div class="tableRow ">

				<table style="width: 100%">
					<tr>
						<td rowspan="2 ">
							<div class="col-3 ">
								<a href=./fruitCatCus><img
									src="<spring:url value="/resources/images/category-1-fruit.png " />"
									style="width: 98%; height: auto;"></a>
							</div>
						</td>
						<td rowspan="2 ">
							<div class="col-3 ">
								<a href=./vegiCatCus><img
									src="<spring:url value="/resources/images/category-2-vegi.jpg " />"
									style="width: 98%; height: auto;"></a>
							</div>
						</td>
						<td rowspan="1 ">
							<div class="col-3 ">
								<a href=./meatCatCus><img
									src="<spring:url value="/resources/images/category-3-meat.png " />"
									style="width: 98%; height: auto;"></a>
							</div>
						</td>
						<td>
							<div class="col-3 ">
								<a href=./beautyCatCus><img
									src="<spring:url value="/resources/images/category-4-beauty.png " />"
									style="width: 98%; height: auto;"></a>
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="1 ">
							<div class="col-3 ">
								<a href=./homewareCatCus><img
									src="<spring:url value="/resources/images/category-5-home.png " />"
									style="width: 98%; height: auto;"></a>
							</div>
						</td>
						<td>
							<div class="col-3 ">
								<a href=./electronicCatCus><img
									src="<spring:url value="/resources/images/category-6-electronic.png " />"
									style="width: 98%; height: auto;"></a>
							</div>
						</td>
					</tr>
				</table>

			</div>
		</div>
	</div>
	<!-- END shop by categories -->

	<!------- Brands ------>
	<div class="brands">
		<div class="small-container">
			<div class="row">
				<div class="col-5">
					<img
						src="<spring:url value="/resources/images/brands/logo-coca-cola.png " />">
				</div>
				<div class="col-5">
					<img
						src="<spring:url value="/resources/images/brands/logo-godrej.png " />">
				</div>
				<div class="col-5">
					<img
						src="<spring:url value="/resources/images/brands/logo-oppo.png " />">
				</div>
				<div class="col-5">
					<img
						src="<spring:url value="/resources/images/brands/logo-paypal.png " />">
				</div>
				<div class="col-5">
					<img
						src="<spring:url value="/resources/images/brands/logo-philips.png " />">
				</div>
			</div>
		</div>
	</div>

	<!--- END Brands --------->

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