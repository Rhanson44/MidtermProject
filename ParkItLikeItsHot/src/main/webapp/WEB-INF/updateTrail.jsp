<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Trail</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<style>
        body {
            background-image: url(https://miro.medium.com/v2/resize:fit:4800/format:webp/1*FxU-9wi9iZAPznXL5Ph1mg.jpeg); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 5px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: 0 auto;
            text-align: center;
            max-height: 300px;
            overflow-y: auto;
   		}
    	form input, form select {
        	display: block;
        	margin: 0 auto 10px auto;
    	}
        }
</style>
</head>
	<body>
	<jsp:include page="nav.jsp"/>
		<h2 style="text-align: center;">Edit Trail</h2>
		<c:choose>
    		<c:when test="${not empty updatedTrail}">
        	<form action="updateTrail.do" method="POST">
    		<input type="hidden" name="id" value="${updatedTrail.id}" />

    		<label for="trailName">Name:</label>
  			<input type="text" id="trailName" name="name" value="${updatedTrail.name}" required><br><br> 

    		<label for="trailDescription">Description:</label>
    		<input type="text" id="trailDescription" name="description" value="${updatedTrail.description}"><br><br>

    		<label for="trailLatitude">Latitude:</label>
    		<input type="number" id="trailLatitude" name="latitude" value="${updatedTrail.latitude}"><br><br>

    		<label for="trailLongitude">Longitutde:</label>
   		    <input type="number" id="trailLongitude" name="longitude" value="${updatedTrail.longitude}" ><br><br>

   		    <label for="trailLength">Length (miles):</label>
   		    <input type="number" id="trailLengthInMiles" name="lengthInMiles" value="${updatedTrail.lengthInMiles}"><br><br>

    		<label for="trailDifficulty">Difficulty:</label>
    		<input type="text" id="trailDifficulty" name="trailDifficulty" value="${updatedTrail.trailDifficulty}"><br><br>


            <br>
            <br>
            <button type="submit">Update Trail</button>
        </form>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</body>
</html>