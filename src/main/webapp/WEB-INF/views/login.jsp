<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yahoo From JSP</title>
</head>

<body>
	<h1>My Second JSP</h1>

	<form action="/login.do" method="post">
		<label for="name">Enter your name</label><br /> <input type="text"
			id="name" name="name" /><br /> <input type="submit" value="Login" />
	</form>
</body>
</html>