<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Register Vendor</h1>
	<form action="register" method="post">
		Name :<input name="name" type="text"/><br>
		Email :<input name="email" type="text"/><br>
		Password :<input name="password" type="password"/><br>
		<input type="submit" value="Register">
	</form>
	<br/>
	<h1>Login Vendor</h1>
	<form action="login" method="post">
		Email :<input name="email" type="text"/><br>
		Password<input name="password" type="password"/><br>
		<input type="submit" value="Login">
	</form>
	<br/>
</body>
</html>