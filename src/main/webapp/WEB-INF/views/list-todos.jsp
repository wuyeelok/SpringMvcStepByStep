<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<title>List Todos JSP</title>
</head>

<body>
	<div class="container">
		<h1>Hi ${name}</h1>

		<table class="table table-striped">
			<caption>Your Todos are</caption>
			<thead>
				<tr>
					<th>Description</th>
					<th>Target Date</th>
					<th>Is Completed?</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${todos}" var="todo">
					<tr>
						<td>${todo.desc}</td>
						<td>${todo.targetDate}</td>
						<td>${todo.done}</td>
						<td><a href="update-todo?id=${todo.id}" class="btn btn-warning">Edit</a>
							<a href="delete-todo?id=${todo.id}" class="btn btn-danger">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div>
			<a class="btn btn-success" href="add-todo">Add</a>
		</div>

	</div>

	<script src="webjars/jquery/3.4.1/jquery.slim.min.js"></script>
	<script src="webjars/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>