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

<title>Add Todo Page</title>
</head>
<body>
	<div class="container">
		<h1>Add a Todo</h1>
		<form method="post">
			<fieldset class="form-group">
				<label for="desc">Description</label> <input class="form-control"
					id="desc" name="desc" type="text" required="required" />
			</fieldset>
			<input class="btn btn-success" type="submit" value="Add" />
		</form>
	</div>

	<script src="webjars/jquery/3.4.1/jquery.slim.min.js"></script>
	<script src="webjars/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>