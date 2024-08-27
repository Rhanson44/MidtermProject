<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<nav class="navbar fixed-top navbar-light" style="background-color: #8fc1ad ;">
<a class="navbar-brand" href="#">Park It Like It's Hot</a>
<c:if test="${not empty loggedInUser}">
	<a href="index.do">Home</a>
	<a href="park.do">All Parks</a>
	<a href="account.do">Account</a>
	<a href="logout.do">Logout</a>


	</c:if>
	<c:if test="${empty loggedInUser}">
	<a href="park.do">All Parks</a>
	<a href="home.do">Home</a>
	<a href="login.do">Login</a>
	<a href="registerForm.do">Register a New Account</a>
	</c:if>
</nav>