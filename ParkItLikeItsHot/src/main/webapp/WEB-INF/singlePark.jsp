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
</body>
</html>
</html>