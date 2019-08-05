<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link href="/temp.css" rel="stylesheet" />
<link href="/style.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<h1>${ hotel.name }</h1>
		<table class="table">
			<tr>
				<th scope="row">Name</th>
				<td>${hotel.name}</td>
			</tr>
			<tr>
				<th scope="row">Price per Night</th>
				<td>$${hotel.pricePerNight}</td>
			</tr>
		</table>
		<a class="btn link" href="/">Home</a>
		
		</div>
</body>
</html>