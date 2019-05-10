<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a href="https://github.com/in28minutes/SpringMvcStepByStep"
				class="navbar-brand">in28Minutes GitHub</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="login">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="list-todos">View
							Todos</a></li>
					<li class="nav-item"><a class="nav-link" href="add-todo">Add
							Todo</a></li>
				</ul>
			</div>
		</nav>

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
						<td><fmt:formatDate pattern="dd/MM/yyyy"
								value="${todo.targetDate}" /></td>
						<td>${todo.done}</td>
						<td><a href="update-todo?id=${todo.id}"
							class="btn btn-warning">Edit</a> <a
							href="delete-todo?id=${todo.id}" class="btn btn-danger">Delete</a></td>
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