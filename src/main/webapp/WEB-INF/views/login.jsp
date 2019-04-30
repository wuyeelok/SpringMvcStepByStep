<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yahoo From JSP</title>
</head>
<%
	System.out.println("sds");
	Date date = new Date();
%>
<body>
	<h1>My Second JSP</h1>
	<p>Welcome ${name}</p>
	<p><%=date%></p>
</body>
</html>