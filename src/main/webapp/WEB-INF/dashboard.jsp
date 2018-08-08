<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Lookify</title>
  	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<div class="navbarLeft">
		<a href="/newForm">Add New Song</a>
		<a href="/showTopSongs">Top Songs</a>	
	</div>
	<div id="searchDiv">
	
		<form method="POST" action = "/search">	
			<input type="text" name="artist" value=""/>				
			<input type="submit" value="Search Artist"/>
		</form>

	</div>
	
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Artist</th>
				<th>Rating</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items = "${allSongs }" var = "song">
			<tr>
				<td><c:out value="${song.id}"/></td>
				<td>
					<a href="/${song.id}">
						<c:out value="${song.title}"/></a>
				</td>
				<td><c:out value="${song.artist}"/></td>
				<td><c:out value="${song.rating}"/></td>
				<td>
					<a href="/edit/${song.id}">Edit</a>
					<a href="/delete/${song.id}">Delete</a>											
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>