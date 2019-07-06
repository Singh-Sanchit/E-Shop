<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Add Product</h1>
<!-- step 1 -- Create Connection -->
<sql:setDataSource user="root" password="" driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/shop" var="ds" />

<!-- Step 2 fetch the data -->
<form method="post" action="<%=request.getContextPath() %>/Admin">
<input type="hidden" name="id" value="add_product_form">
Select Category: <select name="cat_id">
<c:forEach var="c" items="${result.rows }">
<option value="<c:out value="${c.cat_id }"></c:out>">
<c:out value="${c.cname }"></c:out></option>
</c:forEach>
</select> <BR>
Product Name: <input type="text" name="pname"> <BR> 
Product Price: <input type="text" name="pprice"> <BR> 
Short Desc:<input type="text" name="short_desc"> <BR> 
Full Description: <input type="text" name="description"> <BR> <BR>
<input type="submit" value="Add Product">
</form>
</body>
</html>