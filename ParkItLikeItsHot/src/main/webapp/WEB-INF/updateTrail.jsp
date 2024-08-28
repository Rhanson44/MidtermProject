<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Trail</title>
</head>
<body>
	<h2>Edit Trail</h2>
	<c:choose>
    <c:when test="${not empty updatedTrail}">
        <form action="updateTrail.do" method="POST">
    <input type="hidden" name="id" value="${updatedTrail.id}" />

    <label for="trailName">Name:</label>
  <input type="text" id="trailName" name="name" value="${updatedTrail.name}" required><br><br> 

    <label for="trailDescription">Description:</label>
    <input type="text" id="trailDescription" name="description" value="${updatedTrail.description}"><br><br>

    <label for="trailLatitude">Latitude:</label>
    <input type="number" id="trailLatitude" name="latitude" value="${updatedTrail.latitude}"><br><br>

    <label for="trailLongitude">Longitutde:</label>
    <input type="number" id="trailLongitude" name="longitude" value="${updatedTrail.longitude}" ><br><br>

    <label for="trailLength">Length (miles):</label>
    <input type="number" id="trailLengthInMiles" name="lengthInMiles" value="${updatedTrail.lengthInMiles}"><br><br>

    <label for="trailDifficulty">Difficulty:</label>
    <input type="text" id="trailDifficulty" name="trailDifficulty" value="${updatedTrail.trailDifficulty}"><br><br>


            <br>
            <br>
            <button type="submit">Update Trail</button>
        </form>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>

    <a href="home.do">Return to Home</a>

</body>
</html>