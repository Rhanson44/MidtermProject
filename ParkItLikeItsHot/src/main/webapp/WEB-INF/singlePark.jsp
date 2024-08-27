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
                    <strong>Endangered:</strong> ${animal.endangered} <br>
                    <img src="${animal.imageUrl}" alt="${animal.name}" style="width:200px;">
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty park.animals}">
        <p>No animals found for this park.</p>
    </c:if>
</body>
</html>
</html>