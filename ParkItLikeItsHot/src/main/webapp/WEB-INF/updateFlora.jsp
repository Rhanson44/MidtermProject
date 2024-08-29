<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Flora</title>
</head>
<body>
	<h2>Edit Flora</h2>
	<c:choose>
    <c:when test="${not empty updatedFlora}">
        <form action="updateFlora.do" method="POST">
    <input type="hidden" name="id" value="${updatedFlora.id}" />

    <label for="floraName">Name:</label>
    <input type="text" id="floraName" name="name" value="${updatedFlora.name}"><br><br> 

    <label for="floraSpecies">Species:</label>
    <input type="text" id="floraSpecies" name="species" value="${updatedFlora.species}"><br><br>

    <label for="floraType">Type:</label>
    <input type="text" id="floraType" name="floraType.id" value="${updatedFlora.floraType.id}"><br><br>

    <label for="floraImageUrl">Image URL:</label>
    <input type="text" id="floraImageUrl" name="imageUrl" value="${updatedFlora.imageUrl}" ><br><br>
            <br>
            <br>
            <button type="submit">Update Flora</button>
        </form>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</body>
</html>