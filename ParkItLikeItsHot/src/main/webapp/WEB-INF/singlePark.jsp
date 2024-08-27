<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
   <title>Animals in Park</title>
</head>
<body>
   
    <c:if test="${not empty park.animals}">
    <form action="singlePark.do" method="GET">
                <input type="hidden" name="id" value="${park.id}">
			</form>
        <ul>
         <h1>Animals in the ${park.name}</h1>
    
            <c:forEach var="animal" items="${park.animals}">
                <li>
                    <strong>Name:</strong> ${animal.name} <br>
                    <strong>Type:</strong> ${animal.animalType.name} <br>
                    <strong>Type:</strong> ${animal.animalType.description} <br>
                    <strong>Endangered:</strong> ${animal.endangered} <br>
                    <img src="${animal.imageUrl}" alt="${animal.name}" style="width:200px;">
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty park.flora}">
        <p>No flora found for this park.</p>
    </c:if>
     <c:if test="${not empty park.flora}">
    <form action="singlePark.do" method="GET">
                <input type="hidden" name="id" value="${park.id}">
			</form>
        <ul>
         <h1>Flora in the ${park.name}</h1>
    
            <c:forEach var="flora" items="${park.flora}">
                <li>
                    <strong>Name:</strong> ${flora.name} <br>
                    <strong>Species:</strong> ${flora.species} <br>
                    <strong>Type:</strong> ${flora.floraType.name} <br>
                    <strong>Type:</strong> ${flora.floraType.description} <br>
                    <img src="${flora.imageUrl}" alt="${flora.name}" style="width:200px;">
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty park.flora}">
        <p>No flora found for this park.</p>
    </c:if>
     <c:if test="${not empty park.mountains}">
    <form action="singlePark.do" method="GET">
                <input type="hidden" name="id" value="${park.id}">
			</form>
        <ul>
         <h1>Mountians in the ${park.name}</h1>
    
            <c:forEach var="mountain" items="${park.mountains}">
                <li>
                   <h2> <strong>Name:</strong> ${mountain.name}</h2> <br>
                    <strong>Elevation (Meters):</strong> ${mountain.elevationInMeters} <br>
                    <strong>Average Snowfall:</strong> ${mountain.averageSnowfall} <br>
                    <strong>Description:</strong> ${mountain.description} <br>
                    <img src="${mountain.imageUrl}" alt="${mountain.name}" style="width:200px;">
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty park.mountains}">
        <p>No mountains found for this park.</p>
    </c:if>
     <c:if test="${not empty park.interests}">
    <form action="singlePark.do" method="GET">
                <input type="hidden" name="id" value="${park.id}">
			</form>
        <ul>
         <h1>Points of Interests in the ${park.name}</h1>
    
            <c:forEach var="interest" items="${park.interests}">
                <li>
                    <h2><strong>Name:</strong> ${interest.name}</h2> <br>
                    <img src="${interest.imageUrl}" alt="${interest.name}" style="width:200px;"><br>
                    <strong>${interest.name} Description:</strong> ${interest.description} <br>
                    <strong>Longitude:</strong> ${interest.longitude} <br>
             <%--       <strong> Type:</strong> ${interest.interestTypes} <br>
                 <strong> ${interest.interestTypes} Description:</strong> ${interest.interestTypes.description} <br> --%> 
                    <strong>Latitude:</strong> ${interest.latitude} <br>
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty park.interests}">
        <p>No Points of Interests found for this park.</p>
    </c:if>

     <c:if test="${not empty park.trails}">
    <form action="singlePark.do" method="GET">
                <input type="hidden" name="id" value="${park.id}">
			</form>
        <ul>
         <h1>Trails in the ${park.name}</h1>
    
            <c:forEach var="trail" items="${park.trails}">
                <li>
                    <h2><strong>Name:</strong> ${trail.name}</h2> <br>
                    <img src="${trail.trailMap}" alt="${trail.name}" style="width:200px;"><br>
                    <strong>${trail.name} Description:</strong> ${trail.description} <br>
                    <strong> Difficulty:</strong> ${trail.trailDifficulty} <br>
                    <strong> Length(Miles):</strong> ${trail.lengthInMiles} <br>
                    <strong>Longitude:</strong> ${interest.longitude} <br>
                    <strong>Latitude:</strong> ${interest.latitude} <br>
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty park.trails}">
        <p>No Trails found for this park.</p>
    </c:if>
</body>
</html>
</html>