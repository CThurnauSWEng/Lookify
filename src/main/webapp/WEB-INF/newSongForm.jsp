<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>New Song</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<form:form method="POST" action="/new" modelAttribute="song">
		<form:label path="title">Title
		<form:errors path="title"/>
		<span>xxxx</span>
		<form:input path="title" id="titleInput"/></form:label>
		
		<form:label path="artist">Artist
		<form:errors path="artist"/>
		<span>xxx</span>
		<form:input path="artist" id="artistInput"/></form:label>
		
		<form:label path="rating">Rating
		<form:errors path="rating"/>
		<span>xx</span>
		<form:input path="rating" id="ratingInput"/></form:label>
				
		<input type="submit" value="Submit" id="newSubmit"/>
	</form:form>

</body>
</html>