<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bean.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Area Personale</title>
</head>
<body>
	<%UserBean ub=(UserBean)request.getSession().getAttribute("user"); %>
	
	<h1>Hello <%=ub.getUsername() %></h1>
	<h2><a href="LogoutServlet">Logout</a></h2>
</body>
</html>