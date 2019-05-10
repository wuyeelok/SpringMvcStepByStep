<%@ include file="common/header.jspf"%>

<div class="container">

	<%@ include file="common/navigation.jspf"%>

	<h1>Add a Todo</h1>
	<form:form method="post" commandName="todo">

		<form:hidden path="id" />

		<fieldset class="form-group">
			<form:label path="desc">Description</form:label>
			<form:input path="desc" class="form-control" type="text"
				required="required" />
			<form:errors path="desc" cssClass="text-warning" />
		</fieldset>

		<fieldset class="form-group">
			<form:label path="targetDate">Target Date</form:label>
			<form:input path="targetDate" class="form-control" type="text"
				required="required" />
			<form:errors path="targetDate" cssClass="text-warning" />
		</fieldset>
		<input class="btn btn-success" type="submit" value="Submit" />
	</form:form>
</div>

<%@ include file="common/footer.jspf"%>