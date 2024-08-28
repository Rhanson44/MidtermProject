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
    	body { 
    		background-color: #d7f3f1
    	}
        .container {
            margin-top: 50px;
        }
        .card-header {
            background-color: #4d7654;
            color: white;
        }
        .card-body {
            background-color: #eaf4e1;
        }
        .card-body ul {
            padding-left: 1.25rem;
        }
        .alert-info {
            background-color: #d4e5d5;
            color: #333;
        }
        .alert-info strong {
            color: #4d7654;
        }
    </style>
</head>
<body>
<jsp:include page="nav.jsp"/>

<div class="container">
    <h2>User Profile</h2>
    
    <!-- Username Section -->
    <div class="card mb-3">
        <div class="card-header">
            Username
        </div>
        <div class="card-body">
            <p class="card-text"><strong>Username:</strong> <c:out value="${sessionScope.username}" /></p>
        </div>
    </div>
    
    <!-- Status Section -->
    <div class="card mb-3">
        <div class="card-header">
            Status
        </div>
        <div class="card-body">
            <p class="card-text">
                <c:choose>
                    <c:when test="${sessionScope.loggedInUser.enabled}">
                        Active
                    </c:when>
                    <c:otherwise>
                        Inactive
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </div>
    
    <!-- Park Comments Section -->
    <div class="card mb-3">
        <div class="card-header">
            Park Comments
        </div>
        <div class="card-body">
            <c:choose>
                <c:when test="${not empty user.nationalParkComments}">
                    <ul>
                        <c:forEach var="comment" items="${user.nationalParkComments}">
                            <li>${comment.content}</li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>No comments available.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <!-- Point of Interest Comments Section -->
    <div class="card mb-3">
        <div class="card-header">
            Point of Interest Comments
        </div>
        <div class="card-body">
            <c:choose>
                <c:when test="${not empty user.poiComments}">
                    <ul>
                        <c:forEach var="comment" items="${user.poiComments}">
                            <li>${comment.content}</li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>No comments available.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <!-- Trail Comments Section -->
    <div class="card mb-3">
        <div class="card-header">
            Trail Comments
        </div>
        <div class="card-body">
            <c:choose>
                <c:when test="${not empty user.trailComments}">
                    <ul>
                        <c:forEach var="comment" items="${user.trailComments}">
                            <li>${comment.content}</li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>No comments available.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
