<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(to bottom, #a0d6ff, #698c2e);
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 1rem;
            background-color: #f0f0f0;
            border: 1px solid #698c2e;
        }
        .card-title, .card-subtitle {
            color: #698c2e;
        }
        .form-label {
            color: #333;
        }
        .form-control {
            background-color: #fff;
        }
        .btn-primary {
            background-color: #698c2e;
            border-color: #698c2e;
        }
        .btn-primary:hover {
            background-color: #4a6520;
            border-color: #4a6520;
        }
        .text-success {
            color: #28a745;
        }
        .text-danger {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div class="card-container">
        <div class="card-header text-center card-title">
            <h4>Login</h4>
        </div>
        <div class="card-body">
            <form action="login.do" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </div>
                <div class="text-center">
                    <a href="registerForm.do">Don't have an account? Register here.</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9oyzG5u3gk4QY1e1lARk8tOStOyz5OHbbzyJ4+HkSl5cZGyxGSAw" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-mQ93wJ6EYSHq6bqB6J9k2qEpxMivbJ0yJ8IGIm5yZdYkFJ8iR7O5wCk0SgtE0oHw" crossorigin="anonymous"></script>
</body>
</html>
