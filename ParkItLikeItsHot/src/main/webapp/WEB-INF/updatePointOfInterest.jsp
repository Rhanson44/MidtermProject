<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Point Of Interest</title>
</head>
<body>
	<h2>Edit Point Of Interest</h2>
	<c:choose>
    <c:when test="${not empty updatedPointOfInterest}">
        <form action="updatePointOfInterest.do" method="POST">
    <input type="hidden" name="id" value="${updatedPointOfInterest.id}" />

    <label for="pointOfInterestName">Name:</label>
    <input type="text" id="pointOfInterestName" name="name" value="${updatedPointOfInterest.name}"><br><br> 

    <label for="pointOfInterestDescription">Description:</label>
    <input type="text" id="pointOfInterestDescription" name="description" value="${updatedPointOfInterest.description}"><br><br>

    <label for="pointOfInterestLongitude">Longitude:</label>
    <input type="text" id="pointOfInterestLongitude" name="longitude" value="${updatedPointOfInterest.longitude}"><br><br>
    
    <label for="pointOfInterestLatitude">Latitude:</label>
    <input type="text" id="pointOfInterestLatitude" name="latitude" value="${updatedPointOfInterest.latitude}"><br><br> 

    <label for="pointOfInterestImageUrl">Image URL:</label>
    <input type="text" id="pointOfInterestImageUrl" name="imageUrl" value="${updatedPointOfInterest.imageUrl}" ><br><br>
            <br>
            <br>
            <button type="submit">Update Point Of Interest</button>
        </form>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</body>
</html>