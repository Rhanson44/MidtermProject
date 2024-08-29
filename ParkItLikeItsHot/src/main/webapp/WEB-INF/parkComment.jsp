<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/comment.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Comment Section</title>
</head>
<body>

	<jsp:include page="nav.jsp" />
	<br>
	<c:if test="${not empty loggedInUser}">
	<main>
		<section   class="bg-image" 
  style= "background-image: url('https://mdbcdn.b-cdn.net/img/new/fluid/nature/012.webp');
    height: 100vh;" >
      <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
    		<br>
			<h1 class="text-center my-4 title">${park.name} Comment Section</h1>
			<div class="comment-section container my-5 py-5 text-body">
				<div class="row d-flex justify-content-center">
					<div class="col-md-12 col-lg-10 col-xl-8">
						<c:if test="${not empty loggedInUser}">
							<form action="postParkComment.do" method="POST">
								<input type="hidden" name="parkId" value="${park.id}">
								<div class="form-group">
									<textarea class="form-control" name="content" rows="4"
										placeholder="Write your comment here..." required></textarea>
								</div>
								<!-- <div class="form-group mt-2">
									<input type="text" class="form-control" name="imageUrl"
										placeholder="Optional: Image URL">
								</div> -->
								
								<button type="submit" class="btn btn-primary mt-2">Post
									a Comment</button>
							</form>
						</c:if>
						<div class="my-4">
							<c:forEach var="comment" items="${comments}">
								<div class="card mb-3">
									<div class="card-body">
										<div class="d-flex flex-start">
											<img class="rounded-circle shadow-1-strong me-3"
												src="https://static.wikia.nocookie.net/smiling-friends/images/e/e6/Glep_%28SF%29.png/revision/latest/thumbnail/width/360/height/360?cb=20240204175445"
												alt="avatar" width="40" height="40" />
											<div class="w-100">
												<div
													class="d-flex justify-content-between align-items-center mb-3">
													<h6 class="text-primary fw-bold mb-0">${comment.user.username}</h6>
													<p class="mb-0">${comment.createDate}</p>
												</div>
												<p class="mb-0">${comment.content}</p>
												<c:if test="${loggedInUser.username == 'admin' || comment.user.username == loggedInUser.username}">
													<form action="deleteParkComment.do" method="POST"
														onsubmit="return confirm('Are you sure you want to delete this comment?');">
														<input type="hidden" name="parkId" value="${park.id}">
														<input type="hidden" name="commentId"
															value="${comment.id}">
														<button type="submit" class="btn btn-danger btn-sm">Delete</button>
													</form>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
		</main>
	</c:if>
	<c:if test="${empty loggedInUser}">
		<div class="reroute">
		<div class="container text-center my-5">
			<p>Please Log in to view and post comments.</p>
			<a class="btn btn-primary" href="login.do">Login</a> <a
				class="btn btn-secondary" href="registerForm.do">Register</a>
		</div>
		</div>
	</c:if>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>
</html>
