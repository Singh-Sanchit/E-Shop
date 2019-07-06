<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Cart</title>
</head>
<body>
<c:import url="header1.jsp"></c:import>
<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

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
								<a href="Controller?id=checkout"><button class="primary-btn">Check-Out</button></a>
							</div>
						</div>
					</div>
				
				</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->


<c:import url="footer.jsp"></c:import>
</body>
</html>