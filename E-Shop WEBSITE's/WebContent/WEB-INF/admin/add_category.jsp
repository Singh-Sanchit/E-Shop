<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Add Category</h1>

<form method="post" action="<%=request.getContextPath() %>/Admin">
<input type="hidden" name="id" value="add_category_form">
Add Category: <input type="text" name="name" /> <BR><BR>
<input type="submit" value="Add Category">

</form>
</body>
</html>