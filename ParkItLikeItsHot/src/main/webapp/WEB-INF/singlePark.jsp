<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>${park.name} Info</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/singlePark.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    
    <!-- Side Panels -->
    <div class="side-panel left-panel"></div>
    <div class="side-panel right-panel"></div>

    <div class="container">
        <br>
        <div class="title-container text-center">
            <h1 class="section-title">${park.name} Info</h1>
            <a href="parkComment.do?parkId=${park.id}" class="btn btn-primary btn-sm mt-3">Comment Section</a>
        </div>
        <br>
        <br>
        <!-- Animals Section -->
        <c:if test="${not empty park.animals}">
            <div class="row justify-content-center">
                <c:forEach var="animal" items="${park.animals}">
                    <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center">
                        <div class="card">
                            <img src="${animal.imageUrl}" class="card-img-top" alt="${animal.name}">
                            <div class="card-body">
                                <h5 class="card-title">${animal.name}</h5>
                                <p><strong>Type:</strong> ${animal.animalType.name}</p>
                                <p><strong>Description:</strong> ${animal.animalType.description}</p>
                                <p><strong>Endangered:</strong> ${animal.endangered}</p>
                                <a href="updateAnimal.do?animalId=${animal.id}&parkId=${park.id}" class="btn btn-primary btn-sm">Update</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty park.animals}">
            <p>No animals found for this park.</p>
        </c:if>
        
        <!-- Flora Section -->
        <c:if test="${not empty park.flora}">
            <div class="row justify-content-center">
                <c:forEach var="flora" items="${park.flora}">
                    <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center">
                        <div class="card">
                            <img src="${flora.imageUrl}" class="card-img-top" alt="${flora.name}">
                            <div class="card-body">
                                <h5 class="card-title">${flora.name}</h5>
                                <p><strong>Species:</strong> ${flora.species}</p>
                                <p><strong>Type:</strong> ${flora.floraType.name}</p>
                                <p><strong>Description:</strong> ${flora.floraType.description}</p>
                                <a href="updateFlora.do?floraId=${flora.id}&parkId=${park.id}" class="btn btn-primary btn-sm">Update</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty park.flora}">
            <p>No flora found for this park.</p>
        </c:if>

        <!-- Mountains Section -->
        <c:if test="${not empty park.mountains}">
            <div class="row justify-content-center">
                <c:forEach var="mountain" items="${park.mountains}">
                    <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center">
                        <div class="card">
                            <img src="${mountain.imageUrl}" class="card-img-top" alt="${mountain.name}">
                            <div class="card-body">
                                <h5 class="card-title">${mountain.name}</h5>
                                <p><strong>Elevation (Meters):</strong> ${mountain.elevationInMeters}</p>
                                <p><strong>Average Snowfall:</strong> ${mountain.averageSnowfall}</p>
                                <p><strong>Description:</strong> ${mountain.description}</p>
                                <a href="updateMountain.do?mountainId=${mountain.id}&parkId=${park.id}" class="btn btn-primary btn-sm">Update</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty park.mountains}">
            <p>No mountains found for this park.</p>
        </c:if>

        <!-- Points of Interest Section -->
        <c:if test="${not empty park.interests}">
            <div class="row justify-content-center">
                <c:forEach var="interest" items="${park.interests}">
                    <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center">
                        <div class="card">
                            <img src="${interest.imageUrl}" class="card-img-top" alt="${interest.name}">
                            <div class="card-body">
                                <h5 class="card-title">${interest.name}</h5>
                                <p><strong>Description:</strong> ${interest.description}</p>
                                <p><strong>Longitude:</strong> ${interest.longitude}</p>
                                <p><strong>Latitude:</strong> ${interest.latitude}</p>
                                <a href="updateInterest.do?interestId=${interest.id}&parkId=${park.id}" class="btn btn-primary btn-sm">Update</a>
                                <a href="poiComment.do?poiId=${interest.id}" class="btn btn-primary btn-sm">Point of Interest Comments</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty park.interests}">
            <p>No points of interest found for this park.</p>
        </c:if>

        <!-- Trails Section -->
        <c:if test="${not empty park.trails}">
            <div class="row justify-content-center">
                <c:forEach var="trail" items="${park.trails}">
                    <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center">
                        <div class="card">
                            <img src="${trail.trailMap}" class="card-img-top" alt="${trail.name}">
                            <div class="card-body">
                                <h5 class="card-title">${trail.name}</h5>
                                <p><strong>Description:</strong> ${trail.description}</p>
                                <p><strong>Difficulty:</strong> ${trail.trailDifficulty}</p>
                                <p><strong>Length (Miles):</strong> ${trail.lengthInMiles}</p>
                                <p><strong>Longitude:</strong> ${trail.longitude}</p>
                                <p><strong>Latitude:</strong> ${trail.latitude}</p>
                                <a href="updateTrail.do?trailId=${trail.id}&parkId=${park.id}" class="btn btn-primary btn-sm">Update</a>
                                <a href="trailComment.do?trailId=${trail.id}" class="btn btn-primary btn-sm">Trail Comments</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty park.trails}">
            <p>No trails found for this park.</p>
        </c:if>

    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
