<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Flora</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/update.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <section class="bg-image" style="background-image: url('https://i.pinimg.com/736x/19/2b/5e/192b5ea67aa0dc0df792315d88406ab3.jpg');">
        <div class="mask">
            <h2>Edit Flora</h2>
            <c:choose>
                <c:when test="${not empty updatedFlora}">
                    <form action="updateFlora.do" method="POST">
                        <input type="hidden" name="id" value="${updatedFlora.id}" />

                        <label for="floraName">Name:</label>
                        <input type="text" id="floraName" name="name" value="${updatedFlora.name}"><br>

                        <label for="floraSpecies">Species:</label>
                        <input type="text" id="floraSpecies" name="species" value="${updatedFlora.species}"><br>

                        <label for="floraType">Type:</label>
                        <input type="text" id="floraType" name="floraType.id" value="${updatedFlora.floraType.id}"><br>

                        <label for="floraImageUrl">Image URL:</label>
                        <input type="text" id="floraImageUrl" name="imageUrl" value="${updatedFlora.imageUrl}"><br>

                        <button type="submit">Update Flora</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p>No flora details available.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <label for="floraImageUrl">Image URL:</label>
    <input type="text" id="floraImageUrl" name="imageUrl" value="${updatedFlora.imageUrl}" ><br><br>
            <br>
            <br>
            <button type="submit">Update Flora</button>
        </form>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</body>
</html>
