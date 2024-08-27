<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<jsp:include page="nav.jsp"/>

<div class="container">
    <h2>User Profile</h2>
    
    <div class="alert alert-info">
        <strong>Username:</strong> <c:out value="${sessionScope.username}" />
    </div>
    <div class="alert alert-info">
        <strong>Status:</strong> 
        <c:choose>
            <c:when test="${sessionScope.loggedInUser.enabled}">
                Active
            </c:when>
            <c:otherwise>
                Inactive
            </c:otherwise>
        </c:choose>
    </div>
    
	</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
