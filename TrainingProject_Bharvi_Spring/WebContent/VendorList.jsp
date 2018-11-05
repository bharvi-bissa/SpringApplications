<%@page import="java.util.List"%>
<%@page import="com.tadigital.mvc.entity.Vendor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<th>ID</th>
		<th>Name</th>
		<th>Email</th>
	<%
		int i=0;
		List<Vendor> vendorList = (List)session.getAttribute("VENDORLIST");
		for(Vendor vendor : vendorList){
			i++;
			%>
			<tr>
				<td><%= vendor.getId() %></td>
				<td><%= vendor.getName() %></td>
				<td><%= vendor.getEmail() %></td>
				<td><a href="/vendoredit<%= vendor.getId() %>">Edit</a>&nbsp;&nbsp;</td>
				<td><a href="/vendordelete<%= vendor.getId() %>">Delete</a></td>
			</tr>
	<%
	}
	%>
	
	</table>
</body>
</html>