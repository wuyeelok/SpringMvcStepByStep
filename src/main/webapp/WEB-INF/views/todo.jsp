<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<title>Add Todo Page</title>
</head>
<body>
	<div class="container">
		<h1>Add a Todo</h1>
		<form:form method="post" commandName="todo">

			<form:hidden path="id" />

			<fieldset class="form-group">
				<form:label path="desc">Description</form:label>
				<form:input path="desc" class="form-control" type="text"
					required="required" />
				<form:errors path="desc" cssClass="text-warning" />
			</fieldset>
			<input class="btn btn-success" type="submit" value="Submit" />
		</form:form>
	</div>

	<script src="webjars/jquery/3.4.1/jquery.slim.min.js"></script>
	<script src="webjars/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>