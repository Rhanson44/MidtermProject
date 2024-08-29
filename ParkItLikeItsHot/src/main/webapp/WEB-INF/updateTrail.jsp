<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Trail</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/update.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <section class="bg-image" style="background-image: url('https://iucn.org/sites/default/files/content/images/2020/shutterstock_116041936.png');">
        <div class="mask">
            <h2>Edit Trail</h2>
            <c:choose>
                <c:when test="${not empty updatedTrail}">
                    <form action="updateTrail.do" method="POST">
                        <input type="hidden" name="id" value="${updatedTrail.id}" />

                        <label for="trailName">Name:</label>
                        <input type="text" id="trailName" name="name" value="${updatedTrail.name}" required><br>

                        <label for="trailDescription">Description:</label>
                        <input type="text" id="trailDescription" name="description" value="${updatedTrail.description}"><br>

                        <label for="trailLatitude">Latitude:</label>
                        <input type="number" id="trailLatitude" name="latitude" value="${updatedTrail.latitude}"><br>

                        <label for="trailLongitude">Longitude:</label>
                        <input type="number" id="trailLongitude" name="longitude" value="${updatedTrail.longitude}"><br>

                        <label for="trailLength">Length (miles):</label>
                        <input type="number" id="trailLength" name="lengthInMiles" value="${updatedTrail.lengthInMiles}"><br>

                        <label for="trailDifficulty">Difficulty:</label>
                        <input type="text" id="trailDifficulty" name="trailDifficulty" value="${updatedTrail.trailDifficulty}"><br>

                        <button type="submit">Update Trail</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p>No trail details available.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
