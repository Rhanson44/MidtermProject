<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/account.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
	<!-- TODO: fix accordion -->
    <main class="account">
        <jsp:include page="nav.jsp" />
        <div class="container mt-4">
        <br>
            <h1>User Profile</h1>
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button"
                                data-toggle="collapse" data-bs-target="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                            Username
                        </button>
                    </h2>
                    
                        <div class="accordion-body">
                            <p>
                                <c:out value="${sessionScope.username}" />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button"
                                data-toggle="collapse" data-bs-target="#collapseTwo"
                                aria-expanded="false" aria-controls="collapseTwo">
                            Status
                        </button>
                    </h2>
                    
                        <div class="accordion-body">
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
              <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" style=" background-color: #c2f2cf;
             border-color: #09331d;
             color: #083008;" type="button"
                                data-toggle="collapse" data-bs-target="#collapseThree"
                                aria-expanded="false" aria-controls="collapseThree";>
                            Park Comments
                       </button>
                    </h2> 
                  
                        <div class="accordion-body"> 
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
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" style=" background-color: #c2f2cf;
             border-color: #09331d; color: #083008;" type="button"
                                data-toggle="collapse" data-bs-target="#collapseFour"
                                aria-expanded="false" aria-controls="collapseFour">
                            Point of Interest Comments
                        </button>
                    </h2>
                    
                        <div class="accordion-body">
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
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFive">
                        <button class="accordion-button collapsed" style=" background-color: #c2f2cf;
             border-color: #09331d; color: #083008;" type="button"
                                data-toggle="collapse" data-bs-target="#collapseFive"
                                aria-expanded="false" aria-controls="collapseFive">
                            Trail Comments
                        </button>
                    </h2>
                  
                        <div class="accordion-body">
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
