<%@ include file="common/header.jspf"%>

<div class="container">

	<%@ include file="common/navigation.jspf"%>

	<h1>My Second JSP</h1>
	<p>${errorMessage}</p>
	<form action="login" method="post">
		<label for="name">Enter your name</label><br /> <input type="text"
			id="name" name="name" /><br /> <label for="password">Enter
			your password</label><br /> <input type="password" id="password"
			name="password" /><br /> <br /> <input type="submit" value="Login" />
	</form>
	<br />
	<table class="table table-striped">
		<caption>Some Interesting Effect to Remind you to use
			Relative Path</caption>
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
			<tr>
				<td>Request URL</td>
				<td>n/a</td>
				<td>request.getRequestURL().toString()</td>
				<td>${requestURL}</td>
			</tr>
			<tr>
				<td>Request pathInfo</td>
				<td>n/a</td>
				<td>request.getPathInfo()</td>
				<td>${pathInfo}</td>
			</tr>
		</tbody>
	</table>
</div>

<%@ include file="common/footer.jspf"%>