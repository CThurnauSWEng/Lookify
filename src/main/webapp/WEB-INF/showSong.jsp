<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<div class="navbar">
		<a href="/dashboard">Dashboard</a>
	</div>

	<h1>Title<span>xxxxxxxxxx</span>${song.title }</h1>
   	<h1>Artist<span>xxxxxxxxx</span>${song.artist }</h1>
	<h1>Rating<span>xxxxxxxx</span>${song.rating }</h1>

	<p><span>xxxxx</span><a href="/delete/${song.id }">Delete</a></p>

</body>
</html>