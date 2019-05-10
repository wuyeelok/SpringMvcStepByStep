<%@ include file="common/header.jspf"%>

<div class="container">

	<%@ include file="common/navigation.jspf"%>

	<h1>Welcome ${name}, Password is ${password}</h1>
	<p>
		Now you can <a href="list-todos">manage your todos.</a>
	</p>
</div>

<%@ include file="common/footer.jspf"%>