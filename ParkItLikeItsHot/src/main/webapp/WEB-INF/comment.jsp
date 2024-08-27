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
                        
                        <c:forEach items="${comments}" var="comment">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="d-flex flex-start">
                                        <img class="rounded-circle shadow-1-strong me-3"
                                            src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(14).webp" alt="avatar" width="40"
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
                                                        <a href="#!" class="link-grey">Reply</a> •
                                                    </c:if>
                                                </p>
                                                <div class="d-flex flex-row">
                                                    <i class="far fa-check-circle text-primary"></i>
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
