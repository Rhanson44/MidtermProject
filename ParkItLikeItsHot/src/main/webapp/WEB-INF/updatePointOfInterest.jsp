<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Point of Interest</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/update.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <section class="bg-image" style="background-image: url('https://i0.wp.com/pagelakepowellhub.com/wp-content/uploads/2023/02/HorseshoeBEndSM.webp');">
        <div class="mask">
            <h2>Edit Point of Interest</h2>
            <c:choose>
                <c:when test="${not empty updatedPointOfInterest}">
                    <form action="updatePointOfInterest.do" method="POST">
                        <input type="hidden" name="id" value="${updatedPointOfInterest.id}" />

                        <label for="poiName">Name:</label>
                        <input type="text" id="poiName" name="name" value="${updatedPointOfInterest.name}" required><br>

                        <label for="poiDescription">Description:</label>
                        <input type="text" id="poiDescription" name="description" value="${updatedPointOfInterest.description}"><br>

                        <label for="poiLatitude">Latitude:</label>
                        <input type="number" id="poiLatitude" name="latitude" value="${updatedPointOfInterest.latitude}"><br>

                        <label for="poiLongitude">Longitude:</label>
                        <input type="number" id="poiLongitude" name="longitude" value="${updatedPointOfInterest.longitude}"><br>

                        <label for="poiImageUrl">Image Url:</label>
                        <input type="text" id="poiImageUrl" name="imageUrl" value="${updatedPointOfInterest.imageUrl}"><br>

                        <button type="submit">Update Point of Interest</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p>No details available.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
