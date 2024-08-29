<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Animal</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
	<style>
        body {
            background-image: url(https://www.fws.gov/sites/default/files/2021-10/elk_gannon%20castle%20%2824%29.jpg); /* Path to your image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 5px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: 0 auto;
            text-align: center;
            max-height: 300px;
            overflow-y: auto;
   		}
    	form input, form select {
        	display: block;
        	margin: 0 auto 10px auto;
    	}
        }
   </style>
</head>
<body>
	<jsp:include page="nav.jsp"/>
	<h2 style="text-align: center;">Edit Animal</h2>
<c:choose>
    <c:when test="${not empty updatedAnimal}">
        <form action="updateAnimal.do" method="POST">
    <input type="hidden" name="id" value="${updatedAnimal.id}" />

    <label for="animalName">Name:</label>
    <input type="text" id="animalName" name="name" value="${updatedAnimal.name}"><br><br>

    <label for="animalType">Animal Type:</label>
    <input type="text" id="animalType" name="animalType.id" value="${updatedAnimal.animalType.id}"><br><br>
<!-- TODO: add a select list named animalType.id with options by iterating over items in ${animalTypes} -->

    <label for="animalEndangered">Endangered:</label>
    <input type="text" id="animalEndangered" name="endangered" value="${updatedAnimal.endangered}"><br><br>
    
    <label for="animalImageUrl">Image URL:</label>
    <input type="text" id="animalImageUrl" name="imageUrl" value="${updatedAnimal.imageUrl}"><br><br>
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
