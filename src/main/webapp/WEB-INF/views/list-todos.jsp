<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Todos JSP</title>
</head>

<body>
	<h1>Hi ${name}</h1>
	<p>Your Todos are</p>
	<c:forEach items="${todos}" var="todo">
		${todo.id} ${todo.desc} ${todo.user}<br />
	</c:forEach>

	<br />
	<a href="/add-todo">Add</a>
</body>
</html>