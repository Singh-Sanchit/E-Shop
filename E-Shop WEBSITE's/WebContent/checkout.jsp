<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Proceed to Payment</title>
<script type="text/javascript">
function checkout() {
	alert("Payment Successfull\nAcknowledgement Number is been sent to your EmailID");
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
				<form id="checkout-form" class="clearfix" onsubmit="checkout()">
					<div class="col-md-6">
						<div class="billing-details">
							<p>Already a customer ? <a href="#">Login</a></p>
							<div class="section-title">
								<h3 class="title">Billing Details</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="first-name" placeholder="First Name">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="Last Name">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address" placeholder="Address">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="City">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="country" placeholder="Country">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="zip-code" placeholder="ZIP Code">
							</div>
							<div class="form-group">
								<input class="input" type="tel" name="tel" placeholder="Telephone">
							</div>
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="register">
									<label class="font-weak" for="register">Create Account?</label>
									<div class="caption">
										<p>Other details have already been entered just proceed by creating your new password.
											<p>
												<input class="input" type="password" name="password" placeholder="Enter Your Password">
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="shiping-methods">
							<div class="section-title">
								<h4 class="title">Shipping Methods</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-1" checked>
								<label for="shipping-1">Free Shipping -  $0.00</label>
								<div class="caption">
									<p>Excludes all the shipping charges and the delivery is estimated between 3-5 working days.</p>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-2">
								<label for="shipping-2">Fast Service - $4.00</label>
								<div class="caption">
									<p>Includes paid shipping charges but the delivery is ensured to be made in 24 hours. </p>
								</div>
							</div>
						</div>

						<div class="payments-methods">
							<div class="section-title">
								<h4 class="title">Payments Methods</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-1" checked>
								<label for="payments-1">Direct Bank Transfer</label>
								<div class="caption">
									<p> Available for BillDesk Payment option only.</p>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-3">
								<label for="payments-3">Paypal System</label>
								<div class="caption">
									<p>Available only for Debit and Credit card options.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">Order Review</h3>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr>
										<th>Product</th>
										<th></th>
										<th class="text-center">Price</th>
										<th class="text-center">Quantity</th>
										<th class="text-center">Total</th>
										<th class="text-right"></th>
									</tr>
								</thead>
								<tbody>								
								<c:set value="0" var="total"></c:set>
								<c:forEach var="p" items="${list}">
									<c:forEach var="pid" items="${cart_list}">
										<c:choose>
											<c:when test="${p.getPid() == pid.getPid() }">	
											<tr>
											<td class="thumb"><img src="img/<c:out value="${p.getImage() }"/>"></td>
											<td class="details">
											<a href="#"><c:out value="${p.getPname() }"/></a>
												<ul>
													<li><span>Category: <c:out value="${p.getCat().getName() }"/></span></li>
													<li><span>Details: <c:out value="${p.getShort_desc() }"/></span></li>
												</ul>
											</td>
											<td class="price text-center"><strong>Rs.<c:out value="${p.getPrice() }"/></strong></td>
											<td class="qty text-center"><input class="input" type="text" value="1"></td>
											<td class="total text-center"><strong class="primary-color">Rs.<c:out value="${p.getPrice() }"/></strong></td>
											<td class="text-right"><a href="Controller?id=deletefromcart&pid=<c:out value="${p.getPid() }"/>"><button ><i class="fa fa-close"></i></button></a></td>
											<c:set var="total" value="${total + p.getPrice()}"></c:set>
											</tr>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>SUBTOTAL</th>
										<th colspan="2" class="sub-total">Rs. <c:out value="${total }"/></th>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>SHIPING</th>
										<td colspan="2">Free Shipping</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>TOTAL</th>
										<th colspan="2" class="total">Rs. <c:out value="${total }"/></th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<button class="primary-btn">Place Order</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
<c:import url="footer.jsp"></c:import>
</body>
</html>