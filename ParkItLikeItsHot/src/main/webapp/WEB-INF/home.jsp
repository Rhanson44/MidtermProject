<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/home.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Bovino:wght@500&family=Nexa+Textbook:wght@400&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Park It Like It's Hot</title>
</head>
<body>
<main class="home">
<jsp:include page="nav.jsp"/>

<div
  class="bg-image"
  style="
    background-image: url('https://www.travelandleisure.com/thmb/5vZ1_vfWVAUnj0fn-cg-OL_Jy5g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/TAL-header-mount-rainier-national-park-washington-USNP0323-a21fa46048a84a49ad34db7d689300ff.jpg');
    height: 100vh;
    background-size: cover;
    background-position: center;
  ">
  <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
    <div class="container h-100 d-flex flex-column justify-content-center align-items-center">
      <h1 class="title mb-0">Park It Like It's Hot</h1>
      <h3 class="sub-title mt-3">Explore nature's hottest spots</h3>
    </div>
  </div>
</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
