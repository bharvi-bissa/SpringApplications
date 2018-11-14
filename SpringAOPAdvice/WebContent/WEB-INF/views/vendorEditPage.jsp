<%@page import="com.tadigital.entity.Vendor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
		Vendor vendor = (Vendor)session.getAttribute("VENDORTOEDIT");
		
	%>
	<form action="/vendorEditAction" method="post">
		id : <input name="id" value="<%= vendor.getId() %>" />
		name : <input name="name" value="<%= vendor.getName() %>"/>
		Email : <input name="email" value="<%= vendor.getEmail() %>"/>
		<input type="submit" value="edit">
	</form>
	
</body>
</html>