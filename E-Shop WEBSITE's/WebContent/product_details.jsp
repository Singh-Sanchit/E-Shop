<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Description</title>
<script type="text/javascript">
function review() {
	alert("Your Review will be displayed after 48 hours, As it has to be checked for spam");
}
</script>
</head>
<body>
	<c:import url="header1.jsp"></c:import>

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!--  Product Details -->
				<c:forEach var="p" items="${list }">
					<c:if test="${p.getPid() == pid }">
						<div class="product product-details clearfix">
							<div class="col-md-4">
								<div id="product-main-view">
									<div class="product-view">
										<img src="./img/<c:out value="${p.getImage() }"/>" width="50"
											height="450" alt="">
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="product-body">
									<h2 class="product-name">
										<c:out value="${p.getPname() }" />
									</h2>
									<h3 class="product-price">
										<c:out value="${p.getPrice() }" />
									</h3>
									<p>
										<strong>Availability:</strong> In Stock
									</p>
									<p>
										<strong>Brand:</strong> E-SHOP
									</p>
									<p>
										<c:out value="${p.getShort_desc() }" escapeXml="false" />
									</p>
									<a
										href="Controller?id=addtocart&flag=100&cat_id=<c:out value="${cid }"/>&pid=<c:out value="${p.getPid() }"/>"
										class="primary-btn add-to-cart"><i
										class="fa fa-shopping-cart"></i>Add to Cart</a> <font color="red"
										size="3"><c:out value="${msg }" /></font>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="product-tab">
								<ul class="tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
									<li><a data-toggle="tab" href="#tab1">Details</a></li>
									<li><a data-toggle="tab" href="#tab2">Reviews (3)</a></li>
								</ul>
								<div class="tab-content">
									<div id="tab1" class="tab-pane fade in active">
										<p>
											<c:out value="${p.getDescription() }" escapeXml="false" />
										</p>
									</div>
									<div id="tab2" class="tab-pane fade in">

										<div class="row">
											<div class="col-md-6">
												<div class="product-reviews">
													<div class="single-review">
														<div class="review-heading">
															<div>
																<a href="#"><i class="fa fa-user-o"></i> Sanchit
																	Singh</a>
															</div>
															<div>
																<a href="#"><i class="fa fa-clock-o"></i> 27 DEC
																	2017 / 8:0 PM</a>
															</div>
															<div class="review-rating pull-right">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star-o empty"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Nice Product To use and with strong hardware</p>
														</div>
													</div>

													<div class="single-review">
														<div class="review-heading">
															<div>
																<a href="#"><i class="fa fa-user-o"></i> Shawn
																	Michael</a>
															</div>
															<div>
																<a href="#"><i class="fa fa-clock-o"></i> 04 SEP
																	2017 / 10:0 AM</a>
															</div>
															<div class="review-rating pull-right">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Not so good product to try out and the thing is
																after buying the service is not good and the employee
																doesnt responsed on time</p>
														</div>
													</div>
													<div class="single-review">
														<div class="review-heading">
															<div>
																<a href="#"><i class="fa fa-user-o"></i> Synthia
																	Dane</a>
															</div>
															<div>
																<a href="#"><i class="fa fa-clock-o"></i> 01 MAY
																	2018 / 8:0 PM</a>
															</div>
															<div class="review-rating pull-right">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Great experience by using this product</p>
														</div>
													</div>
													<ul class="reviews-pages">
														<li class="active">1</li>
														<li><a href="#">2</a></li>
														<li><a href="#">3</a></li>
														<li><a href="#"><i class="fa fa-caret-right"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="col-md-6">
												<h4 class="text-uppercase">Write Your Review</h4>
												<p>Your email address will not be published.</p>
												<form class="review-form">
													<div class="form-group">
														<input class="input" type="text" placeholder="Your Name" />
													</div>
													<div class="form-group">
														<input class="input" type="email"
															placeholder="Email Address" />
													</div>
													<div class="form-group">
														<textarea class="input" placeholder="Your review"></textarea>
													</div>
													<div class="form-group">
														<div class="input-rating">
															<strong class="text-uppercase">Your Rating: </strong>
															<div class="stars">
																<input type="radio" id="star5" name="rating" value="5" /><label
																	for="star5"></label> <input type="radio" id="star4"
																	name="rating" value="4" /><label for="star4"></label>
																<input type="radio" id="star3" name="rating" value="3" /><label
																	for="star3"></label> <input type="radio" id="star2"
																	name="rating" value="2" /><label for="star2"></label>
																<input type="radio" id="star1" name="rating" value="1" /><label
																	for="star1"></label>
															</div>
														</div>
													</div>
													<button class="primary-btn" onclick="review()">Submit</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<!-- /Product Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
	<c:import url="footer.jsp"></c:import>
</body>
</html>