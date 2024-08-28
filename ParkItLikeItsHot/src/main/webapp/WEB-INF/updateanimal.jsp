<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Animal Details</title>
</head>
<body>

<c:choose>
    <c:when test="${not empty animal}">
        <form action="updateAnimal.do" method="POST">
    <input type="hidden" name="id" value="${animal.id}" />

    <label for="aninmalName">Name:</label>
    <input type="text" id="animalName" name="name" value="${animal.name}" required><br><br>

    <label for="animalType">Animal Type:</label>
    <input type="text" id="animalType" name="type" value="${animal.animalType}"><br><br>

    <label for="animalTypeDescription">Description:</label>
    <input type="text" id=animalTypeDescription"" name="description" value="${animalType.description}"><br><br>

    <label for="animalEndangered">Endangered (Yes/No):</label>
    <input type="text" id="animalEndangered" name="endangered" value="${animal.endangered}"><br><br>
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
