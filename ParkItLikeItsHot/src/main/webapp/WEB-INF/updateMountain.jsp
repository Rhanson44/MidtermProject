<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Mountain</title>
</head>
<body>
	<h2>Edit Mountain</h2>
	<c:choose>
    <c:when test="${not empty updatedMountain}">
        <form action="updateMountain.do" method="POST">
    <input type="hidden" name="id" value="${updatedMountain.id}" />

    <label for="mountainName">Name:</label>
    <input type="text" id="mountainName" name="name" value="${updatedMountain.name}"><br><br> 

    <label for="mountainElevationInMeters">Elevation (in meters):</label>
    <input type="text" id="mountainElevationInMeters" name="elevation" value="${updatedMountain.elevationInMeters}"><br><br>

    <label for="mountainAverageSnowfall">Average Snowfall (in inches):</label>
    <input type="text" id="mountainAverageSnowfall" name="snowfall" value="${updatedMountain.averageSnowfall}"><br><br>
    
    <label for="mountainDescription">Description:</label>
    <input type="text" id="mountainDescription" name="description" value="${updatedMountain.description}"><br><br> 

    <label for="mountainImageUrl">Image URL:</label>
    <input type="text" id="mountainImageUrl" name="imageUrl" value="${updatedMountain.imageUrl}" ><br><br>
            <br>
            <br>
            <button type="submit">Update Mountain</button>
        </form>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</body>
</html>