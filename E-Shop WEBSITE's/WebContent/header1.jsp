<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />



</head>
<body>
	<!-- HEADER -->

	<c:set var="count" value="0"></c:set>
	<c:set var="total" value="0"></c:set>
	<c:forEach var="p" items="${cart_list }">
		<c:set var="count" value="${count+1 }"></c:set>
		<!-- count= count+1 -->
		<c:set var="total" value="${total + p.getPrice()}"></c:set>

	</c:forEach>
	<header> <!-- top Header -->
	<div id="top-header">
		<div class="container">
			<div class="pull-left">
				<span>Welcome to Shopping-Corner!</span>
			</div>
		</div>
	</div>
	<!-- /top Header --> <!-- header -->
	<div id="header">
		<div class="container">
			<div class="pull-left">
				<!-- Logo -->
				<div class="header-logo">
					<a class="logo" href="#"> <img src="img/shop.png" alt="">
					</a>
				</div>
				<!-- /Logo -->

				<!-- Search -->
				<div class="header-search">
					<form>
						<input class="input search-input" type="text"
							placeholder="Enter your keyword"> <select
							class="input search-categories">
							<option value="0">All Categories</option>
							<c:forEach items="${cat_list }" var="cat">
								<c:if test='${cat.getStatus() == "true"}'>
									<option value="<c:out value="${cat.getId() }"></c:out>"><c:out
											value="${cat.getName() }"></c:out></option>
								</c:if>
							</c:forEach>
						</select>
						<button class="search-btn">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
				<!-- /Search -->
			</div>
			<div class="pull-right">
				<ul class="header-btns">
					<!-- Account -->
					<li class="header-account dropdown default-dropdown">
						<div class="dropdown-toggle" role="button" data-toggle="dropdown"
							aria-expanded="true">
							<div class="header-btns-icon">
								<i class="fa fa-user-o"></i>
							</div>
							<strong class="text-uppercase">My Account <i
								class="fa fa-caret-down"></i></strong>
						</div> <a href="#" class="text-uppercase">Login</a> / <a href="#"
						class="text-uppercase">Join</a>
						<ul class="custom-menu">
							<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
							<li><a href="#"><i class="fa fa-check"></i> Checkout</a></li>
							<li><a href="#"><i class="fa fa-unlock-alt"></i> Login</a></li>
							<li><a href="#"><i class="fa fa-user-plus"></i> Create
									An Account</a></li>
						</ul>
					</li>
					<!-- /Account -->

					<!-- Cart -->
					<li class="header-cart dropdown default-dropdown"><a
						class="dropdown-toggle" data-toggle="dropdown"
						aria-expanded="true">
							<div class="header-btns-icon">
								<i class="fa fa-shopping-cart"></i> <span class="qty"><c:out
										value="${count }"></c:out></span>
							</div> <strong class="text-uppercase">My Cart:</strong> <br> <span>Rs.<c:out
									value="${total }"></c:out></span>
					</a>
						<div class="custom-menu">
							<div id="shopping-cart">
								<div class="shopping-cart-list">

									<c:forEach var="pro" items="${cart_list }">

										<div class="product product-widget">
											<div class="product-thumb">
												<img src="./img/<c:out value="${pro.getImage() }"></c:out>"
													alt="">
											</div>
											<div class="product-body">
												<h3 class="product-price">
													<c:out value="${pro.getPrice() }"></c:out>
												</h3>
												<h2 class="product-name">
													<a href="#"><c:out value="${pro.getPname() }"></c:out></a>
												</h2>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="shopping-cart-btns">
									<a href="Controller?id=showcart"><button class="main-btn">View
											Cart</button></a> <a href="Controller?id=checkout"><button
											class="primary-btn">
											Checkout <i class="fa fa-arrow-circle-right"></i>
										</button></a>
								</div>
							</div>
						</div></li>
					<!-- /Cart -->

					<!-- Mobile nav toggle-->
					<li class="nav-toggle">
						<button class="nav-toggle-btn main-btn icon-btn">
							<i class="fa fa-bars"></i>
						</button>
					</li>
					<!-- / Mobile nav toggle -->
				</ul>
			</div>
		</div>
		<!-- header -->
	</div>
	<!-- container --> </header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav show-on-click">
					<span class="category-header">Categories <i
						class="fa fa-list"></i></span>
					<ul class="category-list">

						<c:forEach items="${cat_list }" var="cat">

							<c:if test='${cat.getStatus() == "true"}'>
								<li><a
									href="Controller?id=show_product&cat_id=<c:out value="${cat.getId() }"></c:out>"><c:out
											value="${cat.getName() }"></c:out></a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<!-- /category nav -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>