<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Animal</title>
</head>
<body>
	<h2>Edit Animal</h2>
<c:choose>
    <c:when test="${not empty updatedAnimal}">
        <form action="updateAnimal.do" method="POST">
    <input type="hidden" name="id" value="${updatedAnimal.id}" />

    <label for="animalName">Name:</label>
    <input type="text" id="animalName" name="name" value="${updatedAnimal.name}"><br><br>

    <label for="animalType">Animal Type:</label>
    <input type="text" id="animalType" name="type" value="${updatedAnimal.animalType.name}"><br><br>

    <label for="animalEndangered">Endangered:</label>
    <input type="text" id="animalEndangered" name="endangered" value="${updatedAnimal.endangered}"><br><br>
    
    <label for="animalImageUrl">Image URL:</label>
    <input type="text" id="animalImageUrl" name="image" value="${updatedAnimal.imageUrl}"><br><br>
            <br>
            <br>
            <button type="submit">Update Animal</button>
        </form>
    </c:when>
    <c:otherwise>
        <p>No animal details available.</p>
    </c:otherwise>
</c:choose>

</body>
</html>
