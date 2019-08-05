<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels in ${ city }</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<link href="/style.css" rel="stylesheet" />
</head>
<body>
	<h1>Hotels in ${ city }</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Name</th><th>Price per Night</th><th>Rating</th><th>Upvote</th><th>Downvote</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ hotels }" var="h">
				<tr>
					<td><a href="/details?id=${ h.id }">${ h.name }</a></td>
					<td>$${ h.pricePerNight }</td>
					<td>${ h.rating }</td>
					<td><a href="/upvote?id=${ h.id }">Upvote</a></td>
					<td><a href="/downvote?id=${ h.id }">Downvote</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="/">Home</a>
</body>
</html>