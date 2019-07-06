<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body>
<c:import url="header.jsp"></c:import>


<!-- HOME -->
	<div id="home">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
				<!-- home slick -->
				<div id="home-slick">

<c:forEach var="p" items="${list }">
	<c:if test="${p.getCat().getId() == cid}">

					<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single">
						<div class="product-thumb">
							<a href="Controller?id=show_product_details&pid=<c:out value="${p.getPid() }"/> "><button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button></a>
							<img src="img/<c:out value="${p.getImage() }"/>" width="100%" height="100%">
						</div>
						<div class="product-body">
							<h3 class="product-price">Rs.<c:out value="${p.getPrice() }"/></h3>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name"><a href="Controller?id=show_product_details&pid=<c:out value="${p.getPid() }"/> "><c:out value="${p.getPname() }"/></a></h2>
							<div class="product-btns">
								<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
								<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
								<a href="Controller?id=addtocart&cat_id=<c:out value="${cid }"/>&pid=<c:out value="${p.getPid() }"/>"   class="primary-btn add-to-cart"  ><i class="fa fa-shopping-cart"></i>Add to Cart</a>						
								<c:if test="${param.pid == p.getPid() }">
									<font color="red" size="3"><c:out value="${msg }"/></font>
								</c:if>
			
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->
	</c:if>
</c:forEach>
				</div>
				<!-- /home slick -->
			</div>
			<!-- /home wrap -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->
	<c:import url="footer.jsp"></c:import>
</body>
</html>