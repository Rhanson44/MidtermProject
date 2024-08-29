<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>National Parks</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="nav.jsp"/>
<div
  class="bg-image"
  style="
    background-image: url('https://wallpaperaccess.com/full/1129092.jpg');
    height: 100vh;
    background-size: cover;
    background-position: center;
  ">
	<br>
    <h1>National Parks</h1>
    
    <div class="container mt-4">
        <c:if test="${not empty parks}">
            <div id="parksCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach var="park" items="${parks}" varStatus="status">
                        <c:if test="${status.first}">
                            <div class="carousel-item active">
                        </c:if>
                        <c:if test="${not status.first}">
                            <div class="carousel-item">
                        </c:if>
                            <img src="${park.imageUrl}" alt="${park.name}"/>
                            <div class="carousel-caption d-none d-md-block">
                                <h5>${park.name}</h5>
                                <p><strong>Description:</strong> ${park.description}</p>
                                <p><strong>State:</strong> ${park.state}</p>
                                <p><strong>Established:</strong> ${park.year}</p>
                                <p><strong>Entry Price:</strong> ${park.price}</p>
                                <a href="${park.websiteUrl}" target="_blank" class="btn btn-primary">Visit Website</a>
                                <a href="singlePark.do?parkId=${park.id}" class="btn btn-secondary">View More Information</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <a class="carousel-control-prev" href="#parksCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#parksCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </c:if>
        <c:if test="${empty parks}">
            <p>No parks found.</p>
        </c:if>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
