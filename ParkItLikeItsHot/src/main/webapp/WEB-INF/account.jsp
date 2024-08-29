<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/account.css">
</head>
<body>
    <main class="account">
        <jsp:include page="nav.jsp" />
        <div class="container mt-4">
        <br>
            <h1>User Profile</h1>
            <div class="row">
                <!-- Username Card -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-header">
                            Username
                        </div>
                        <div class="card-body">
                            <p><c:out value="${sessionScope.username}" /></p>
                        </div>
                    </div>
                </div>

                <!-- Status Card -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-header">
                            Status
                        </div>
                        <div class="card-body">
                            <p>
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
                </div>

                <!-- Park Comments Card -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-header">
                            Park Comments
                        </div>
                        <div class="card-body section-content">
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
                </div>

                <!-- Point of Interest Comments Card -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-header">
                            Point of Interest Comments
                        </div>
                        <div class="card-body section-content">
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
                </div>

                <!-- Trail Comments Card -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-header">
                            Trail Comments
                        </div>
                        <div class="card-body section-content">
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
            </div>
        </div>
    </main>
    <div class="image-banner"></div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
