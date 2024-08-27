<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Comment Section</title>
</head>
<body>
<jsp:include page="nav.jsp"/>

    <c:if test="${not empty loggedInUser}">

        <section style="background-color: #f7f6f6;"> 
           <form action="comment.do" method="GET">
                <input type="hidden" name="parkId" value="${park.id}">
			</form>
            <h1>${park.name} Comment Section</h1>
            <div class="container my-5 py-5 text-body">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-12 col-lg-10 col-xl-8">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="card">
                                <div class="card-body p-2 d-flex align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <c:forEach var="comment" items= "${comments}">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="d-flex flex-start">
                                        <img class="rounded-circle shadow-1-strong me-3"
                                            src="https://static.wikia.nocookie.net/smiling-friends/images/e/e6/Glep_%28SF%29.png/revision/latest/thumbnail/width/360/height/360?cb=20240204175445" alt="avatar" width="40"
                                            height="40" />
                                        <div class="w-100">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h6 class="text-primary fw-bold mb-0">${comment.user.username}
                                                    <span class="text-body ms-2">${comment.content}</span>
                                                </h6>
                                                <p class="mb-0">${comment.createDate}</p>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <p class="small mb-0" style="color: #aaa;">
                                                    <c:if test="${loggedInUser.username == 'admin'}">
                                                        <a href="#!" class="link-grey">Remove</a> •
                                                    </c:if>
                                                    <c:if test="${not empty loggedInUser}">

             <%--            <form action="postComment.do" method="POST">
                            <input type="hidden" name="parkId" value="${park.id}">
                            <textarea name="content" rows="4" placeholder="Write your comment here..." required></textarea>
                            <button type="submit" class="btn btn-primary mt-2">Post a Comment</button>
                        </form>
                                        --%>                 
                                                    </c:if>
                                                </p>
                                                <div class="d-flex flex-row">
                                                    <i class="far fa-check-circle text-primary"></i>
                                                         <c:if test="${empty loggedInUser}">
    <div class="container text-center">
        <p>Please Log in to view and post comments.</p>
        <a class="btn btn-primary" href="login.do">Login</a>
        <a class="btn btn-secondary" href="registerForm.do">Register</a>
    </div>
</c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
    </c:if>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
