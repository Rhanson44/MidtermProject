<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>National Parks</title>
    <style>
        .park-item {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }
        .park-item img {
            width: 400px; /* Adjust the size as needed */
            height: auto;
            border-radius: 5px;
        }
        .park-item h2 {
            margin: 10px 0;
        }
        .park-item p {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>


    <h1>National Parks</h1>
    <c:if test="${not empty parks}">
            <c:forEach var="park" items="${parks}">
                <div class="park-item"><center>
                    <h2>${park.name}</h2>
                    <a href="${park.websiteUrl}" target="_blank">
                        <img src="${park.imageUrl}" alt="${park.name}"/>
                    </a>
                    <p><strong>Description:</strong> ${park.description}</p>
                    <p><strong>State:</strong> ${park.state}</p>
                    <p><strong>Established:</strong> ${park.year}</p>
                    <p><strong>Entry Price:</strong> ${park.price}</p>
              </center>  </div>
            </c:forEach>
    </c:if>
   <c:if test="${empty parks}">
        <p>No parks found.</p>
    </c:if>
<!--     <div> 
    <a class="icon-link" href="#">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
   </use>
</svg>
  Icon link
</a>
    </div>
 -->
 </body>
</html>