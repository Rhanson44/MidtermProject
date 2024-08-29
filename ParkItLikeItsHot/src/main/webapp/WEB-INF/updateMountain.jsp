<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Mountain</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/update.css">
</head>
<body>
	<jsp:include page="nav.jsp"/>
	<section class="bg-image" style="background-image: url('https://www.shutterstock.com/image-photo/alpine-alps-mountain-landscape-jungfraujoch-600nw-93960205.jpg');">
	<div class="mask">
	<br>
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
            <button type="submit">Update Mountain</button>
        </form>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>