<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<nav>
<c:if test="${not empty loggedInUser}">
	<a href="home.do">Home</a>
	<a href="account.do">Account</a>
	<a href="logout.do">Logout</a>
	</c:if>
	<c:if test="${empty loggedInUser}">
	
	<a href="home.do">Home</a>
	<a href="login.do">Login</a>
	</c:if>
</nav>