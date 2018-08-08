<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Top 10 Songs</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<div class="navbarLeft">
		<p id="p1">Top Ten Songs</p>
	</div>
	
	
	<div id="dashDiv">
		<span>xxxxxxxxxxx</span>
		<a href="/dashboard">Dashboard</a>
	</div>

	<table>
		<thead>
			<tr>
				<th>Title</th>
				<th>Rating</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items = "${songList }" var = "song">
			<tr>
				<td>
					<a href="/${song.id}">
						<c:out value="${song.title}"/></a>
				</td>
				<td><c:out value="${song.rating}"/></td>
				<td>
					<a href="/delete/${song.id}">Delete</a>											
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>