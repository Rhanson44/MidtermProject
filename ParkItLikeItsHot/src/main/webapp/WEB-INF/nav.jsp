<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .navbar {
            transition: all 0.3s ease;
            overflow: hidden;
        }
        .navbar-expand {
            max-height: 60px; /* Adjust this height based on your navbar height */
        }
        .navbar-collapse {
            max-height: 0;
            transition: max-height 0.3s ease;
        }
        .navbar-expand:hover .navbar-collapse {
            max-height: 300px; /* Adjust this based on the content height */
        }
        .navbar-nav {
            display: flex;
            flex-direction: row;
        }
        .navbar-nav a {
            padding: 15px 20px; /* Adjust padding for spacing between options */
            text-decoration: none;
            color: #ffffff;
        }
        .navbar-nav a:hover {
            background-color: #6fa08d;
        }
        .navbar-brand {
            padding: 15px;
            color: #ffffff;
            font-size: 1.5rem;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-light navbar-expand fixed-top" style="background-color: #8fc1ad;">
    <a class="navbar-brand" href="#">Park It Like It's Hot</a>
    <div class="navbar-collapse">
        <ul class="navbar-nav">
            <c:if test="${not empty loggedInUser}">
                <li class="nav-item"><a class="nav-link" href="home.do">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="index.do">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="park.do">All Parks</a></li>
                <li class="nav-item"><a class="nav-link" href="account.do">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
            </c:if>
            <c:if test="${empty loggedInUser}">
                <li class="nav-item"><a class="nav-link" href="park.do">All Parks</a></li>
                <li class="nav-item"><a class="nav-link" href="home.do">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="login.do">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="registerForm.do">Register a New Account</a></li>
            </c:if>
        </ul>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
