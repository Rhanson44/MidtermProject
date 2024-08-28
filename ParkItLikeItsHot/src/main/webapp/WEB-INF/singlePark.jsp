<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>${park.name} Info</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            min-height: 120px;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp"/>
	<br>
    <div class="container">
        <div class="my-4">
            <h1 class="text-center mb-4">
                <a href="comment.do?parkId=${park.id}" class="btn btn-primary">Comment Section</a>
            </h1>

            <!-- Animals Section -->
            <c:if test="${not empty park.animals}">
                <div class="my-4">
                    <h2>Animals in the ${park.name}</h2>
                    <div class="row">
                        <c:forEach var="animal" items="${park.animals}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="${animal.imageUrl}" class="card-img-top" alt="${animal.name}">
                                    <div class="card-body">
                                        <h5 class="card-title">${animal.name}</h5>
                                        <p><strong>Type:</strong> ${animal.animalType.name}</p>
                                        <p><strong>Description:</strong> ${animal.animalType.description}</p>
                                        <p><strong>Endangered:</strong> ${animal.endangered}</p>
                                        <form action="deleteAnimal.do" method="post" style="display: inline;">
                                            <input type="hidden" name="animalId" value="${animal.id}" />
                                            <input type="hidden" name="parkId" value="${park.id}" />
                                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty park.animals}">
                <p>No animals found for this park.</p>
            </c:if>

            <!-- Flora Section -->
            <c:if test="${not empty park.flora}">
                <div class="my-4">
                    <h2>Flora in the ${park.name}</h2>
                    <div class="row">
                        <c:forEach var="flora" items="${park.flora}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="${flora.imageUrl}" class="card-img-top" alt="${flora.name}">
                                    <div class="card-body">
                                        <h5 class="card-title">${flora.name}</h5>
                                        <p><strong>Species:</strong> ${flora.species}</p>
                                        <p><strong>Type:</strong> ${flora.floraType.name}</p>
                                        <p><strong>Description:</strong> ${flora.floraType.description}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty park.flora}">
                <p>No flora found for this park.</p>
            </c:if>

            <!-- Mountains Section -->
            <c:if test="${not empty park.mountains}">
                <div class="my-4">
                    <h2>Mountains in the ${park.name}</h2>
                    <div class="row">
                        <c:forEach var="mountain" items="${park.mountains}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="${mountain.imageUrl}" class="card-img-top" alt="${mountain.name}">
                                    <div class="card-body">
                                        <h5 class="card-title">${mountain.name}</h5>
                                        <p><strong>Elevation (Meters):</strong> ${mountain.elevationInMeters}</p>
                                        <p><strong>Average Snowfall:</strong> ${mountain.averageSnowfall}</p>
                                        <p><strong>Description:</strong> ${mountain.description}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty park.mountains}">
                <p>No mountains found for this park.</p>
            </c:if>

            <!-- Points of Interest Section -->
            <c:if test="${not empty park.interests}">
                <div class="my-4">
                    <h2>Points of Interest in the ${park.name}</h2>
                    <div class="row">
                        <c:forEach var="interest" items="${park.interests}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="${interest.imageUrl}" class="card-img-top" alt="${interest.name}">
                                    <div class="card-body">
                                        <h5 class="card-title">${interest.name}</h5>
                                        <p><strong>Description:</strong> ${interest.description}</p>
                                        <p><strong>Longitude:</strong> ${interest.longitude}</p>
                                        <p><strong>Latitude:</strong> ${interest.latitude}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty park.interests}">
                <p>No points of interest found for this park.</p>
            </c:if>

            <!-- Trails Section -->
            <c:if test="${not empty park.trails}">
                <div class="my-4">
                    <h2>Trails in the ${park.name}</h2>
                    <div class="row">
                        <c:forEach var="trail" items="${park.trails}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="${trail.trailMap}" class="card-img-top" alt="${trail.name}">
                                    <div class="card-body">
                                        <h5 class="card-title">${trail.name}</h5>
                                        <p><strong>Description:</strong> ${trail.description}</p>
                                        <p><strong>Difficulty:</strong> ${trail.trailDifficulty}</p>
                                        <p><strong>Length (Miles):</strong> ${trail.lengthInMiles}</p>
                                        <p><strong>Longitude:</strong> ${trail.longitude}</p>
                                        <p><strong>Latitude:</strong> ${trail.latitude}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty park.trails}">
                <p>No trails found for this park.</p>
            </c:if>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
