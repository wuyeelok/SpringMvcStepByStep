<%@ include file="common/header.jspf"%>

<div class="container">

	<%@ include file="common/navigation.jspf"%>

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

<%@ include file="common/footer.jspf"%>