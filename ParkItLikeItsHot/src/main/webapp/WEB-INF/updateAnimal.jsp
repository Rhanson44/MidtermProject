<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Animal</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/update.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <section class="bg-image" style="background-image: url('https://www.havahart.com/media/Articles/Havahart/How-Animals-Survive-in-Winter.jpg');">
        <div class="mask">
            <h2>Edit Animal</h2>
            <c:choose>
                <c:when test="${not empty updatedAnimal}">
                    <form action="updateAnimal.do" method="POST">
                        <input type="hidden" name="id" value="${updatedAnimal.id}" />
                        <label for="animalName">Name:</label>
                        <input type="text" id="animalName" name="name" value="${updatedAnimal.name}"><br>
                        <label for="animalType">Animal Type:</label>
                        <input type="text" id="animalType" name="animalType.id" value="${updatedAnimal.animalType.id}"><br>
                        <label for="animalEndangered">Endangered:</label>
                        <input type="text" id="animalEndangered" name="endangered" value="${updatedAnimal.endangered}"><br>
                        <label for="animalImageUrl">Image URL:</label>
                        <input type="text" id="animalImageUrl" name="imageUrl" value="${updatedAnimal.imageUrl}"><br>
                        <button type="submit">Update Animal</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p>No animal details available.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
