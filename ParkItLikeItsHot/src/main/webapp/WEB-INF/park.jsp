<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Found Park</title>
</head>
<body>
<h1>All Parks</h1>
	<c:forEach var="park" items="${parks}">
		${park.name} - ${park.state}
		<a href="${park.imageUrl}" alt="park image"></a>
		${park.description}
		Price of entry: ${park.price}
		<a href="${park.websiteUrl}" alt="website url"></a>
	</c:forEach>
</body>
</html>