<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Edit Song</title>
 	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
	<div class="navbar">
		<a href="/dashboard">Dashboard</a>
		<span>x</span>
		<a href="/delete/${song.id }">Delete</a>
	</div>

	<form:form method="POST" action="/processEdit/${song.id}" modelAttribute="song">
		<form:label path="title">Title
		<form:errors path="title"/>
		<span>xxxxxxxxxx</span>
		<form:input path="title"/></form:label>
		
		<form:label path="artist">Artist
		<form:errors path="artist"/>
		<span>xxxxxxxxx</span>
		<form:input path="artist"/></form:label>
		
		<form:label path="rating">Rating
		<form:errors path="rating"/>
		<span>xxxxxxxx</span>
		<form:input path="rating"/></form:label>
				
		<input type="submit" value="Submit" id="editSubmit"/>
	</form:form>

</body>
</html>