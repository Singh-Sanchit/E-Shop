<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:import url="header.jsp"></c:import>
<h1>Welcome Admin</h1>
<c:out value="${msg }"></c:out> <BR>
<a href="<%=request.getContextPath() %>/Admin?id=add_category">Add Category</a> <BR>
<a href="<%=request.getContextPath() %>/Admin?id=add_product">Add Product</a><BR>
<a href="<%=request.getContextPath() %>/Admin?id=sales_report">Sales Report</a><BR>
<hr>
<h1>All Categories</h1>
<c:forEach items="${cat_list }" var="cat">
<a href="Controller?id=show_product&cat_id=<c:out value="${cat.getId() }"></c:out>">
<c:choose>
<c:when test='${cat.getStatus() == "false" }'>
<font color="red"><c:out value="${cat.getName() }"></c:out> </font>
</c:when>
<c:otherwise><c:out value="${cat.getName() }"></c:out> </c:otherwise>
</c:choose>
 
 </a>  &nbsp;&nbsp;&nbsp;
<c:choose>
<c:when test='${cat.getStatus() == "false" }'>
<a href="<%=request.getContextPath() %>/Admin?id=activate_cat&cat_id=<c:out value="${cat.getId() }"></c:out>">Activate</a>
 <BR>
</c:when>
<c:otherwise>
 <a href="<%=request.getContextPath() %>/Admin?id=delete_cat&cat_id=<c:out value="${cat.getId() }"></c:out>">de-activate</a>
 <BR>
</c:otherwise>
</c:choose>

</c:forEach>

</body>
</html>