<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link href="/temp.css" rel="stylesheet" />
<link href="/style.css" rel="stylesheet" />
</head>
<body>
	<h1>Welcome to Graham's Hotel Search!</h1>
	<form action="/hotels">
		<label>Select City:</label>
		<select name="city">
			<option value="">City</option>
			<c:forEach items="${ cities }" var="c">
				<option <c:if test="${ c eq param.city }">selected</c:if>>${ c }</option>
			</c:forEach>
		</select>
		<div>
		<label>Max. Price:</label>
		<input type="number" name="maxPrice">
		</div>
		<p>
			<button type="submit">Submit</button>
		</p>
	</form>
</body>
</html>