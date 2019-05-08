<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="webjars/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/app.css">

<title>Yahoo From JSP</title>
</head>

<body>
	<div class="container">
		<h1>My Second JSP</h1>
		<p>${errorMessage}</p>
		<form
			action="${pageContext.request.contextPath}${requestScope['javax.servlet.forward.servlet_path']}/login"
			method="post">
			<label for="name">Enter your name</label><br /> <input type="text"
				id="name" name="name" /><br /> <label for="password">Enter
				your password</label><br /> <input type="password" id="password"
				name="password" /><br />
			<br /> <input type="submit" value="Login" />
		</form>
		<br />
		<table class="table table-striped">
			<caption>Important Config Info</caption>
			<thead>
				<tr>
					<td>Name</td>
					<td>Defined in File</td>
					<td>How to get the value in Controller</td>
					<td>Value</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>build plugin tomcat configuration path</td>
					<td>pom.xml</td>
					<td>request.getServletContext().getContextPath()</td>
					<td>${requestServletContextPath}</td>
				</tr>
				<tr>
					<td>DispatcherServlet servlet-mapping url-pattern</td>
					<td>web.xml</td>
					<td>request.getServletPath()</td>
					<td>${requestServletPath}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<script src="webjars/jquery/3.4.1/jquery.slim.min.js"></script>
	<script src="webjars/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>