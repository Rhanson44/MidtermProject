<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>National Parks</title>
    <style>
        .park-item {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }
        .park-item img {
            width: 400px; /* Adjust the size as needed */
            height: auto;
            border-radius: 5px;
        }
        .park-item h2 {
            margin: 10px 0;
        }
        .park-item p {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>
    <h1>National Parks</h1>
    <c:if test="${not empty parks}">
            <c:forEach var="park" items="${parks}">
                <div class="park-item">
                    <h2>${park.name}</h2>
                    <a href="${park.websiteUrl}" target="_blank">
                        <img src="${park.imageUrl}" alt="${park.name}"/>
                    </a>
                    <p><strong>Description:</strong> ${park.description}</p>
                    <p><strong>State:</strong> ${park.state}</p>
                    <p><strong>Established:</strong> ${park.year}</p>
                    <p><strong>Entry Price:</strong> ${park.price}</p>
                </div>
            </c:forEach>
    </c:if>
   <c:if test="${empty parks}">
        <p>No parks found.</p>
    </c:if>
</body>
</html>